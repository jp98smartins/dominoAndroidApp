class Jogador{
  String _nome;
  int _pontos;

  Jogador(String name, int points){
    this._nome = name;
    this._pontos = points;
  }

  String getNome(){
    return this._nome;
  }

  int getPontos(){
    return this._pontos;
  }

  addPontos(int points){
    this._pontos += points;
  }
}