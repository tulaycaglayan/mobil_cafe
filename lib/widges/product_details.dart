import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {

  String imgPath;

  ProductDetails({this.imgPath});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();


}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height -20.0,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFF3B2B7),
              ),
              Positioned(
                top:  MediaQuery.of(context).size.height/2,
                child: Container(
                  height: MediaQuery.of(context).size.height/2-20.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                    color: Colors.white
                  ),
                ),
              ),

              // Content
              Positioned(
                top: ( MediaQuery.of(context).size.height/2) + 25.0,
                left: 15.0,
                child: Container(
                  height: (MediaQuery.of(context).size.height/2) -50.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: <Widget>[
                      Text("Preparation Time", style: TextStyle(fontFamily: 'nunito', fontSize: 15.0, fontWeight: FontWeight.bold, color: Color(0xFF726B68))),
                      SizedBox(height: 7.0,),
                      Text("5 min", style: TextStyle(fontFamily: 'nunito', fontSize: 15.0, fontWeight: FontWeight.bold, color: Color(0xFFC6C4C4))),
                      SizedBox(height: 10.0,),
                      // This is the line
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Container(
                          height: 0.5,
                          color: Color(0xFFC6C4C4)
                        ),
                      ),
                      Text("Ingredients", style: TextStyle(fontFamily: 'nunito', fontSize: 15.0, fontWeight: FontWeight.bold, color: Color(0xFF726B68))),
                      SizedBox(height: 20),
                      Container(
                        height: 110.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            buildIngredientItem("water", Icon(Icons.pin_drop),  Color(0xFF6FC5DA)),//Icon(Feather.getIconData("droplet")
                            buildIngredientItem("Brewed Expresso", Icon(Icons.ac_unit), Color(0xFF615955)),//Icon(Feather.getIconData("target")
                            buildIngredientItem("Sugar", Icon(Icons.cake), Color(0xFFF39595)),//Icon(Feather.getIconData("target")
                            buildIngredientItem("Toffee Nut Syrup", Icon(Icons.shopping_basket), Color(0xFF3B8079)),//Icon(Feather.getIconData("peanut")
                            buildIngredientItem("Vanilla Syrup", Icon(Icons.settings), Color(0xFFF8B870)),//Icon(Feather.getIconData("target")
                            SizedBox(width: 25),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 35.0),
                        child: Container(
                          height: 0.5,
                          color: Color(0xFFC6C4C4),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Nutrition Information",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: "nunito", fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xFF726B68)),)
                    ],
                  ),
                ),
              ),

              Positioned(
                top: (MediaQuery.of(context).size.height/10)+30,
                left: (MediaQuery.of(context).size.width/3) +10,
                child: Container(
                  height: 350.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(widget.imgPath), fit: BoxFit.cover)
                  ),
                ),
              ),

              Positioned(
                top: 25.0,
                left: 15.0,
                child: Container(
                  height: 300.0,
                  width: 250.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment:CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: 160,
                            child: Text("Caramel Macchiato",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 30.0, fontFamily: "varela", fontWeight:FontWeight.bold, color: Colors.white),),
                          ),
                          SizedBox(width: 5),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                            ),
                            child: Center(
                              child: Icon(Icons.favorite, size: 18.0,color: Colors.red),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: 170,
                        child: Text("Fresly steamed milk with vanilla-flovered nutt and sugar..",
                          style: TextStyle(fontSize: 13.0, fontFamily: "nunito", color: Colors.white),),

                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  buildIngredientItem(String name , Icon iconName, Color bgColor){
    return Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: bgColor
              ),
              child: Center(
                child: iconName,
              ),
            ),
            SizedBox(height: 4.0),
            Container(
              width: 60.0,
              child: Center(
                child: Text(name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12.0, fontFamily: "nunito", color: Color(0xFFC2C0C0)),),
              ),
            )
        ],
      ),
    );
  }
}
