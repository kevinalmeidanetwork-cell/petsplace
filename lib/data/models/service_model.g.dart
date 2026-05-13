// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceModelAdapter extends TypeAdapter<ServiceModel> {
  @override
  final int typeId = 2;

  @override
  ServiceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceModel(
      id: fields[0] as String,
      serviceType: fields[1] as String,
      clientId: fields[2] as String,
      petIds: (fields[3] as List).cast<String>(),
      data: fields[4] as DateTime,
      horaInicio: fields[5] as String?,
      horaFim: fields[6] as String?,
      duracao: fields[7] as int?,
      preco: fields[8] as double,
      estado: fields[9] as String,
      pagamento: fields[10] as String,
      notas: fields[11] as String?,
      createdAt: fields[12] as DateTime,
      updatedAt: fields[13] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ServiceModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.serviceType)
      ..writeByte(2)
      ..write(obj.clientId)
      ..writeByte(3)
      ..write(obj.petIds)
      ..writeByte(4)
      ..write(obj.data)
      ..writeByte(5)
      ..write(obj.horaInicio)
      ..writeByte(6)
      ..write(obj.horaFim)
      ..writeByte(7)
      ..write(obj.duracao)
      ..writeByte(8)
      ..write(obj.preco)
      ..writeByte(9)
      ..write(obj.estado)
      ..writeByte(10)
      ..write(obj.pagamento)
      ..writeByte(11)
      ..write(obj.notas)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
