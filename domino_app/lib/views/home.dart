import 'package:domino_app/views/entendaoapp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titulo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Dominózão",
                      style: GoogleFonts.fredokaOne(
                        fontSize: 44.0,
                        color: Colors.cyan[900],
                      )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                      child: Text(
                        "Iniciar",
                        style: GoogleFonts.fredokaOne(
                          color: Colors.cyan[900],
                          fontSize: 22.0,
                        ),
                      ),
                      elevation: 6.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.cyan[900], 
                          width: 3.0
                        )
                      ),
                      onPressed: () {
                        Navigator
                        .of(context)
                        .push(MaterialPageRoute(
                          builder: (context) => EntendaOApp()
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 30.0,
              child: Container(
                width: 80.0, 
                height: 100.0, 
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0), 
                    topRight: Radius.circular(10.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 30.0,
              child: Container(
                width: 130.0, 
                height: 80.0, 
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0), 
                    topRight: Radius.circular(10.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 135,
              top: 30.0,
              child: Container(
                width: 80.0, 
                height: 160.0, 
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 220.0,
              top: 110.0,
              child: Container(
                width: 160.0, 
                height: 80.0, 
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 105.0,
              child: Container(
                width: 130.0, 
                height: 80.0, 
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0), 
                    topRight: Radius.circular(10.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 50.0,
              bottom: 0.0,
              child: Container(
                width: 80.0, 
                height: 100.0, 
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0), 
                    topRight: Radius.circular(10.0)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 82.5,
              top: 62.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 167.5,
              top: 62.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 147.5,
              top: 122.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.pink[700],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 167.5,
              top: 142.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.pink[700],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 187.5,
              top: 162.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.pink[700],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 232.5,
              top: 122.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.pink[700],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 252.5,
              top: 142.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.pink[700],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 272.5,
              top: 162.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.pink[700],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 322.5,
              top: 122.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 322.5,
              top: 142.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 322.5,
              top: 162.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 346.5,
              top: 122.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 346.5,
              top: 142.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 346.5,
              top: 162.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 42.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 62.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 82.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 42.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 62.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 82.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 65,
              bottom: 157.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.green[900],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 97.5,
              bottom: 117.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.green[900],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 97.5,
              bottom: 72.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.green[900],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 65,
              bottom: 37.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.green[900],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 137.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 24,
              bottom: 157.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 24,
              bottom: 117.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 42.5,
              bottom: 72.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.yellow[600],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 42.5,
              bottom: 52.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.yellow[600],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 42.5,
              bottom: 32.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.yellow[600],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 82.5,
              bottom: 72.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.yellow[600],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 82.5,
              bottom: 52.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.yellow[600],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 82.5,
              bottom: 32.5,
              child: Container(
                width: 15.0, 
                height: 15.0, 
                decoration: BoxDecoration(
                  color: Colors.yellow[600],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 47.5,
              top: 40.0,
              child: Container(
                width: 6.0, 
                height: 60.0, 
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 107.5,
              child: Container(
                width: 60.0, 
                height: 6.0, 
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Positioned(
              right: 50,
              top: 120,
              child: Container(
                width: 6.0, 
                height: 60.0, 
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Positioned(
              bottom: 15.0,
              right: 40.0,
              child: Container(
                width: 60.0, 
                height: 6.0, 
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 60.0,
              child: Container(
                width: 60.0, 
                height: 6.0, 
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Positioned(
              bottom: 115.0,
              left: 45.0,
              child: Container(
                width: 6.0, 
                height: 60.0, 
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          ],
        ), 
      ),
    );
  }
}