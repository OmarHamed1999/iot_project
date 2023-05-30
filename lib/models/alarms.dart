// ignore_for_file: public_member_api_docs, sort_constructors_first
class Alarms {
  final bool door;
  final bool sensor;
  final bool atoumation;
  Alarms({
    required this.door,
    required this.sensor,
    required this.atoumation,
  });

  Alarms copyWith({
    bool? door,
    bool? sensor,
    bool? atoumation,
  }) {
    return Alarms(
      door: door ?? this.door,
      sensor: sensor ?? this.sensor,
      atoumation: atoumation ?? this.atoumation,
    );
  }
}
