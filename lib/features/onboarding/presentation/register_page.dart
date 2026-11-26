import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/widgets/widgets.dart';
import '../application/onboarding_providers.dart';
import '../application/session_controller.dart';
import '../domain/auth_repository.dart';
import '../domain/regions.dart';

/// WhatsApp number + OTP, or Google / Apple. Signing in moves the session
/// on and the router takes the creator to profile setup.
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  Region _region = kRegions.first;
  late String _city = _region.cities.first;
  final _phone = TextEditingController();
  final _code = TextEditingController();

  OtpRequest? _request;
  String? _phoneError;
  String? _codeError;
  var _busy = false;
  var _secondsLeft = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _phone.dispose();
    _code.dispose();
    super.dispose();
  }

  void _startCountdown(Duration d) {
    _timer?.cancel();
    setState(() => _secondsLeft = d.inSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted || _secondsLeft <= 1) {
        t.cancel();
        if (mounted) setState(() => _secondsLeft = 0);
        return;
      }
      setState(() => _secondsLeft--);
    });
  }

  Future<void> _sendCode() async {
    setState(() {
      _busy = true;
      _phoneError = null;
      _codeError = null;
    });
    try {
      final r = await ref.read(requestOtpProvider)(_region, _phone.text);
      _code.clear();
      setState(() => _request = r);
      _startCountdown(r.resendAfter);
    } on InvalidPhoneError {
      setState(() => _phoneError = 'Enter your WhatsApp number');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _verify() async {
    final r = _request;
    if (r == null || _busy) return;
    setState(() {
      _busy = true;
      _codeError = null;
    });
    try {
      await ref.read(verifyOtpProvider)(r, _code.text);
      _signedIn(r.phone);
    } on InvalidOtpError {
      setState(
        () => _codeError =
            "That code didn't work. Check WhatsApp "
            'and try again.',
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _social(SocialSignIn provider) async {
    setState(() => _busy = true);
    try {
      await ref.read(signInWithSocialProvider)(provider);
      _signedIn('');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _signedIn(String phone) {
    ref
        .read(signUpDetailsProvider.notifier)
        .set(SignUpDetails(country: _region.name, city: _city, phone: phone));
    // The router redirects to profile setup on this change.
    ref.read(sessionProvider.notifier).signIn();
  }

  @override
  Widget build(BuildContext context) {
    final hint = ref.watch(devOtpHintProvider);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TmBackButton(onPressed: () => context.popOrGo()),
            ),
            const SizedBox(height: 20),
            Text("Let's get\nyou in.", style: TmText.display(44, height: 0.95)),
            const SizedBox(height: 12),
            Text(
              'Sign up with WhatsApp, or continue with Google or Apple.',
              style: TmText.body(color: TmColors.sub),
            ),
            const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _Dropdown(
                    label: 'Country',
                    value: _region.name,
                    items: [for (final r in kRegions) r.name],
                    onChanged: _request != null
                        ? null
                        : (v) => setState(() {
                            _region = regionNamed(v);
                            _city = _region.cities.first;
                          }),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _Dropdown(
                    label: 'City',
                    value: _city,
                    items: _region.cities,
                    onChanged: (v) => setState(() => _city = v),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              'WhatsApp number',
              style: TmText.body(size: 14, weight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _phone,
              enabled: _request == null,
              keyboardType: TextInputType.phone,
              autofillHints: const [AutofillHints.telephoneNumberNational],
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')),
              ],
              onSubmitted: (_) => _sendCode(),
              decoration: InputDecoration(
                hintText: '50 123 4567',
                errorText: _phoneError,
                prefixIcon: Container(
                  width: 72,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(color: TmColors.line, width: 1.5),
                    ),
                  ),
                  child: Text(
                    _region.dialCode,
                    style: TmText.body(weight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            if (_request == null)
              TmButton(
                label: _busy ? 'Sending…' : 'Send code on WhatsApp',
                onPressed: _busy ? null : _sendCode,
              )
            else
              TmCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Enter the code sent to ${_request!.phone}',
                            style: TmText.body(
                              size: 14,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ),
                        if (_secondsLeft > 0)
                          Text(
                            '0:${_secondsLeft.toString().padLeft(2, '0')}',
                            style: TmText.small(),
                          )
                        else
                          TmLinkButton(
                            label: 'Resend',
                            small: true,
                            onPressed: _busy ? null : _sendCode,
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    OtpField(
                      controller: _code,
                      hasError: _codeError != null,
                      onCompleted: (_) => _verify(),
                    ),
                    if (_codeError != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        _codeError!,
                        style: TmText.small(color: TmColors.warnText),
                      ),
                    ],
                    if (hint != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Prototype: the code is $hint',
                        style: TmText.small(),
                      ),
                    ],
                    const SizedBox(height: 12),
                    TmButton(
                      label: _busy ? 'Checking…' : 'Verify and continue',
                      onPressed: _busy ? null : _verify,
                    ),
                    TmLinkButton(
                      label: 'Change number',
                      small: true,
                      onPressed: () {
                        _timer?.cancel();
                        setState(() {
                          _request = null;
                          _codeError = null;
                        });
                      },
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 18),
            Row(
              children: [
                const Expanded(child: Divider(color: TmColors.line2)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('or continue with', style: TmText.small()),
                ),
                const Expanded(child: Divider(color: TmColors.line2)),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: TmButton.ghost(
                    label: 'Google',
                    small: true,
                    onPressed: _busy
                        ? null
                        : () => _social(SocialSignIn.google),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TmButton(
                    label: 'Apple',
                    small: true,
                    onPressed: _busy ? null : () => _social(SocialSignIn.apple),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Dropdown extends StatelessWidget {
  const _Dropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final String value;
  final List<String> items;

  /// Null disables it.
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(label, style: TmText.body(size: 14, weight: FontWeight.w700)),
      const SizedBox(height: 6),
      DropdownButtonFormField<String>(
        // initialValue is read once; a new key rebuilds it when the
        // value or the list changes (e.g. cities after a new country).
        key: ValueKey('$label|$value|${items.join(',')}'),
        initialValue: value,
        isExpanded: true,
        borderRadius: BorderRadius.circular(16),
        dropdownColor: Colors.white,
        items: [
          for (final i in items)
            DropdownMenuItem(
              value: i,
              child: Text(i, overflow: TextOverflow.ellipsis),
            ),
        ],
        onChanged: onChanged == null ? null : (v) => onChanged!(v!),
      ),
    ],
  );
}
