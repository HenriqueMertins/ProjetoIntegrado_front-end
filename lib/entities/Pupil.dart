// ignore: file_names
class Pupil {
  final int id;
  final String nome;
  final String cpf;
  final String fone;


  const Pupil({

    required this.id,
    required this.nome,
    required this.cpf,
    required this.fone
  });

  factory Pupil.fromJson(Map<String, dynamic> json) {
    return Pupil(
      id: json['id'] as int,
      nome: json['nome'] as String,
      cpf: json['cpf'] as String,
      fone: json['fone'] as String
    );
  }
}