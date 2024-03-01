import 'package:equatable/equatable.dart';

class CategoriesModel1 extends Equatable {
  final String? number;
  final String? text;
  final String? label;

  const CategoriesModel1({this.number, this.text, this.label});

  factory CategoriesModel1.fromJson(Map<String, dynamic> json) {
    return CategoriesModel1(
      number: json['number'] as String?,
      text: json['text'] as String?,
      label: json['label'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'number': number,
        'text': text,
        'label': label,
      };

  @override
  List<Object?> get props => [number, text, label];
}
