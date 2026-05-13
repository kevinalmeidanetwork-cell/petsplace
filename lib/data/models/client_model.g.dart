// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientModelAdapter extends TypeAdapter<ClientModel> {
  @override
  final int typeId = 0;

  @override
  ClientModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClientModel(
      id: fields[0] as String,
      nome: fields[1] as String,
      apelido: fields[2] as String,
      telefone: fields[3] as String?,
      email: fields[4] as String?,
      morada: fields[5] as String?,
      cidade: fields[6] as String?,
      codigoPostal: fields[7] as String?,
      notas: fields[8] as String?,
      contactoEmergencia: fields[9] as String?,
      telefoneEmergencia: fields[10] as String?,
      dataCriacao: fields[11] as DateTime,
      ativo: fields[12] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ClientModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.apelido)
      ..writeByte(3)
      ..write(obj.telefone)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.morada)
      ..writeByte(6)
      ..write(obj.cidade)
      ..writeByte(7)
      ..write(obj.codigoPostal)
      ..writeByte(8)
      ..write(obj.notas)
      ..writeByte(9)
      ..write(obj.contactoEmergencia)
      ..writeByte(10)
      ..write(obj.telefoneEmergencia)
      ..writeByte(11)
      ..write(obj.dataCriacao)
      ..writeByte(12)
      ..write(obj.ativo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
