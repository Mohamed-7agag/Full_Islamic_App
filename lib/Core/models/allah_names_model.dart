import 'package:equatable/equatable.dart';

class AllahNamesModel extends Equatable {
  final int? id;
  final String? name;
  final String? text;

  const AllahNamesModel({this.id, this.name, this.text});

  factory AllahNamesModel.fromJson(Map<String, dynamic> json) =>
      AllahNamesModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'text': text,
      };

  @override
  List<Object?> get props => [id, name, text];
}
