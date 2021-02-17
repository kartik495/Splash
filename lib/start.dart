import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  Start({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  var orange = Colors.white;
  var blue = Colors.white;
  var red = Colors.white;
  var purple = Colors.white;

  @override
  void initState() {
    super.initState();
    var delay = 500;

    Future.delayed(Duration(milliseconds: delay), () {
      setState(() {
        orange = Colors.orange;
      });
    });

    Future.delayed(Duration(milliseconds: 2 * delay), () {
      setState(() {
        blue = Colors.blue;
      });
    });

    Future.delayed(Duration(milliseconds: 3 * delay), () {
      setState(() {
        purple = Colors.purple;
      });
    });

    Future.delayed(Duration(milliseconds: 4 * delay), () {
      setState(() {
        red = Colors.red;
      });
    });

    Future.delayed(Duration(milliseconds: 4 * delay + 1000), () {
      setState(() {
        Navigator.pushNamed(context, '/dashboard');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          left: width / 2 - 130,
          top: height / 2 - 110,
          child: ImageIcon(
            AssetImage('assets/orange.png'),
            size: 170,
            color: orange,
          ),
        ),
        Positioned(
          left: width / 2 - 150,
          top: height / 2 - 70,
          child: ImageIcon(
            AssetImage('assets/blue.png'),
            size: 230,
            color: blue,
          ),
        ),
        Positioned(
          left: width / 2 - 70,
          top: height / 2 - 70,
          child: ImageIcon(
            AssetImage('assets/purple.png'),
            size: 230,
            color: purple,
          ),
        ),
        Positioned(
          left: width / 2 - 70,
          top: height / 2 - 130,
          child: ImageIcon(
            AssetImage('assets/red.png'),
            size: 200,
            color: red,
          ),
        ),
        Positioned(
          left: width / 2 - 100,
          top: height / 2 - 100,
          child: ImageIcon(
            AssetImage('assets/White.png'),
            size: 200,
            color: Colors.white,
          ),
        )
      ],
    ));
  }
}
