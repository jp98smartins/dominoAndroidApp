import 'dart:async';
import 'package:domino_app/models/AppBarDomino.dart';
import 'package:domino_app/models/Jogador.dart';
import 'package:domino_app/models/Jogo.dart';
import 'package:domino_app/models/RodadaQuantidade.dart';
import 'package:domino_app/views/rodada.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdicionarJogadores extends StatelessWidget {
  
  final Jogo jogo;

  AdicionarJogadores({Key key, @required this.jogo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titulo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAdicionarJogadores(jogo: jogo,),
    );
  }
}

class MyAdicionarJogadores extends StatefulWidget {

  final Jogo jogo;

  MyAdicionarJogadores({Key key, @required this.jogo}) : super(key : key);

  @override
  _MyAdicionarJogadoresState createState() => _MyAdicionarJogadoresState(jogo: jogo);
}

class _MyAdicionarJogadoresState extends State<MyAdicionarJogadores> {
  
  final Jogo jogo;

  _MyAdicionarJogadoresState({Key key, @required this.jogo});

  final _scrollController = ScrollController();
  void _scroll(){
    Timer(Duration(milliseconds: 300), 
    () => _scrollController
    .animateTo(_scrollController.position.maxScrollExtent,
    duration: Duration(milliseconds: 500), 
    curve: Curves.ease));
  }
  
  static List<TextEditingController> _jogadores = [
    new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(),
    new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(),
    new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(), new TextEditingController(),
  ]; 

  void salvarJogadores() {
    for (int i = 0; i < jogo.getQuantidadeJogadores(); i++){
      jogo.setJogadores(Jogador(_jogadores[i].text, 0));
    }
  }

  void clearControllers() {
    for (int i = 0; i < _jogadores.length; i++){
      _jogadores[i].text = "";
    }
  }

  Widget addPlayerButton(){
    return IconButton(
      icon: Icon(
        Icons.person_add,
        size: 24.0,
        color: Colors.white,
      ), 
      onPressed: () {
        setState(() {
          if(jogo.getQuantidadeJogadores() < 15){
            jogo.setQuantidadeJogadores();
          }
        });
        _scroll();
      }
    );
  }

  Widget deleteButton(int index){
    return IconButton(
      icon: Icon(
        Icons.cancel,
        size: 30.0,
        color: Colors.red[600],
      ), 
      onPressed: () {
        deletePlayerDialog(index);
      }
    );
  }

  mantainingData(int index){
    if ((index + 1) == jogo.getQuantidadeJogadores()){
      setState(() {
        if(jogo.getQuantidadeJogadores() > 3){
          jogo.removeQuantidadeJogadores();
        }
      });
    } else {
      for (int i = index; i < jogo.getQuantidadeJogadores(); i++){
        for (int j = (i + 1); j < (i + 2); j++){
          _jogadores[i].text = _jogadores[j].text;
        }
      }
      setState(() {
        if(jogo.getQuantidadeJogadores() > 3){
          jogo.removeQuantidadeJogadores();
        }
      });
    }
  }

  Future<void> deletePlayerDialog(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Tem certeza que deseja excluir o Jogador ${index < 10 ? "0" + (index + 1).toString() : (index + 1).toString()}?',
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
                    "Excluir",
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
                mantainingData(index);
                Navigator.pop(context);
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

  Widget appbar(){
    if (jogo.getQuantidadeJogadores() == 15){
      return AppBarDomino(context).getAppBarDomino();
    } else {
      return AppBarDomino(context, addPerson: addPlayerButton()).getAppBarDomino();
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
                      controller: _scrollController,
                      itemCount: jogo.getQuantidadeJogadores(),
                      itemBuilder: (BuildContext context, int i) {
                        return jogo.layoutNamePlayers(context, i, _jogadores[i], deleteButton(i));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 100.0), 
                  ),
                ],
              ),
              RodadaQuantidade().get24(),
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
          onPressed: () {
            salvarJogadores();
            clearControllers();
            Navigator
            .of(context)
            .push(MaterialPageRoute(
              builder: (context) => Rodada(jogo: jogo,)
              ),
            );
          }
        ),
      ),
    );
  }
}