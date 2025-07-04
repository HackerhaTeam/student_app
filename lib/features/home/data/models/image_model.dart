

import 'package:student_hackerha/core/api/keys/image/Image_keys.dart';
import 'package:student_hackerha/features/home/domain/Entity/image_entity.dart';

class ImageModel extends ImageEntity {
  const ImageModel({
    required super.id,
    required super.name,
    required super.fileName,
    required super.collection,
    required super.url,
    required super.size,
    required super.type,
    required super.extension,
    required super.caption,
    required super.width,
    required super.height,
    required super.thumbnailUrl,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json[ImageKeys.id],
      name: json[ImageKeys.name],
      fileName: json[ImageKeys.fileName],
      collection: json[ImageKeys.collection],
      url: json[ImageKeys.url],
      size: json[ImageKeys.size],
      type: json[ImageKeys.type],
      extension: json[ImageKeys.extension],
      caption: json[ImageKeys.caption],
      width: json[ImageKeys.width],
      height: json[ImageKeys.height],
      thumbnailUrl: json[ImageKeys.thumbnailUrl],
    );
  }

    Map<String, dynamic> toJson() => {
        ImageKeys.id: id,
       ImageKeys.name: name,
       ImageKeys.fileName: fileName,
      ImageKeys.collection: collection,
       ImageKeys.url: url,
       ImageKeys.size: size,
        ImageKeys.type: type,
        ImageKeys.extension: extension,
        ImageKeys.caption: caption,
      ImageKeys.width: width,
       ImageKeys.height: height,
       ImageKeys.thumbnailUrl: thumbnailUrl,
    };
}
