import 'package:permanahome/models/permana_home_number_model.dart';

class UserPermanaHomeNumber {
  final int? id;
  final int? isActive;
  final int? permanaHomeNumberId;
  final PermanaHomeNumber? permanaHomeNumber;

  UserPermanaHomeNumber({
    this.id,
    this.isActive,
    this.permanaHomeNumberId,
    this.permanaHomeNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_active': isActive,
      'permana_home_number_id': permanaHomeNumberId,
      'permana_home_number': permanaHomeNumber,
    };
  }

  factory UserPermanaHomeNumber.fromJson(Map<String, dynamic> json) =>
      UserPermanaHomeNumber(
        id: json['id'],
        isActive: json['is_active'],
        permanaHomeNumberId: json['permana_home_number_id'],
        permanaHomeNumber: PermanaHomeNumber.fromJson(
          json['permana_home_number'],
        ),
      );
}
