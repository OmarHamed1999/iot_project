// ignore_for_file: public_member_api_docs, sort_constructors_first
class Livingroom {
  final bool light;
  final double roomtemp;
  final double humroom;
  final double apptemp;
  final double apphum;
  final int smoke;
  Livingroom({
    required this.smoke,
    required this.apptemp,
    required this.apphum,
    required this.light,
    required this.roomtemp,
    required this.humroom,
  });

  Livingroom copyWith(
      {bool? light,
      bool? aircondtiner,
      bool? window,
      double? roomtemp,
      double? humroom,
      double? apptemp,
      double? apphum,
      int? smoke}) {
    return Livingroom(
      smoke: smoke ?? this.smoke,
      light: light ?? this.light,
      roomtemp: roomtemp ?? this.roomtemp,
      humroom: humroom ?? this.humroom,
      apptemp: apptemp ?? this.apptemp,
      apphum: apphum ?? this.apphum,
    );
  }
}
