import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final int id;
  final String name;
  final String fileName;
  final String collection;
  final String url;
  final String size;
  final String type;
  final String extension;
  final String caption;
  final int width;
  final int height;
  final String thumbnailUrl;

  const ImageEntity({
    required this.id,
    required this.name,
    required this.fileName,
    required this.collection,
    required this.url,
    required this.size,
    required this.type,
    required this.extension,
    required this.caption,
    required this.width,
    required this.height,
    required this.thumbnailUrl,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        fileName,
        collection,
        url,
        size,
        type,
        extension,
        caption,
        width,
        height,
        thumbnailUrl,
      ];
}
