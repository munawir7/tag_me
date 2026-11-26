import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/tm_text.dart';
import '../../../../core/widgets/widgets.dart';
import '../../application/profile_providers.dart';
import '../../domain/creator.dart';
import '../../domain/usecases/profile_usecases.dart';

/// Opens the "Add a delivery address" form. Returns the saved address, or
/// null if the creator closed it.
Future<Address?> showAddAddressSheet(BuildContext context) =>
    showTmSheet<Address>(
      context: context,
      // The form scrolls by itself and makes room for the keyboard.
      scrollable: false,
      builder: (_) => const _AddAddressSheet(),
    );

class _AddAddressSheet extends ConsumerStatefulWidget {
  const _AddAddressSheet();

  @override
  ConsumerState<_AddAddressSheet> createState() => _AddAddressSheetState();
}

class _AddAddressSheetState extends ConsumerState<_AddAddressSheet> {
  static const _labels = ['Home', 'Work', 'Other'];

  var _label = 'Home';
  final _line = TextEditingController();
  final _area = TextEditingController();
  final _phone = TextEditingController();
  late final _recipient = TextEditingController(
    text: ref.read(creatorProvider).value?.name ?? '',
  );
  Set<AddressField> _errors = const {};
  var _busy = false;

  @override
  void initState() {
    super.initState();
    _phone.text = ref.read(creatorProvider).value?.whatsapp ?? '';
  }

  @override
  void dispose() {
    for (final c in [_line, _area, _phone, _recipient]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    setState(() {
      _busy = true;
      _errors = const {};
    });
    try {
      final saved = await ref.read(addAddressProvider)(
        label: _label,
        recipient: _recipient.text,
        line: _line.text,
        area: _area.text,
        phone: _phone.text,
      );
      if (mounted) Navigator.pop(context, saved);
    } on InvalidAddressError catch (e) {
      setState(() => _errors = e.fields);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
    child: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add a delivery address', style: TmText.display(24)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: [
              for (final l in _labels)
                TmFilterChip(
                  l,
                  selected: _label == l,
                  onTap: () => setState(() => _label = l),
                ),
            ],
          ),
          const SizedBox(height: 14),
          _Field(label: 'Name', controller: _recipient),
          _Field(
            label: 'Building, street, villa or flat',
            hint: 'Villa 12, Street 4',
            controller: _line,
            error: _errors.contains(AddressField.line)
                ? 'Add the full address'
                : null,
          ),
          _Field(
            label: 'Area and city',
            hint: 'Al Barsha, Dubai',
            controller: _area,
            error: _errors.contains(AddressField.area) ? 'Add the area' : null,
          ),
          _Field(
            label: 'Phone for the courier',
            hint: '+971 50 123 4567',
            controller: _phone,
            keyboard: TextInputType.phone,
            error: _errors.contains(AddressField.phone)
                ? 'Enter a valid phone number'
                : null,
          ),
          const SizedBox(height: 8),
          TmButton(
            label: _busy ? 'Saving…' : 'Save address',
            onPressed: _busy ? null : _save,
          ),
        ],
      ),
    ),
  );
}

class _Field extends StatelessWidget {
  const _Field({
    required this.label,
    required this.controller,
    this.hint,
    this.error,
    this.keyboard,
  });

  final String label;
  final TextEditingController controller;
  final String? hint;
  final String? error;
  final TextInputType? keyboard;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: TmText.body(size: 14, weight: FontWeight.w700)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboard,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(hintText: hint, errorText: error),
        ),
      ],
    ),
  );
}
