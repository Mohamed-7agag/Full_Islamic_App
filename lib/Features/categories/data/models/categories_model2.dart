import 'package:equatable/equatable.dart';

class CategoriesModel2 extends Equatable {
  final String? text;
  final String? title;

  const CategoriesModel2({this.text, this.title});

  factory CategoriesModel2.fromJson(Map<String, dynamic> json) {
    return CategoriesModel2(
      text: json['text'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'text': text,
        'title': title,
      };

  @override
  List<Object?> get props => [text, title];
}
