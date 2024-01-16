part of '../shared_feature.exports.dart';

class FileInfo extends Equatable {
  final String? mimeType;
  final String path;
  final String fileName;
  final List<int> bytes;

  const FileInfo({
    required this.mimeType,
    required this.path,
    required this.fileName,
    this.bytes = const [],
  });

  factory FileInfo.fromXFile(XFile file, {List<int> bytes = const []}) =>
      FileInfo(
        mimeType: file.mimeType,
        path: file.path,
        fileName: file.name,
        bytes: bytes,
      );

  @override
  List<Object?> get props => [mimeType, path, fileName, bytes];

  FileInfo copyWith({
    String? mimeType,
    String? path,
    String? fileName,
    List<int>? bytes,
  }) {
    return FileInfo(
      mimeType: mimeType ?? this.mimeType,
      path: path ?? this.path,
      fileName: fileName ?? this.fileName,
      bytes: bytes ?? this.bytes,
    );
  }
}
