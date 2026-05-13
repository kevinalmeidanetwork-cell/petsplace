// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PetModelAdapter extends TypeAdapter<PetModel> {
  @override
  final int typeId = 1;

  @override
  PetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PetModel(
      id: fields[0] as String,
      clientId: fields[1] as String,
      nome: fields[2] as String,
      especie: fields[3] as String,
      raca: fields[4] as String?,
      sexo: fields[5] as String?,
      idade: fields[6] as int?,
      dataNascimento: fields[7] as DateTime?,
      peso: fields[8] as double?,
      tamanho: fields[9] as String?,
      energia: fields[10] as String?,
      comportamentoCaes: fields[11] as String?,
      comportamentoPessoas: fields[12] as String?,
      puxaTrela: fields[13] as bool,
      esterilizado: fields[14] as bool,
      vacinasDia: fields[15] as bool,
      medicacao: fields[16] as String?,
      alergias: fields[17] as String?,
      alimentacao: fields[18] as String?,
      instrucoesEspeciais: fields[19] as String?,
      veterinario: fields[20] as String?,
      contactoVeterinario: fields[21] as String?,
      foto: fields[22] as String?,
      notas: fields[23] as String?,
      ativo: fields[24] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PetModel obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.clientId)
      ..writeByte(2)
      ..write(obj.nome)
      ..writeByte(3)
      ..write(obj.especie)
      ..writeByte(4)
      ..write(obj.raca)
      ..writeByte(5)
      ..write(obj.sexo)
      ..writeByte(6)
      ..write(obj.idade)
      ..writeByte(7)
      ..write(obj.dataNascimento)
      ..writeByte(8)
      ..write(obj.peso)
      ..writeByte(9)
      ..write(obj.tamanho)
      ..writeByte(10)
      ..write(obj.energia)
      ..writeByte(11)
      ..write(obj.comportamentoCaes)
      ..writeByte(12)
      ..write(obj.comportamentoPessoas)
      ..writeByte(13)
      ..write(obj.puxaTrela)
      ..writeByte(14)
      ..write(obj.esterilizado)
      ..writeByte(15)
      ..write(obj.vacinasDia)
      ..writeByte(16)
      ..write(obj.medicacao)
      ..writeByte(17)
      ..write(obj.alergias)
      ..writeByte(18)
      ..write(obj.alimentacao)
      ..writeByte(19)
      ..write(obj.instrucoesEspeciais)
      ..writeByte(20)
      ..write(obj.veterinario)
      ..writeByte(21)
      ..write(obj.contactoVeterinario)
      ..writeByte(22)
      ..write(obj.foto)
      ..writeByte(23)
      ..write(obj.notas)
      ..writeByte(24)
      ..write(obj.ativo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
