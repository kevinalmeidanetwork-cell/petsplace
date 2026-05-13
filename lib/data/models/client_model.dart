import 'package:hive/hive.dart';

part 'client_model.g.dart';

@HiveType(typeId: 0)
class ClientModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String nome;

  @HiveField(2)
  String apelido;

  @HiveField(3)
  String? telefone;

  @HiveField(4)
  String? email;

  @HiveField(5)
  String? morada;

  @HiveField(6)
  String? cidade;

  @HiveField(7)
  String? codigoPostal;

  @HiveField(8)
  String? notas;

  @HiveField(9)
  String? contactoEmergencia;

  @HiveField(10)
  String? telefoneEmergencia;

  @HiveField(11)
  DateTime dataCriacao;

  @HiveField(12)
  bool ativo;

  ClientModel({
    required this.id,
    required this.nome,
    required this.apelido,
    this.telefone,
    this.email,
    this.morada,
    this.cidade,
    this.codigoPostal,
    this.notas,
    this.contactoEmergencia,
    this.telefoneEmergencia,
    required this.dataCriacao,
    this.ativo = true,
  });
}
