import 'package:equatable/equatable.dart';

import 'gregorian.dart';
import 'hijri.dart';

class Date extends Equatable {
  final String? readable;
  final String? timestamp;
  final Gregorian? gregorian;
  final Hijri? hijri;

  const Date({this.readable, this.timestamp, this.gregorian, this.hijri});

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        readable: json['readable'] as String?,
        timestamp: json['timestamp'] as String?,
        gregorian: json['gregorian'] == null
            ? null
            : Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
        hijri: json['hijri'] == null
            ? null
            : Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'readable': readable,
        'timestamp': timestamp,
        'gregorian': gregorian?.toJson(),
        'hijri': hijri?.toJson(),
      };

  @override
  List<Object?> get props => [readable, timestamp, gregorian, hijri];
}
