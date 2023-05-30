// ignore_for_file: public_member_api_docs, sort_constructors_first
class GardenData {
  final double curmoist;
  final int moist;
  final bool pump;
  final double tempout;
  GardenData({
    required this.curmoist,
    required this.tempout,
    required this.moist,
    required this.pump,
  });

  GardenData copyWith({
    double? curmoist,
    int? moist,
    bool? pump,
    double? tempout,
  }) {
    return GardenData(
      curmoist: curmoist ?? this.curmoist,
      moist: moist ?? this.moist,
      pump: pump ?? this.pump,
      tempout: tempout ?? this.tempout,
    );
  }
}
