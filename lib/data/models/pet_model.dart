import 'package:hive/hive.dart';

part 'pet_model.g.dart';

@HiveType(typeId: 1)
class PetModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String clientId;

  @HiveField(2)
  String nome;

  @HiveField(3)
  String especie;

  @HiveField(4)
  String? raca;

  @HiveField(5)
  String? sexo;

  @HiveField(6)
  int? idade;

  @HiveField(7)
  DateTime? dataNascimento;

  @HiveField(8)
  double? peso;

  @HiveField(9)
  String? tamanho; // pequeno, médio, grande, gigante

  @HiveField(10)
  String? energia; // baixa, média, alta

  @HiveField(11)
  String? comportamentoCaes;

  @HiveField(12)
  String? comportamentoPessoas;

  @HiveField(13)
  bool puxaTrela;

  @HiveField(14)
  bool esterilizado;

  @HiveField(15)
  bool vacinasDia;

  @HiveField(16)
  String? medicacao;

  @HiveField(17)
  String? alergias;

  @HiveField(18)
  String? alimentacao;

  @HiveField(19)
  String? instrucoesEspeciais;

  @HiveField(20)
  String? veterinario;

  @HiveField(21)
  String? contactoVeterinario;

  @HiveField(22)
  String? foto;

  @HiveField(23)
  String? notas;

  @HiveField(24)
  bool ativo;

  PetModel({
    required this.id,
    required this.clientId,
    required this.nome,
    required this.especie,
    this.raca,
    this.sexo,
    this.idade,
    this.dataNascimento,
    this.peso,
    this.tamanho,
    this.energia,
    this.comportamentoCaes,
    this.comportamentoPessoas,
    this.puxaTrela = false,
    this.esterilizado = false,
    this.vacinasDia = false,
    this.medicacao,
    this.alergias,
    this.alimentacao,
    this.instrucoesEspeciais,
    this.veterinario,
    this.contactoVeterinario,
    this.foto,
    this.notas,
    this.ativo = true,
  });
}
