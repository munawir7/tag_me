import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/utils/dates.dart';
import '../../../core/widgets/widgets.dart';
import '../application/onboarding_providers.dart';
import '../application/session_controller.dart';
import '../domain/profile_draft.dart';
import '../domain/regions.dart';
import '../domain/usecases/onboarding_usecases.dart';

/// "Tell brands who you are": name, handles, categories, optional licence.
class ProfileSetupPage extends ConsumerStatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  ConsumerState<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _Handle {
  _Handle(this.platform) : controller = TextEditingController();
  final String platform;
  final TextEditingController controller;
}

class _ProfileSetupPageState extends ConsumerState<ProfileSetupPage> {
  final _scroll = ScrollController();
  final _name = TextEditingController();
  final _handles = [_Handle('Instagram')];
  final _categories = <String>[];
  final _licence = TextEditingController();
  DateTime? _expiry;
  String? _licenceFile;
  Set<ProfileField> _errors = const {};
  var _busy = false;

  @override
  void dispose() {
    _scroll.dispose();
    _name.dispose();
    _licence.dispose();
    for (final h in _handles) {
      h.controller.dispose();
    }
    super.dispose();
  }

  void _addHandle(String platform) =>
      setState(() => _handles.add(_Handle(platform)));

  void _removeHandle(_Handle h) => setState(() {
    _handles.remove(h);
    h.controller.dispose();
  });

  void _toggleCategory(String c) => setState(() {
    if (_categories.contains(c)) {
      _categories.remove(c);
    } else if (_categories.length < SubmitProfile.maxCategories) {
      _categories.add(c);
    }
  });

  Future<void> _pickExpiry() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: DateTime(now.year + 10),
      initialDate: _expiry ?? DateTime(now.year + 1, now.month, now.day),
    );
    if (picked != null) setState(() => _expiry = picked);
  }

  /// The errors sit next to their fields, which may be off screen when the
  /// creator taps Submit at the bottom: say what to fix and scroll up.
  void _showProblems(Set<ProfileField> fields) {
    final what = [
      if (fields.contains(ProfileField.name)) 'your name',
      if (fields.contains(ProfileField.handles)) 'a handle',
      if (fields.contains(ProfileField.categories)) '1 to 3 categories',
    ];
    _message('Please add ${what.join(', ')}.');
    FocusScope.of(context).unfocus();
    if (_scroll.hasClients) {
      _scroll.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _message(String text) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(text), duration: const Duration(seconds: 3)),
    );

  Future<void> _submit() async {
    final details = ref.read(signUpDetailsProvider);
    setState(() {
      _busy = true;
      _errors = const {};
    });
    try {
      await ref.read(submitProfileProvider)(
        ProfileDraft(
          name: _name.text,
          country: details.country,
          city: details.city,
          whatsapp: details.phone,
          handles: [
            for (final h in _handles)
              HandleDraft(platform: h.platform, handle: h.controller.text),
          ],
          categories: List.of(_categories),
          licenceNumber: _licence.text,
          licenceExpiry: _expiry,
          licenceFile: _licenceFile,
        ),
      );
      // The router shows the review screen on this change.
      ref.read(sessionProvider.notifier).submitProfile();
    } on InvalidProfileError catch (e) {
      setState(() => _errors = e.fields);
      _showProblems(e.fields);
    } catch (_) {
      _message("Couldn't submit right now. Please try again.");
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final unused = [
      for (final p in kPlatforms)
        if (!_handles.any((h) => h.platform == p)) p,
    ];
    return Scaffold(
      body: SafeArea(
        // Any touch on the form clears the "please add …" message so it
        // never sits over the Submit button.
        child: Listener(
          onPointerDown: (_) =>
              ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          child: ListView(
            controller: _scroll,
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
            children: [
              Row(
                children: [
                  TmLinkButton(
                    label: 'Use a different account',
                    small: true,
                    onPressed: () =>
                        ref.read(sessionProvider.notifier).signOut(),
                  ),
                  const Spacer(),
                  Text(
                    'Last step',
                    style: TmText.small(
                      color: TmColors.ink,
                      weight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                'Tell brands\nwho you are.',
                style: TmText.display(40, height: 0.98),
              ),
              const SizedBox(height: 20),

              const _Label('Full name'),
              TextField(
                controller: _name,
                textCapitalization: TextCapitalization.words,
                autofillHints: const [AutofillHints.name],
                decoration: InputDecoration(
                  hintText: 'Sara Al Mansoori',
                  errorText: _errors.contains(ProfileField.name)
                      ? 'Enter your name'
                      : null,
                ),
              ),
              const SizedBox(height: 18),

              const _Label('Your handles'),
              for (final h in _handles) ...[
                _HandleRow(
                  handle: h,
                  canRemove: _handles.length > 1,
                  onRemove: () => _removeHandle(h),
                ),
                const SizedBox(height: 8),
              ],
              if (_errors.contains(ProfileField.handles))
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Add at least one handle',
                    style: TmText.small(color: TmColors.warnText),
                  ),
                ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final p in unused)
                    TmChip('+ $p', dashed: true, onTap: () => _addHandle(p)),
                ],
              ),
              const SizedBox(height: 18),

              Row(
                children: [
                  const Expanded(child: _Label('What do you create?')),
                  Text(
                    '${_categories.length} of ${SubmitProfile.maxCategories}',
                    style: TmText.small(),
                  ),
                ],
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final c in kCategories)
                    TmChip(
                      _categories.contains(c) ? '✓ $c' : c,
                      selected: _categories.contains(c),
                      onTap: () => _toggleCategory(c),
                    ),
                ],
              ),
              if (_errors.contains(ProfileField.categories))
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Pick 1 to 3 categories',
                    style: TmText.small(color: TmColors.warnText),
                  ),
                ),
              const SizedBox(height: 18),

              Row(
                children: [
                  const Expanded(child: _Label('Influencer licence')),
                  const TmPill('Optional', style: TmPillStyle.brand),
                ],
              ),
              Text(
                'If you have an influencer / advertiser licence for your '
                'country, add it here. You can also add it later from your '
                'profile.',
                style: TmText.small(height: 1.45),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _licence,
                      decoration: const InputDecoration(
                        hintText: 'Licence number',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TmButton.ghost(
                      label: _expiry == null
                          ? 'Expiry date'
                          : 'Expires ${TmDates.short(_expiry!)} ${_expiry!.year}',
                      small: true,
                      onPressed: _pickExpiry,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (_licenceFile == null)
                TmButton.dashed(
                  label: '+ Upload licence (PDF, JPG or PNG)',
                  // Stand-in for the file picker (added with the backend).
                  onPressed: () =>
                      setState(() => _licenceFile = 'Influencer_licence.pdf'),
                )
              else
                TmCard(
                  borderColor: TmColors.ink,
                  padding: const EdgeInsets.fromLTRB(10, 6, 4, 6),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TmColors.lime,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'PDF',
                          style: TmText.body(size: 11, weight: FontWeight.w800),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _licenceFile!,
                          style: TmText.body(size: 14, weight: FontWeight.w700),
                        ),
                      ),
                      TmLinkButton(
                        label: 'Remove',
                        small: true,
                        onPressed: () => setState(() => _licenceFile = null),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 24),
              TmButton(
                label: _busy ? 'Submitting…' : 'Submit for verification',
                onPressed: _busy ? null : _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(text, style: TmText.body(size: 14, weight: FontWeight.w700)),
  );
}

class _HandleRow extends StatelessWidget {
  const _HandleRow({
    required this.handle,
    required this.canRemove,
    required this.onRemove,
  });

  final _Handle handle;
  final bool canRemove;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) => Container(
    height: 56,
    padding: const EdgeInsets.only(left: 14, right: 6),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: TmColors.ink, width: 1.5),
    ),
    child: Row(
      children: [
        SizedBox(
          width: 84,
          child: Text(
            handle.platform,
            style: TmText.body(size: 14, weight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: TextField(
            controller: handle.controller,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: handle.platform == 'YouTube'
                  ? 'Channel name'
                  : '@yourhandle',
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              filled: false,
              isDense: true,
            ),
          ),
        ),
        if (canRemove)
          IconButton(
            tooltip: 'Remove ${handle.platform}',
            onPressed: onRemove,
            icon: const TmIcon(TmIcons.close, size: 16),
          ),
      ],
    ),
  );
}
