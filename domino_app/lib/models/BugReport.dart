import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class BugReport {
  final _mykey = GlobalKey<FormState>();
  TextEditingController _messagecontroller = new TextEditingController();
  static String _emailBody;
  BuildContext _context;

  bool _isSendState = false;

  BugReport(this._context);

  sendEmail() async {
    String username = "dominozaoapp@gmail.com";
    String password = "dominoAPP_";

    final smtpServer = gmail(username, password); 
    // Creating the Gmail server

    // Create our email message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add(username) //recipent email
      ..subject = 'Bug Report' //subject of the email
      ..text = _emailBody;

    try {
      var teste = await send(message, smtpServer);
      print(teste);
    } on MailerException catch (e) {
      print('Message not sent. \n'+ e.toString());
    }
  }

  Widget _form(BuildContext context){
    return Form(
      key: _mykey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _messagecontroller,
              cursorColor: Colors.cyan[900],
              maxLines: null,
              style: GoogleFonts.fredokaOne(
                fontSize: 20.0,
                color: Colors.cyan[800],
              ),
              decoration: InputDecoration(
                hintText: "Descrição do Bug",
                hintStyle: GoogleFonts.fredokaOne(color: Colors.cyan[800], fontSize: 16.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan[900], width: 2.0),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan[900], width: 1.0),
                  borderRadius: BorderRadius.circular(10.0)
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Insira a Descrição do Bug';
                }
                return null;
              },
            ),
          ),
        ],
      )
    );
  }

  Future<void> dialog() async {
    return showDialog<void>(
      context: _context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: AlertDialog(
            title: Column(
              children: <Widget>[
                Text(
                  'Encontrou um Bug?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.fredokaOne(
                    color: Colors.cyan[900],
                    fontSize: 20.0,
                  )
                ),
                Text(
                  'Me Conte!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.fredokaOne(
                    color: Colors.cyan[900],
                    fontSize: 20.0,
                  )
                ),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _form(context),
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
                              Icons.send,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            Padding(padding: EdgeInsets.only(right: 15.0)),
                            Text(
                              'Enviar',
                              style: GoogleFonts.fredokaOne(
                                color: Colors.white,
                                fontSize: 16.0,
                              )
                            ),
                          ],
                        ),
                        onPressed: () async {
                          if (_messagecontroller.text != null && _messagecontroller.text != '') {
                            _emailBody = _messagecontroller.text;
                            Navigator.pop(context);
                            loadingDialog(context);
                          }
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

  Future<void> loadingDialog(BuildContext context) async {
    return showDialog<void>(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 1), () async {
          await sendEmail();
          Navigator.pop(context);
          thanksDialog();
        });
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan[900]),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.cyan[900], width: 5.0),
          ),
        );
      },
    );
  }

  Future<void> thanksDialog() async {
    return showDialog<void>(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pop(context);
        });
        return AlertDialog(
          title: Text(
            'Obrigado pelo Feedback!',
            textAlign: TextAlign.center,
            style: GoogleFonts.fredokaOne(
              color: Colors.cyan[900],
              fontSize: 20.0,
            )
          ),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.cyan[900], width: 5.0),
          ),
        );
      },
    );
  }
}