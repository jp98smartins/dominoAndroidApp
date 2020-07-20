import 'package:domino_app/models/Jogo.dart';
import 'package:domino_app/models/RodadaQuantidade.dart';
import 'package:domino_app/views/adicionarjogadores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:domino_app/models/AppBarDomino.dart';

class EntendaOApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titulo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyEntendaOApp(),
    );
  }
}

class MyEntendaOApp extends StatefulWidget {
  @override
  _MyEntendaOAppState createState() => _MyEntendaOAppState();
}

class _MyEntendaOAppState extends State<MyEntendaOApp> {

  static int jogoID = 0;

  Widget getCards(BuildContext context, int index){
    List<Widget> cards = [
      Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.cyan[900], width: 5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 6.0,
                spreadRadius: 1.0
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width,
          height: 160.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15.0, right: 15.0, left: 15.0), 
                child: Text(
                  "Objetivo do Aplicativo",
                  style: GoogleFonts.fredokaOne(
                    fontSize: 24.0,
                    color: Colors.cyan[900],
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Center(
                  child: Text(
                    "Este app não é um jogo! Ele têm o intuito de ser um meio rápido, simples de contagem dos pontos das partidas do Dominózão.",
                    style: GoogleFonts.fredokaOne(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.cyan[700],
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.cyan[900], width: 5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 6.0,
                spreadRadius: 1.0
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width,
          height: 330.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0), 
                child: Text(
                  "Interface do Aplicativo",
                  style: GoogleFonts.fredokaOne(
                    fontSize: 24.0,
                    color: Colors.cyan[900],
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0, left: 30.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.person_add, 
                      color: Colors.cyan[700],
                      size: 28.0,
                    ),
                    Text(
                      "Adicionar um Novo Jogador",
                      style: GoogleFonts.fredokaOne(
                        color: Colors.cyan[700],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 30.0, right: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.cancel,
                      color: Colors.cyan[700],
                      size: 30.0,
                    ),
                    Text(
                      "Excluir um Jogador",
                      style: GoogleFonts.fredokaOne(
                        color: Colors.cyan[700]
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 30.0, right: 45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.text_fields,
                      color: Colors.cyan[700],
                      size: 30.0,
                    ),
                    Text(
                      "Adicionar Pontuação",
                      style: GoogleFonts.fredokaOne(
                        color: Colors.cyan[700]
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 30.0, right: 55.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.games,
                      color: Colors.cyan[700],
                      size: 30.0,
                    ),
                    Text(
                      "Finalizar o Jogo",
                      style: GoogleFonts.fredokaOne(
                        color: Colors.cyan[700]
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 30.0, right: 55.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.bug_report,
                      color: Colors.cyan[700],
                      size: 32.0,
                    ),
                    Text(
                      "Reportar um Bug",
                      style: GoogleFonts.fredokaOne(
                        color: Colors.cyan[700]
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 30.0, right: 30.0),
                child: Flexible(
                  child: Text(
                    "O Número de rodadas do Jogo é representado pela peça de dominó abaixo!",
                    style: GoogleFonts.fredokaOne(
                      color: Colors.cyan[700]
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    ];

    if (index == 0){
      return cards[index];
    } else {
      return cards[index];
    }
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDomino(context).getAppBarDomino(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ListView
                  .builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int i) {
                      return getCards(context, i);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 100.0),
                ),
              ],
            ),
            RodadaQuantidade().get6(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward,
          size: 28.0,
          color: Colors.white,
        ),
        backgroundColor: Colors.cyan[900],
        onPressed: () {
          Navigator
          .of(context)
          .push(MaterialPageRoute(
            builder: (context) => AdicionarJogadores(jogo: Jogo(jogoID))
            ),
          );
        }
      ),
    );
  }
}