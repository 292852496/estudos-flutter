class CepModel {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  CepModel(
      {required this.cep,
      required this.bairro,
      required this.complemento,
      required this.ddd,
      required this.gia,
      required this.ibge,
      required this.localidade,
      required this.logradouro,
      required this.siafi,
      required this.uf}) {}

  CepModel.fromJSON(Map<String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = json['ibge'];
    gia = json['gia'];
    ddd = json['ddd'];
    siafi = json['siafi'];
  }
}
