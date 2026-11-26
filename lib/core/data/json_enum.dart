/// Enum <-> JSON helpers for DTOs. The API sends enums as snake_case
/// strings ("script_review"); unknown values fall back instead of crashing,
/// so a newer backend can't break an older app.
String enumToJson(Enum value) => _snake(value.name);

T enumFromJson<T extends Enum>(List<T> values, String? json, T fallback) {
  if (json == null) return fallback;
  for (final v in values) {
    if (_snake(v.name) == json || v.name == json) return v;
  }
  return fallback;
}

T? enumFromJsonOrNull<T extends Enum>(List<T> values, String? json) {
  if (json == null) return null;
  for (final v in values) {
    if (_snake(v.name) == json || v.name == json) return v;
  }
  return null;
}

String _snake(String camel) =>
    camel.replaceAllMapped(RegExp('[A-Z]'), (m) => '_${m[0]!.toLowerCase()}');
