import 'package:domino_app/views/adicionarjogadores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Jogador.dart';

class Jogo{
  int _id;
  int _quantidadeJogadores = 3;
  List<Jogador> _jogadores = new List();
  int _quantidadeRodadas = 0;

  // contrutor 
  Jogo(this._id);

  // get and set
  int getId(){
    return this._id;
  }

  setQuantidadeJogadores(){
    this._quantidadeJogadores++;
  }

  removeQuantidadeJogadores(){
    this._quantidadeJogadores--;
  }

  int getQuantidadeJogadores(){
    return this._quantidadeJogadores;
  }

  setJogadores(Jogador jogador){
    this._jogadores.add(jogador);
  }

  removeJogadores(int index){
    this._jogadores.removeAt(index);
  }

  List<Jogador> getJogadores(){
    return this._jogadores;
  }

  setQuantidadeRodadas(){
    this._quantidadeRodadas++;
  }

  int getQuantidadeRodadas(){
    return this._quantidadeRodadas;
  }

  // metodos livre
  // ver se vai ser privado ou nao
  void getPodium(){
    _jogadores.sort((a, b) => a.getPontos().compareTo(b.getPontos()));
  }

  Widget layoutNamePlayers(BuildContext context, int index, TextEditingController controller, Widget deleteButton){
    if (index < 3){
      return Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5.0, left: 10.0),
              child: Text(
                "Jogador 0${index + 1}", 
                style: GoogleFonts.fredokaOne(
                  color: Colors.cyan[900]
                ),
              ),
            ),
            TextFormField(
              controller: controller,
              cursorColor: Colors.cyan[900],
              style: GoogleFonts.fredokaOne(
                fontSize: 20.0,
                color: Colors.cyan[800],
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: Colors.cyan[900],),
                hintText: "Nome",
                hintStyle: GoogleFonts.fredokaOne(color: Colors.cyan[800]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan[900], width: 3.0),
                  borderRadius: BorderRadius.circular(10.0)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan[900], width: 1.0),
                  borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ],
        )
      );
    }else {
      return Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5.0, left: 10.0),
              child: Text(
                index < 9 ? "Jogador 0${index + 1}" : "Jogador ${index + 1}", 
                style: GoogleFonts.fredokaOne(
                  color: Colors.cyan[900]
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 250.0,
                  child: TextFormField(
                    autofocus: true,
                    controller: controller,
                    cursorColor: Colors.cyan[900],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.cyan[900],),
                      hintText: "Nome",
                      hintStyle: GoogleFonts.fredokaOne(color: Colors.cyan[800]),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan[900], width: 3.0),
                        borderRadius: BorderRadius.circular(10.0)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan[900], width: 1.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
                deleteButton,
              ],
            ),
          ],
        )
      );
    }
  }

  Widget getFirstPlace(String nome, int pontos){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "🥇",
          style: GoogleFonts.fredokaOne(
            fontSize: 34.0
          )
        ),
        Text(
          nome,
          style: GoogleFonts.fredokaOne(
            color: Colors.cyan[900],
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          pontos.toString(),
          style: GoogleFonts.fredokaOne(
            color: Colors.cyan[900],
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget getSecondPlace(String nome, int pontos){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "🥈",
          style: GoogleFonts.fredokaOne(
            fontSize: 30.0
          )
        ),
        Text(
          nome,
          style: GoogleFonts.fredokaOne(
            color: Colors.cyan[900],
            fontSize: 24.0,
          ),
        ),
        Text(
          pontos.toString(),
          style: GoogleFonts.fredokaOne(
            color: Colors.cyan[900],
            fontSize: 24.0,
          ),
        ),     
      ],
    );
  }

  Widget getThirdPlace(String nome, int pontos){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "🥉",
          style: GoogleFonts.fredokaOne(
            fontSize: 26.0
          )
        ),
        Text(
          nome,
          style: GoogleFonts.fredokaOne(
            color: Colors.cyan[900],
            fontSize: 22.0,
          ),
        ),
        Text(
          pontos.toString(),
          style: GoogleFonts.fredokaOne(
            color: Colors.cyan[900],
            fontSize: 22.0,
          ),
        ),  
      ],
    );
  }

  Widget getAllPlace(String nome, int pontos, int index){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "${index + 1}º",
          style: GoogleFonts.fredokaOne(
            fontSize: 22.0,
            color: Colors.cyan[800]
          )
        ),
        Text(
          nome,
          style: GoogleFonts.fredokaOne(
            color: Colors.cyan[800],
            fontSize: 22.0,
          ),
        ),
        Text(
          pontos.toString(),
          style: GoogleFonts.fredokaOne(
            color: Colors.cyan[800],
            fontSize: 22.0,
          ),
        ),  
      ],
    );
  }

  Widget layoutPodiumPlayers(BuildContext context, int index){
    // ordenando a lista de jogadores do menor para o maior em pontos 
    if (index == 0){
      getPodium();
    }
    
    // retornando ui do podium 
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0, left: 15.0, right: 15.0),
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        width: MediaQuery.of(context).size.width,
        child: index == 0 ? 
          getFirstPlace(this._jogadores[index].getNome(), this._jogadores[index].getPontos())
          : index == 1 ? 
          getSecondPlace(this._jogadores[index].getNome(), this._jogadores[index].getPontos())
          : index == 2 ? 
          getThirdPlace(this._jogadores[index].getNome(), this._jogadores[index].getPontos())
          :
          getAllPlace(this._jogadores[index].getNome(), this._jogadores[index].getPontos(), index),
      )
    );
  }

  adicionarJogadorExtra(Jogador jogador){
    this._quantidadeJogadores++;
    this._jogadores.add(jogador);
  }

  getMaxPontos(){
    var pontos;
    for(int i = 0; i < this._quantidadeJogadores; i++){
      if (i == 0){
        pontos = _jogadores[i].getPontos();
      }else if (_jogadores[i].getPontos() > pontos){
        pontos = _jogadores[i].getPontos();
      }
    }

    return pontos;
  }

  // excluir jogador

}