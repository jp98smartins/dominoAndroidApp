import 'package:domino_app/models/AppBarDomino.dart';
import 'package:domino_app/models/Jogo.dart';
import 'package:domino_app/views/adicionarjogadores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class FinalizarJogo extends StatelessWidget {
  final Jogo jogo;

  FinalizarJogo({Key key, @required this.jogo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titulo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFinalizarJogo(jogo: jogo,),
    );
  }
}

class MyFinalizarJogo extends StatefulWidget {
  
  final Jogo jogo;

  MyFinalizarJogo({Key key, @required this.jogo}) : super(key: key);

  @override
  _MyFinalizarJogoState createState() => _MyFinalizarJogoState(jogo: jogo);
}

class _MyFinalizarJogoState extends State<MyFinalizarJogo> {

  final Jogo jogo;

  _MyFinalizarJogoState({Key key, @required this.jogo});

  Future<void> endgameDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: <Widget>[
              Text(
                'Fim do Jogo!',
                textAlign: TextAlign.center,
                style: GoogleFonts.fredokaOne(
                  color: Colors.cyan[900],
                  fontSize: 20.0,
                )
              ),
              Text(
                'O que deseja fazer?',
                textAlign: TextAlign.center,
                style: GoogleFonts.fredokaOne(
                  color: Colors.cyan[900],
                  fontSize: 20.0,
                )
              ),
            ],
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
                  Text(
                    "Fechar Jogo",
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
                SystemNavigator.pop();
              }
            ),
            Padding(padding: EdgeInsets.all(4.0)),
            RaisedButton(
              child: Row(
                children: <Widget>[
                  Text(
                    "Novo Jogo",
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
                var id = jogo.getId();
                id++;
                Navigator
                .of(context)
                .push(MaterialPageRoute(
                  builder: (context) => AdicionarJogadores(jogo: Jogo(id))
                  ),
                );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDomino(context).getAppBarDomino(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 30.0),
                  child: Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "Fim do Jogo!",
                        style: GoogleFonts.fredokaOne(
                          fontSize: 32.0,
                          color: Colors.cyan[900],
                        ),
                      ),
                    )
                  ),
                ),
                Expanded(
                  child: ListView
                  .builder(
                    itemCount: jogo.getQuantidadeJogadores(),
                    itemBuilder: (BuildContext context, int i) {
                      return jogo.layoutPodiumPlayers(context, i);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        backgroundColor: Colors.cyan[900],
        onPressed: () {
          endgameDialog();
        },
      ),
    );
  }
}