import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/app.dart';
import 'app/providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Fonts are bundled in assets/fonts, so never download them at runtime.
  GoogleFonts.config.allowRuntimeFetching = false;
  // Repositories are bound here: mocks for now, the real API later.
  runApp(ProviderScope(overrides: mockOverrides, child: const TagMeApp()));
}
