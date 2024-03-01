import 'package:equatable/equatable.dart';

import 'data.dart';

class PrayerModel extends Equatable {
  final int? code;
  final String? status;
  final Data? data;

  const PrayerModel({this.code, this.status, this.data});

  factory PrayerModel.fromJson(Map<String, dynamic> json) => PrayerModel(
        code: json['code'] as int?,
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [code, status, data];
}
