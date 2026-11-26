import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/tm_colors.dart';
import '../theme/tm_text.dart';

/// Six code boxes backed by one hidden text field, so paste and SMS / OS
/// autofill work. Calls [onCompleted] when all digits are in.
class OtpField extends StatefulWidget {
  const OtpField({
    super.key,
    required this.controller,
    this.length = 6,
    this.onCompleted,
    this.hasError = false,
    this.autofocus = true,
  });

  final TextEditingController controller;
  final int length;
  final ValueChanged<String>? onCompleted;
  final bool hasError;
  final bool autofocus;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final _focus = FocusNode();
  String? _completed;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_changed);
    _focus.addListener(_changed);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_changed);
    _focus.dispose();
    super.dispose();
  }

  void _changed() {
    setState(() {});
    final v = widget.controller.text;
    if (v.length == widget.length && v != _completed) {
      _completed = v;
      widget.onCompleted?.call(v);
    } else if (v.length < widget.length) {
      _completed = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final value = widget.controller.text;
    return Semantics(
      label: 'Verification code',
      textField: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _focus.requestFocus,
        child: Stack(
          children: [
            // The real input: invisible, but focusable and autofillable.
            Opacity(
              opacity: 0,
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focus,
                  autofocus: widget.autofocus,
                  keyboardType: TextInputType.number,
                  autofillHints: const [AutofillHints.oneTimeCode],
                  maxLength: widget.length,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(counterText: ''),
                ),
              ),
            ),
            IgnorePointer(
              child: Row(
                children: [
                  for (var i = 0; i < widget.length; i++) ...[
                    if (i > 0) const SizedBox(width: 6),
                    Expanded(child: _box(i, value)),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _box(int i, String value) {
    final filled = i < value.length;
    final active =
        _focus.hasFocus &&
        (i == value.length || (i == widget.length - 1 && filled));
    final border = widget.hasError
        ? TmColors.warnText
        : (filled || active ? TmColors.ink : TmColors.line2);
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: TmColors.cream,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: border, width: active ? 2 : 1.5),
        boxShadow: active
            ? const [BoxShadow(color: TmColors.lime, spreadRadius: 3)]
            : null,
      ),
      child: Text(filled ? value[i] : '', style: TmText.display(22)),
    );
  }
}
