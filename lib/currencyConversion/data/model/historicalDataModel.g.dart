// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historicalDataModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoricalDataModelAdapter extends TypeAdapter<HistoricalDataModel> {
  @override
  final int typeId = 1;

  @override
  HistoricalDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoricalDataModel(
      date: fields[3] as String,
      currencyName: fields[0] as String,
      currencyRate: fields[1] as double,
      currencyFlag: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HistoricalDataModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(0)
      ..write(obj.currencyName)
      ..writeByte(1)
      ..write(obj.currencyRate)
      ..writeByte(2)
      ..write(obj.currencyFlag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoricalDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
