// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_product_model.dart';

class HiveProductModelAdapter extends TypeAdapter<HiveProductModel> {
  @override
  final int typeId = 0;

  @override
  HiveProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveProductModel(
      id: fields[0] as int,
      imageUrl: fields[1] as String,
      title: fields[2] as String,
      price: (fields[3] as num).toDouble(),
      oldPrice: (fields[4] as num).toDouble(),
      quantity: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveProductModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.oldPrice)
      ..writeByte(5)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
