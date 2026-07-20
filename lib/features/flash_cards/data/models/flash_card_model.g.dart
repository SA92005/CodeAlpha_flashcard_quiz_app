// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlashCardModelAdapter extends TypeAdapter<FlashCardModel> {
  @override
  final int typeId = 0;

  @override
  FlashCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FlashCardModel(
      question: fields[1] as String,
      answer: fields[2] as String,
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FlashCardModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlashCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
