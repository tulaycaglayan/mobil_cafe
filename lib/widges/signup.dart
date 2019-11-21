import 'package:flutter/material.dart';

import 'login.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignUp(),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: <Widget>[
                  _getHeader(),
                  _getTextFields(),
                  _getSignUp(),
                  _getBottomRow(context),
                ],
              ),
            ),
            _getBackBtn()
          ],
        ),
      ),
    );
  }

  _getBackBtn() {
    return Positioned(
      top: 35,
      left: 25,
      child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
    );
  }

  _getHeader() {
    return Expanded(
      flex: 3,
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Text("Create\nAccount",
            style: TextStyle(color: Colors.white, fontSize: 44, fontFamily: "Ubuntu")),
      ),
    );
  }

  _getTextFields() {
    return Expanded(
      flex: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                labelText: "Name",
                labelStyle: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                labelText: "Phone",
                labelStyle: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  _getSignUp() {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Sign Up",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            radius: 40,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  _getBottomRow(context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => LoginPage()));
            },
            child: Text(
              "Sign In",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Text(
            '',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundSignUp extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.65);
    blueWave.cubicTo(sw * 0.8, sh * 0.8, sw * 0.55, sh * 0.8, sw * 0.45, sh);
    blueWave.lineTo(0, sh);
    blueWave.close();
    paint.color = Color(0xFFF3B2B7);
    canvas.drawPath(blueWave, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.3);
    greyWave.cubicTo(sw * 0.65, sh * 0.45, sw * 0.25, sh * 0.35, 0, sh * 0.5);
    greyWave.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
