import 'package:domino_app/models/BugReport.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarDomino {

  final BuildContext _context;
  Widget addPerson;
  Widget delPerson;
  Widget endGame;

  AppBarDomino(this._context, {this.addPerson = const Padding(padding: EdgeInsets.all(0.0)), this.delPerson = const Padding(padding: EdgeInsets.all(0.0)), this.endGame = const Padding(padding: EdgeInsets.all(0.0))});

  Widget getAppBarDomino(){
    return AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            "Dominózão",
            style: GoogleFonts.fredokaOne(
              fontSize: 22.0,
              color: Colors.white,
            )
          ),
        ),
        backgroundColor: Colors.cyan[900],
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.bug_report,
              size: 24.0,
              color: Colors.white,
            ), 
            onPressed: () {
              BugReport(_context).dialog();
            }
          ),
          addPerson,
          delPerson,
          endGame
        ],
      );
  }

}