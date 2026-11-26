/// A country creators can sign up from, with its WhatsApp dial code.
class Region {
  const Region(this.name, this.dialCode, this.cities);
  final String name;
  final String dialCode;
  final List<String> cities;
}

/// Supported countries (GCC + India), from the prototype.
const kRegions = [
  Region('UAE', '+971', [
    'Dubai',
    'Abu Dhabi',
    'Sharjah',
    'Ajman',
    'Ras Al Khaimah',
  ]),
  Region('Saudi Arabia', '+966', ['Riyadh', 'Jeddah', 'Dammam']),
  Region('Qatar', '+974', ['Doha', 'Lusail']),
  Region('Kuwait', '+965', ['Kuwait City', 'Salmiya']),
  Region('Bahrain', '+973', ['Manama', 'Riffa']),
  Region('Oman', '+968', ['Muscat', 'Salalah']),
  Region('India', '+91', ['Mumbai', 'Delhi', 'Bengaluru', 'Kochi']),
];

Region regionNamed(String name) =>
    kRegions.firstWhere((r) => r.name == name, orElse: () => kRegions.first);

/// Platforms offered when adding handles.
const kPlatforms = [
  'Instagram',
  'TikTok',
  'YouTube',
  'Snapchat',
  'X',
  'Facebook',
  'Threads',
  'LinkedIn',
  'Pinterest',
  'Twitch',
];

/// Content categories; a creator picks up to 3.
const kCategories = [
  'Food',
  'Beauty',
  'Fashion',
  'Fitness',
  'Lifestyle',
  'Travel',
  'Tech',
  'Family',
  'Auto',
];
