// import 'package:domino_app/models/Jogo.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class MultiselectDialog {

//   Jogo _jogo;
//   BuildContext _context;

//   MultiselectDialog(this._jogo, this._context);

//   excluirJogadores(List<String> nomes){
//     String _jogador;
//     for (int i = 0; i < nomes.length; i++){
//       _jogador = nomes[i];
//       for (int i = 0; i < _jogo.getQuantidadeJogadores(); i++){
//         if ()
//       }
//     }
//   }

//   Future<void> terminarJogoDialog() async {
//     return showDialog<void>(
//       context: _context,
//       barrierDismissible: true,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             'Selecione os Jogadores que deseja excluir',
//             textAlign: TextAlign.center,
//             style: GoogleFonts.fredokaOne(
//               color: Colors.cyan[900],
//               fontSize: 20.0,
//             )
//           ),
//           actions: <Widget>[
//             Container(
//               width: MediaQuery.of(context).size.width,
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   RaisedButton(
//               child: Row(
//                 children: <Widget>[
//                   Icon(
//                     Icons.clear,
//                     color: Colors.cyan[900],
//                     size: 20.0,
//                   ),
//                   Padding(padding: EdgeInsets.all(3.0),),
//                   Text(
//                     "Cancelar",
//                     style: GoogleFonts.fredokaOne(
//                       color: Colors.cyan[900],
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ],
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//                 side: BorderSide(
//                   color: Colors.cyan[900],
//                   width: 2.0,
//                 )
//               ),
//               color: Colors.white,
//               onPressed: () {
//                 Navigator.pop(context);
//               }
//             ),
//             Padding(padding: EdgeInsets.all(4.0)),
//             RaisedButton(
//               child: Row(
//                 children: <Widget>[
//                   Icon(
//                     Icons.delete,
//                     color: Colors.white,
//                     size: 20.0,
//                   ),
//                   Padding(padding: EdgeInsets.all(3.0),),
//                   Text(
//                     "Exluir",
//                     style: GoogleFonts.fredokaOne(
//                       color: Colors.white,
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ],
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//                 side: BorderSide(
//                   color: Colors.cyan[900],
//                   width: 2.0,
//                 )
//               ),
//               color: Colors.cyan[900],
//               onPressed: () {}
//             ),
//                 ],
//               ),
//             ),
//           ],
//           shape: RoundedRectangleBorder(
//             borderRadius: new BorderRadius.circular(10.0),
//             side: BorderSide(color: Colors.cyan[900], width: 5.0),
//           ),
//         );
//       },
//     );
//   }


// }