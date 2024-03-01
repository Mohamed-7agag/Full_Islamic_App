import 'package:equatable/equatable.dart';

class AzkarModel extends Equatable {
  final String? zekr;
  final int? repeat;
  final String? bless;

  const AzkarModel({this.zekr, this.repeat, this.bless});

  factory AzkarModel.fromJson(Map<String, dynamic> json) => AzkarModel(
        zekr: json['zekr'] as String?,
        repeat: json['repeat'] as int?,
        bless: json['bless'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'zekr': zekr,
        'repeat': repeat,
        'bless': bless,
      };

  @override
  List<Object?> get props => [zekr, repeat, bless];
}
