import 'package:flutter/material.dart';
import 'product_list.dart';
import 'signup.dart';


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: <Widget>[
                  _getHeader(),
                  _getTextFields(),
                  _getSignIn(),
                  _getBottomRow(),
                ],
              ),
            ),
            _getBackBtn(),
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
      flex: 4,
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Text("Welcome\nGifty",
            style: TextStyle(
                color: Colors.white, fontSize: 44, fontFamily: "nunito")),
      ),
    );
  }

  _getTextFields() {
    return Expanded(
      flex: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(labelText: "Phone"),
          ),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(labelText: "Password"),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  _getSignIn() {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Sign In",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          //ListPage()
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductList()));
              //do what you want here
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              radius: 40,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getBottomRow() {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
             Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Text(
            "Forget Password",
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

class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var bluePaint = Paint();
    var greyPaint = Paint();
    var yellowPaint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    bluePaint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, bluePaint);

    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.5);
    blueWave.quadraticBezierTo(sw * 0.5, sh * 0.45, sw * 0.2, 0);
    blueWave.close();
    bluePaint.color = Color(0xFFF3B2B7);
    canvas.drawPath(blueWave, bluePaint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.1);
    greyWave.cubicTo(
        sw * 0.95, sh * 0.15, sw * 0.65, sh * 0.15, sw * 0.6, sh * 0.38);
    greyWave.cubicTo(sw * 0.52, sh * 0.52, sw * 0.05, sh * 0.45, 0, sh * 0.4);
    greyWave.close();
    greyPaint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, greyPaint);

    Path yellowWave = Path();
    yellowWave.lineTo(sw * 0.7, 0);
    yellowWave.cubicTo(
        sw * 0.6, sh * 0.05, sw * 0.27, sh * 0.01, sw * 0.18, sh * 0.12);
    yellowWave.quadraticBezierTo(sw * 0.12, sh * 0.2, 0, sh * 0.2);
    yellowWave.close();
    yellowPaint.color = Color(0xFFDAB68C);
    canvas.drawPath(yellowWave, yellowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}


