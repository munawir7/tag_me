import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Enforces the Clean Architecture dependency rule on every file in
/// lib/features. If this fails, a layer is importing something it must not.
///
///   presentation → application → domain ← data
///
/// * domain: plain Dart. No Flutter, Riverpod, JSON or other layers.
/// * data: implements domain. No application or presentation.
/// * application: wires use cases for screens. No data, no presentation.
/// * presentation: uses application + domain only. Never data or the
///   composition root (app/providers.dart, app/mock).
void main() {
  final files = Directory('lib/features')
      .listSync(recursive: true)
      .whereType<File>()
      .where(
        (f) =>
            f.path.endsWith('.dart') &&
            !f.path.endsWith('.g.dart') &&
            !f.path.endsWith('.freezed.dart'),
      )
      .toList();

  String layerOf(String path) {
    final p = path.replaceAll('\\', '/');
    for (final l in ['domain', 'data', 'application', 'presentation']) {
      if (p.contains('/$l/')) return l;
    }
    return 'other';
  }

  List<String> importsOf(File f) => f
      .readAsLinesSync()
      .where((l) => l.startsWith('import '))
      .map((l) => l.split("'")[1])
      .toList();

  final forbidden = <String, List<Pattern>>{
    'domain': [
      'package:flutter/',
      'package:flutter_riverpod',
      'package:json_annotation',
      '/data/',
      '/application/',
      '/presentation/',
      'app/',
    ],
    'data': ['package:flutter/', '/application/', '/presentation/'],
    'application': ['/data/', '/presentation/', 'app/'],
    'presentation': ['/data/', 'app/providers.dart', 'app/mock/'],
  };

  test('every feature file sits in a known layer', () {
    final stray = files.where((f) => layerOf(f.path) == 'other').toList();
    expect(stray.map((f) => f.path), isEmpty);
  });

  for (final layer in forbidden.keys) {
    test('$layer imports respect the dependency rule', () {
      final problems = <String>[];
      for (final f in files.where((f) => layerOf(f.path) == layer)) {
        for (final imp in importsOf(f)) {
          for (final bad in forbidden[layer]!) {
            if (imp.contains(bad)) problems.add('${f.path}: $imp');
          }
        }
      }
      expect(problems, isEmpty, reason: problems.join('\n'));
    });
  }

  test('screens never touch repositories directly', () {
    final problems = <String>[];
    for (final f in files.where((f) => layerOf(f.path) == 'presentation')) {
      final src = f.readAsStringSync();
      if (RegExp(r'RepositoryProvider\b').hasMatch(src)) problems.add(f.path);
    }
    expect(problems, isEmpty, reason: 'use a use case instead');
  });
}
