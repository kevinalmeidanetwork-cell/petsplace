import 'package:hive/hive.dart';

part 'service_model.g.dart';

@HiveType(typeId: 2)
class ServiceModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String serviceType; // Dog Walking, Boarding, Pet Sitting, Daycare, Transport, Extra

  @HiveField(2)
  String clientId;

  @HiveField(3)
  List<String> petIds;

  @HiveField(4)
  DateTime data;

  @HiveField(5)
  String? horaInicio;

  @HiveField(6)
  String? horaFim;

  @HiveField(7)
  int? duracao;

  @HiveField(8)
  double preco;

  @HiveField(9)
  String estado; // agendado, em progresso, concluído, cancelado

  @HiveField(10)
  String pagamento; // não pago, parcialmente pago, pago

  @HiveField(11)
  String? notas;

  @HiveField(12)
  DateTime createdAt;

  @HiveField(13)
  DateTime updatedAt;

  ServiceModel({
    required this.id,
    required this.serviceType,
    required this.clientId,
    required this.petIds,
    required this.data,
    this.horaInicio,
    this.horaFim,
    this.duracao,
    required this.preco,
    this.estado = 'agendado',
    this.pagamento = 'não pago',
    this.notas,
    required this.createdAt,
    required this.updatedAt,
  });
}
