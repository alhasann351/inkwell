import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          labelLarge: TextStyle(fontSize: 19, color: Colors.white),
        ),
        primaryColor: const Color(0xFFFC6736),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //snackBar
  mySnackBar(context, msg) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          //backgroundColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Inkwell',
          style: GoogleFonts.montserrat(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Or your desired color
          ),
        ),
      ),
      body: Center(
        child: InkWell(
          splashColor: Colors.grey,
          onDoubleTap: () {
            mySnackBar(context, 'Double Tap');
          },
          onTap: (){
            mySnackBar(context, 'Tap');
          },
          onLongPress: (){
            mySnackBar(context, 'Long Press');
          },
          onTapDown: (TapDownDetails details){
            mySnackBar(context, 'Tap Down');
          },
          child: Container(
            height: 60,
            width: 250,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                //stops: [0.5, 0.7],
                colors: [
                  Color(0xFF0C2D57),
                  Color(0xFFFC6736),
                  Color(0xFF73FF00),
                ],
              ),
            ),
            child: Text(
              'Inkwell',
              style: GoogleFonts.amaranth(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
