import 'package:equatable/equatable.dart';

class AttachmentsModel extends Equatable {
  final int? order;
  final String? size;
  final String? extensionType;
  final String? description;
  final String? url;

  const AttachmentsModel({
    this.order,
    this.size,
    this.extensionType,
    this.description,
    this.url,
  });

  factory AttachmentsModel.fromJson(Map<String, dynamic> json) {
    return AttachmentsModel(
      order: json['order'] as int?,
      size: json['size'] as String?,
      extensionType: json['extension_type'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'order': order,
        'size': size,
        'extension_type': extensionType,
        'description': description,
        'url': url,
      };

  @override
  List<Object?> get props {
    return [
      order,
      size,
      extensionType,
      description,
      url,
    ];
  }
}
