import 'package:flutter/material.dart';
import 'package:flutter_speedcode_caffee_shop/model/brand.dart';
import 'package:flutter_speedcode_caffee_shop/model/product.dart';
import 'dart:convert';

import 'product_details.dart';

final TextStyle menuFontStyle = TextStyle(color: Colors.white, fontSize: 20);
final Color backgroundColur = Colors.white;

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> with SingleTickerProviderStateMixin {

  double ekranYuksekligi, ekranGenisligi;
  bool menuAcikMi = false;
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _scaleMenuAnimation;
  Animation<Offset> _menuOffsetAnimation;
  final Duration _duration = Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween(begin: 1.0, end: 0.6).animate(_controller);
    _scaleMenuAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _menuOffsetAnimation = Tween(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ekranYuksekligi = MediaQuery
        .of(context)
        .size
        .height;
    ekranGenisligi = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Gifty", style: TextStyle(
            fontFamily: 'nunito', fontSize: 32.0, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFF3B2B7),

        leading:
        Align(
          alignment: AlignmentDirectional(-0.6, 0),
          child: InkWell(
            onTap: () {
              setState(() {
                if (menuAcikMi) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
                menuAcikMi = !menuAcikMi;
              });
            },
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),


      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            menuOlustur(context),
            dashBoard(context),
          ],
        ),
      ),

    );
  }

  Widget menuOlustur(BuildContext context) {
    return
      Container(
        color: Color(0xFFF3B2B7),
        height: ekranYuksekligi,
        width: ekranGenisligi,
        child: SlideTransition(
          position: _menuOffsetAnimation,
          child: ScaleTransition(
            scale: _scaleMenuAnimation,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: () {
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) => AnimasyonluWidgetlar()));
                      },
                      icon: Icon(
                        Icons.restaurant_menu,
                        color: Colors.purple,
                      ),
                      label: Text(
                        "Main Page",
                        style: menuFontStyle,
                      ),
                    ),
                    FlatButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.message,
                        color: Colors.purple,
                      ),
                      label: Text(
                        "Taken gifts",
                        style: menuFontStyle,
                      ),
                    ),
                    FlatButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.accessibility_new,
                        color: Colors.purple,
                      ),
                      label: Text(
                        "Sent gifts",
                        style: menuFontStyle,
                      ),
                    ),
                    FlatButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.transform,
                        color: Colors.purple,
                      ),
                      label: Text(
                        "Settings",
                        style: menuFontStyle,
                      ),
                    ),
                    FlatButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.build,
                        color: Colors.purple,
                      ),
                      label: Text(
                        "Products",
                        style: menuFontStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }

  Widget dashBoard(BuildContext context) {
    return AnimatedPositioned(
      duration: _duration,
      //top: 0,
      //bottom: 0,
      left: menuAcikMi ? 0.2 * ekranGenisligi : 0,
      right: menuAcikMi ? -0.4 * ekranGenisligi : 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius:
          menuAcikMi ? BorderRadius.all(Radius.circular(40)) : null,
          elevation: 8,
          color: backgroundColur,
          //child: SingleChildScrollView(
          child: Container(
              height: ekranYuksekligi,
              padding: EdgeInsets.only(left: 8, right: 8, top: 8),
              child: _generateBody()
          ),
          //  ),
        ),
      ),
    );
  }

   _generateBody() {
    return ListView(
      //padding: EdgeInsets.only(left: 15.0),
      children: <Widget>[
        SizedBox(height: 15.0,),
        // Brand list
        _generateBrandList(),
        Divider(height: 30, color: Colors.grey[800],),
        SizedBox(height: 18.0,),
        // Body middle list
        _generateProductList(),
        SizedBox(height: 30.0,),

      ],
    );
  }

  // get brand list
  Future<List<Brand>> _getBrandData() async {
    var okunanjson = await DefaultAssetBundle.of(context).loadString( "assets/data/brand.json");

    List<Brand> brandList = (json.decode(okunanjson) as List).map(( jsonStr) => Brand.fromJson(jsonStr)).toList();
    return brandList;
  }

  Container _generateBrandList() {
    List<Brand> brandList;

    return Container(
        color: Colors.white,
        height: 100,
        // tum ekrana yayilsin
        width: double.infinity,
        // soldan saga akan listview

        child: FutureBuilder(
            future: _getBrandData(),

            builder: (context, result) {
              if (result.hasData) {
                brandList = result.data;

                return ListView.builder(

                    scrollDirection: Axis.horizontal,
                    itemCount: brandList.length,
                    itemBuilder: (context, index) {
                      return _brandIcon(brandList[index].name, brandList[index].logo);

                    }
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
        )
      );
  }

  _brandIcon(String imageName, String imagePath) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              padding: const EdgeInsets.all(2.0),
              // borde width
              decoration: new BoxDecoration(
                border: new Border.all(
                  width: 3.0,
                  color: Colors.red[300],
                ),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 35.0,
                backgroundImage: AssetImage(imagePath),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(width: 25),
          ],
        ),

      ],
    );
  }

  // get product list
  Future<List<Product>> _getProductData() async {
    var okunanjson = await DefaultAssetBundle.of(context).loadString(
        "assets/data/product.json");

    List<Product> productList = (json.decode(okunanjson) as List).map((
        jsonStr) => Product.fromJson(jsonStr)).toList();
    return productList;
  }

  Container _generateProductList() {
    List<Product> productList;

    return Container(
        height: 410.0,
        child: FutureBuilder(
            future: _getProductData(),
            builder: (context, result) {
              if (result.hasData) {
                productList = result.data;
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return _coffeListCard(
                          productList[index].imgPath,
                          productList[index].name,
                          productList[index].brand,
                          productList[index].description,
                          productList[index].currency +
                              productList[index].price.toString(),
                          productList[index].isFavorite);
                    }
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
        )
    );
  }

  _coffeListCard(String imgPath, String coffeName, String shopName, String description, String price, bool isFavorite) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        height: 400.0,
        width: 225.0,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300.0,
                ),
                Positioned(
                  top: 75.0,
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 20.0),
                    height: 220.0,
                    width: 225.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFDAB68C)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        Text(shopName + "\'s", style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                        SizedBox(height: 10.0),
                        Text(coffeName, style: TextStyle(fontFamily: 'varela',
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                        SizedBox(height: 10.0),
                        Text(description, style: TextStyle(fontFamily: 'nunito',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(price, style: TextStyle(fontFamily: 'varela',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3A4742))),
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white
                              ),
                              child: Center(
                                child: Icon(Icons.favorite,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                  size: 15.0,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 93.0,
                  top: 20.0,
                  child: Container(
                    height: 120,
                    width: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imgPath),
                          fit: BoxFit.contain
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ProductDetails(imgPath: imgPath)));
              },
              child: Container(
                height: 50.0,
                width: 225.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color(0xFF473D3A)
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Icon(Icons.redeem, color: Colors.white),
                        SizedBox(width: 20),
                        Text("Send Gift", style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))

                    ],

                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}