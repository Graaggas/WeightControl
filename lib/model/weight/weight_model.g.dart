// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeightModelAdapter extends TypeAdapter<WeightModel> {
  @override
  final int typeId = 1;

  @override
  WeightModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeightModel()
      .._weightList = (fields[1] as List)?.cast<double>()
      .._wantedWeight = fields[2] as double
      .._name = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, WeightModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj._weightList)
      ..writeByte(2)
      ..write(obj._wantedWeight)
      ..writeByte(3)
      ..write(obj._name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeightModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
