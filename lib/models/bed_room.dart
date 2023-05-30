// ignore_for_file: public_member_api_docs, sort_constructors_first
class Bedroom {
  final bool light;
  final bool aircondtiner;
  final bool window;
  final double roomtemp;
  final double humroom;
  final double apptemp;
  final double apphum;
  Bedroom({
    required this.apptemp,
    required this.apphum,
    required this.light,
    required this.aircondtiner,
    required this.window,
    required this.roomtemp,
    required this.humroom,
  });

  Bedroom copyWith({
    bool? light,
    bool? aircondtiner,
    bool? window,
    double? roomtemp,
    double? humroom,
    double? apptemp,
    double? apphum,
  }) {
    return Bedroom(
      light: light ?? this.light,
      aircondtiner: aircondtiner ?? this.aircondtiner,
      window: window ?? this.window,
      roomtemp: roomtemp ?? this.roomtemp,
      humroom: humroom ?? this.humroom,
      apptemp: apptemp ?? this.apptemp,
      apphum: apphum ?? this.apphum,
    );
  }
}
