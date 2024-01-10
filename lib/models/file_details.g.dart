// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FileDetailsAdapter extends TypeAdapter<FileDetails> {
  @override
  final int typeId = 1;

  @override
  FileDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FileDetails(
      contentType: fields[0] as String,
      localPath: fields[1] as String,
      time: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FileDetails obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.contentType)
      ..writeByte(1)
      ..write(obj.localPath)
      ..writeByte(2)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
