class UserPermanaHomeNumber {
  final int? id;
  final int? isActive;
  final int? permanaHomeNumberId;

  UserPermanaHomeNumber({
    this.id,
    this.isActive,
    this.permanaHomeNumberId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_active': isActive,
      'permana_home_number_id': permanaHomeNumberId,
    };
  }

  factory UserPermanaHomeNumber.fromJson(Map<String, dynamic> json) {
    print('disini');
    print('json = ${json}');
    return UserPermanaHomeNumber(
      id: json['id'],
      isActive: json['is_active'],
      permanaHomeNumberId: json['permana_home_number_id'],
    );
  }
}
