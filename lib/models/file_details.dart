// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'file_details.g.dart';

@HiveType(typeId: 1)
class FileDetails {
  @HiveField(0)
  final String contentType;
  @HiveField(1)
  final String localPath;
  @HiveField(2)
  final DateTime time;

  FileDetails({
    required this.contentType,
    required this.localPath,
    required this.time,
  });

  FileDetails copyWith({
    String? contentType,
    String? localPath,
    DateTime? time,
  }) {
    return FileDetails(
      contentType: contentType ?? this.contentType,
      localPath: localPath ?? this.localPath,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contentType': contentType,
      'localPath': localPath,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory FileDetails.fromMap(Map<String, dynamic> map) {
    return FileDetails(
      contentType: map['contentType'] as String,
      localPath: map['localPath'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory FileDetails.fromJson(String source) =>
      FileDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FileDetails(contentType: $contentType, localPath: $localPath, time: $time)';

  @override
  bool operator ==(covariant FileDetails other) {
    if (identical(this, other)) return true;

    return other.contentType == contentType &&
        other.localPath == localPath &&
        other.time == time;
  }

  @override
  int get hashCode => contentType.hashCode ^ localPath.hashCode ^ time.hashCode;
}
