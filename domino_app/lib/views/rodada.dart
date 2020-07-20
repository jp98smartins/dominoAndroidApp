import 'dart:async';

import 'package:domino_app/models/AppBarDomino.dart';
import 'package:domino_app/models/Jogador.dart';
import 'package:domino_app/models/Jogo.dart';
import 'package:domino_app/models/RodadaQuantidade.dart';
import 'package:domino_app/views/finalizarjogo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rodada extends StatelessWidget {
  final Jogo jogo;

  Rodada({Key key, @required this.jogo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titulo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyRodada(jogo: jogo,),
    );
  }
}

class MyRodada extends StatefulWidget {
  final Jogo jogo;

  MyRodada({Key key, @required this.jogo}) : super(key: key);

  @override
  _MyRodadaState createState() => _MyRodadaState(jogo: jogo);
}

class _MyRodadaState extends State<MyRodada> {
  
  Jogo jogo;
  _MyRodadaState({Key key, @required this.jogo});

  bool isDeleteStateOn = false;

  @override
  void initState() {
    setState(() {
      jogo.setQuantidadeRodadas();
    });
    print(jogo.getQuantidadeRodadas());
    super.initState();
  }

  static List<TextEditingController> _pontos = [
    new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(),
    new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(),
    new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(),
  ];

  Future<bool> fieldsNotFilled() async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Atenção!',
            textAlign: TextAlign.center,
            style: GoogleFonts.fredokaOne(
              color: Colors.red[900],
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            )
          ),
          content: Text(
            'Existem campos que não foram preenchidos!',
            textAlign: TextAlign.center,
            style: GoogleFonts.fredokaOne(
              color: Colors.cyan[800],
              fontSize: 18.0,
            )
          ),
          actions: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        Padding(padding: EdgeInsets.all(3.0),),
                        Text(
                          "Vou Preenchê-los",
                          style: GoogleFonts.fredokaOne(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Colors.cyan[900],
                        width: 2.0,
                      )
                    ),
                    color: Colors.cyan[900],
                    onPressed: () {
                      Navigator.pop(context, false);
                    }
                  ),
                ],
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.cyan[900], width: 5.0),
          ),
        );
      },
    );
  }

  isFieldsFilled(){
    var control = 0;
    for (int i = 0; i < jogo.getQuantidadeJogadores(); i++){
      if (_pontos[i].text == ""){
        control++;
      }
    }

    if (control > 0){
      fieldsNotFilled();
    }
  }

  void salvarPontos() {
    List<Jogador> jogadores = jogo.getJogadores();
    for (int i = 0; i < jogo.getQuantidadeJogadores(); i++){
      jogadores[i].addPontos(int.parse(_pontos[i].text));
    }
  }

  void printPontos() {
    List<Jogador> jogadores = jogo.getJogadores();
    for (int i = 0; i < jogo.getQuantidadeJogadores(); i++){
      print(jogadores[i].getNome());
      print(jogadores[i].getPontos());
    }
  }

  void clearControllers(){
    for (int i = 0; i < _pontos.length; i++){
      _pontos[i].text = "";
    }
  }

  Widget addPlayerButton(){
    return IconButton(
      icon: Icon(
        Icons.person_add,
        size: 24.0,
        color: Colors.white,
      ), 
      onPressed: () async {
        var nome = await dialog();
        if (nome != null){
          var pontos = jogo.getMaxPontos();
          setState(() {
            jogo.adicionarJogadorExtra(Jogador(nome, pontos));
          });
        }
      }
    );
  }

  Future<String> dialog() async {
    var control = (jogo.getQuantidadeJogadores() + 1);
    TextEditingController _newPlayer = new TextEditingController();
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: AlertDialog(
            title: Text(
              'Digite o nome do Jogador ${control < 10 ? "0"+control.toString() : control.toString()}',
              textAlign: TextAlign.center,
              style: GoogleFonts.fredokaOne(
                color: Colors.cyan[900],
                fontSize: 20.0,
              )
            ),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _newPlayer,
                      cursorColor: Colors.cyan[900],
                      style: GoogleFonts.fredokaOne(
                        fontSize: 20.0,
                        color: Colors.cyan[800],
                      ),
                      decoration: InputDecoration(
                        hintText: "Nome",
                        hintStyle: GoogleFonts.fredokaOne(color: Colors.cyan[800]),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan[900], width: 2.0),
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan[900], width: 1.0),
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 50.0,
                      child: RaisedButton(
                        elevation: 6.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.cyan[900], width: 2.0),
                        ),
                        color: Colors.cyan[900],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.person_add,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            Padding(padding: EdgeInsets.only(right: 15.0)),
                            Text(
                              'Adicionar',
                              style: GoogleFonts.fredokaOne(
                                color: Colors.white,
                                fontSize: 16.0,
                              )
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context, _newPlayer.text);
                        },
                      ),
                    )
                  ),
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.cyan[900], width: 5.0),
            ),
          ),
        );
      },
    );
  }

  Widget delPlayerButton(){
    if (isDeleteStateOn){
      return IconButton(
        icon: Icon(
          Icons.text_fields,
          size: 24.0,
          color: Colors.white,
        ), 
        onPressed: () {
          setState(() {
            isDeleteStateOn = false;
          });
        }
      );
    } else {
      return IconButton(
        icon: Icon(
          Icons.cancel,
          size: 24.0,
          color: Colors.white,
        ), 
        onPressed: () {
          setState(() {
            isDeleteStateOn = true;
          });
        }
      );
    }
  }

  Widget endGameButton(){
    return IconButton(
      icon: Icon(
        Icons.gamepad,
        size: 24.0,
        color: Colors.white,
      ), 
      onPressed: () {
        terminarJogoDialog();
      }
    );
  }

  Future<void> terminarJogoDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Tem certeza que deseja terminar o Jogo?',
            textAlign: TextAlign.center,
            style: GoogleFonts.fredokaOne(
              color: Colors.cyan[900],
              fontSize: 20.0,
            )
          ),
          actions: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.clear,
                    color: Colors.cyan[900],
                    size: 20.0,
                  ),
                  Padding(padding: EdgeInsets.all(3.0),),
                  Text(
                    "Cancelar",
                    style: GoogleFonts.fredokaOne(
                      color: Colors.cyan[900],
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: Colors.cyan[900],
                  width: 2.0,
                )
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }
            ),
            Padding(padding: EdgeInsets.all(4.0)),
            RaisedButton(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  Padding(padding: EdgeInsets.all(3.0),),
                  Text(
                    "Terminar",
                    style: GoogleFonts.fredokaOne(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: Colors.cyan[900],
                  width: 2.0,
                )
              ),
              color: Colors.cyan[900],
              onPressed: () {
                if (isFieldsFilled() != false){
                  salvarPontos();
                  clearControllers();
                  Navigator
                  .of(context)
                  .push(MaterialPageRoute(
                    builder: (context) => FinalizarJogo(jogo: jogo,)
                    ),
                  );
                }
              }
            ),
                ],
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.cyan[900], width: 5.0),
          ),
        );
      },
    );
  }

  Widget layoutRodada(int index, TextEditingController controller, bool isDeleteStateOn){
    if (isDeleteStateOn){
      return layoutDeletePlayers(index);
    } else {
      return layoutPointsPlayers(index, controller);
    }
  }

  Widget layoutPointsPlayers(int index, TextEditingController controller){
    var jogadores = jogo.getJogadores();
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0, left: 25.0, right: 25.0),
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "${jogadores[index].getNome()}",
              style: GoogleFonts.fredokaOne(
                color: Colors.cyan[800],
                fontSize: 20.0
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width / 4),
              child: TextFormField(
                controller: controller,
                cursorColor: Colors.cyan[900],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: GoogleFonts.fredokaOne(
                  fontSize: 20.0,
                  color: Colors.cyan[800],
                ),
                decoration: InputDecoration(
                  hintText: "Pontos",
                  hintStyle: GoogleFonts.fredokaOne(color: Colors.cyan[800], fontSize: 18.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[900], width: 3.0),
                    borderRadius: BorderRadius.circular(10.0)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[900], width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  Widget layoutDeletePlayers(int index){
    var jogadores = jogo.getJogadores();
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0, left: 25.0, right: 25.0),
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "${jogadores[index].getNome()}",
              style: GoogleFonts.fredokaOne(
                color: Colors.cyan[800],
                fontSize: 20.0
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width / 4),
              child: IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red[600],
                  size: 30.0,
                ), 
                onPressed: () {
                  setState(() {
                    jogo.removeJogadores(index);
                    jogo.removeQuantidadeJogadores();
                    if (jogo.getQuantidadeJogadores() == 3){
                      isDeleteStateOn = false;
                    }
                  });
                },
              )
            )
          ],
        ),
      )
    );
  }

  Widget appbar(){
    if (jogo.getQuantidadeJogadores() > 3 && jogo.getQuantidadeJogadores() < 15){
      return AppBarDomino(context, addPerson: addPlayerButton(), delPerson: delPlayerButton(), endGame: endGameButton()).getAppBarDomino();
    } else if (jogo.getQuantidadeJogadores() == 3){
      return AppBarDomino(context, addPerson: addPlayerButton(), endGame: endGameButton()).getAppBarDomino();
    } else {
      return AppBarDomino(context, delPerson: delPlayerButton(), endGame: endGameButton()).getAppBarDomino();
    }
  }

  getNumeroRodada(){
    switch (jogo.getQuantidadeRodadas()){
      case 1: return RodadaQuantidade().get1();
      case 2: return RodadaQuantidade().get2();
      case 3: return RodadaQuantidade().get3();
      case 4: return RodadaQuantidade().get4();
      case 5: return RodadaQuantidade().get5();
      case 6: return RodadaQuantidade().get6();
      case 7: return RodadaQuantidade().get7();
      case 8: return RodadaQuantidade().get8();
      case 9: return RodadaQuantidade().get9();
      case 10: return RodadaQuantidade().get10();
      case 11: return RodadaQuantidade().get11();
      case 12: return RodadaQuantidade().get12();
      case 13: return RodadaQuantidade().get13();
      case 14: return RodadaQuantidade().get14();
      case 15: return RodadaQuantidade().get15();
      case 16: return RodadaQuantidade().get16();
      case 17: return RodadaQuantidade().get17();
      case 18: return RodadaQuantidade().get18();
      case 19: return RodadaQuantidade().get19();
      case 20: return RodadaQuantidade().get20();
      case 21: return RodadaQuantidade().get21();
      case 22: return RodadaQuantidade().get22();
      case 23: return RodadaQuantidade().get23();
      case 24: return RodadaQuantidade().get24();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: appbar(),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Expanded(
                    child: ListView
                    .builder(
                      itemCount: jogo.getQuantidadeJogadores(),
                      itemBuilder: (BuildContext context, int i) {
                        return layoutRodada(i, _pontos[i], isDeleteStateOn);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 100.0), 
                  ),
                ],
              ),
              getNumeroRodada(),
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_forward,
            size: 28.0,
            color: Colors.white,
          ),
          backgroundColor: Colors.cyan[900],
          onPressed: ()  {
            if (isFieldsFilled() != false){
              salvarPontos();
              clearControllers();
              Navigator
              .of(context)
              .push(MaterialPageRoute(
                builder: (context) => Rodada(jogo: jogo,)
                ),
              );
            }
          }
        ),
      ),
    );
  }
}