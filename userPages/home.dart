import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ilink/pages/details.dart';
import 'package:ilink/pages/profile.dart';
import 'package:ilink/pages/wishCart.dart';
import 'package:ilink/service/database.dart';
import 'package:ilink/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {



  bool furniture = false;
  bool phone = false;
  bool laptop = false;
  bool cloth = false;

  Stream? salesitemStream;

  ontheload()async{
    salesitemStream = await DatabaseMethods().getSalesItem("phone");

    setState(() {

    });
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItem(){

    return StreamBuilder(stream: salesitemStream, builder: (context, AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
        padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder:(context, index){
          DocumentSnapshot ds = snapshot.data.docs[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Details()));
            },
            child: Container(
              margin: EdgeInsets.all(7),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(14),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("images/furniture.jpg", height: 150, width: 150, fit: BoxFit.cover,),
                      Text("Sofa", style: AppWidget.semiBoldTextFeildStyle(),),
                      Text("Medium in Size", style: AppWidget.LightTextFeildStyle(),),
                      Text("ETB 8000", style: AppWidget.semiBoldTextFeildStyle(),),
                    ],),
                ),
              ),
            ),
          );

          }):CircularProgressIndicator();
    }

    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _refresh(){
      return Future.delayed(Duration(seconds: 4));
    }
    return Scaffold(
        backgroundColor: Colors.brown.shade50,
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      Container(

                      ),

                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()));
                             },
                            child: Container(
                              margin: EdgeInsets.only(right: 10.0, top: 20.0),
                              padding: EdgeInsets.all(3),
                              child: Icon(Icons.shopping_cart_outlined, color:Colors.black,),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 20.0),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.person, size: 40,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome, Samson G T",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17.0,
                                    color: Colors.black),
                            ),
                            Text("Special for you from your surroundings",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                    color: Colors.indigoAccent.shade700
                                )
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 30.0,),
                  Container(
                      margin: EdgeInsets.only(right: 20.0),
                      child: showItem()),
                  SizedBox(height: 20.0,),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row
                      (children: [

                      SizedBox(width: 15.0,),

                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Details()));
                        },
                        child: Container(
                          margin: EdgeInsets.all(7),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(14),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("images/dellLaptop.jpg", height: 150, width: 150, fit: BoxFit.cover,),
                                  Text("Dell", style: AppWidget.semiBoldTextFeildStyle(),),
                                  Text("Slim Dell touch screen", style: AppWidget.LightTextFeildStyle(),),
                                  Text("ETB 58000", style: AppWidget.semiBoldTextFeildStyle(),),
                                ],),
                            ),
                          ),
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("images/furniture.jpg", height: 150, width: 150, fit: BoxFit.values[2],),
                                Text("Furniture", style: AppWidget.semiBoldTextFeildStyle(),),
                                Text("Sofa", style: AppWidget.LightTextFeildStyle(),),
                                Text("ETB 7000", style: AppWidget.semiBoldTextFeildStyle(),),
                              ],),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.0,),

                      Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("images/laptop.jpg", height: 150, width: 150, fit: BoxFit.values[1],),
                                Text("Laptop", style: AppWidget.semiBoldTextFeildStyle(),),
                                Text("hp", style: AppWidget.LightTextFeildStyle(),),
                                Text("ETB 58000", style: AppWidget.semiBoldTextFeildStyle(),),
                              ],),
                          ),
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("images/clothing.jpg", height: 150, width: 150, fit: BoxFit.values[4],),
                                Text("Shirt", style: AppWidget.semiBoldTextFeildStyle(),),
                                Text("Medium in Size", style: AppWidget.LightTextFeildStyle(),),
                                Text("ETB 1300", style: AppWidget.semiBoldTextFeildStyle(),),
                              ],),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("images/phone.jpg", height: 150, width: 150, fit: BoxFit.cover,),
                                Text("iphones", style: AppWidget.semiBoldTextFeildStyle(),),
                                Text("Brand new", style: AppWidget.LightTextFeildStyle(),),
                                Text("Starting from ETB 65000+", style: AppWidget.semiBoldTextFeildStyle(),),
                              ],),
                          ),
                        ),
                      ),
                    ],
                    ),
                  ),

                  SizedBox(height: 30.0,),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20.0),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Image.asset("images/laptop.jpg", height: 150, width: 150, fit: BoxFit.contain,),
                                SizedBox(height: 10.0,),
                                Column(children: [

                                   Container(
                                       width: MediaQuery.of(context).size.width/2,
                                       child: Text("hp", style: AppWidget.semiBoldTextFeildStyle(),)),
                                  SizedBox(height: 5.0,),
                                  Container(
                                      width: MediaQuery.of(context).size.width/2,
                                      child: Text("RYZEN 5 3450u 3.5ghz Turbo Speed 4core 8cpu Model : inspiron 3505 Condition: New", style: AppWidget.LightTextFeildStyle(),)),
                                  SizedBox(height: 5.0,),
                                  Container(
                                      width: MediaQuery.of(context).size.width/2,
                                      child: Text("ETB 47000", style: AppWidget.semiBoldTextFeildStyle(),)),
                              ],),
                              ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),

                        Container(
                          margin: EdgeInsets.only(right: 20.0),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("images/phone.jpg", height: 150, width: 150, fit: BoxFit.values[1],),
                                  SizedBox(height: 10.0,),
                                  Column(children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("iPhone, Samsung,...", style: AppWidget.semiBoldTextFeildStyle(),)),
                                    SizedBox(height: 5.0,),
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("We have brand new, packed phones; iPhone, samsung, huawie,...", style: AppWidget.LightTextFeildStyle(),)),
                                    SizedBox(height: 5.0,),
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("Contact us", style: AppWidget.semiBoldTextFeildStyle(),)),
                                  ],),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20.0,),

                        Container(
                          margin: EdgeInsets.only(right: 20.0),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("images/clothing.jpg", height: 150, width: 150, fit: BoxFit.cover,),
                                  SizedBox(width: 10.0,),
                                  Column(children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("We have all kinds of cloths in your choice", style: AppWidget.semiBoldTextFeildStyle(),)),
                                    SizedBox(height: 5.0,),
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("T-shirts, Coats, Shirts,...", style: AppWidget.LightTextFeildStyle(),)),
                                    SizedBox(height: 5.0,),
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Text("Starting from \n ETB 2000+", style: AppWidget.semiBoldTextFeildStyle(),)),
                                  ],),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget showItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        // FOR THE FURNITURE
        GestureDetector(
          onTap: (){
            furniture = true;
            phone = false;
            laptop = false;
            cloth = false;
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: furniture?Colors.black: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("images/icons8-furniture-100.png", height:  50, width: 50, fit: BoxFit.cover, color: furniture? Colors.white: Colors.black,),
            ),
          ),
        ),

        // FOR THE PHONE
        GestureDetector(
          onTap: (){
            furniture = false;
            phone = true;
            laptop = false;
            cloth = false;
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: phone?Colors.black: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("images/icons8-iphone-14.png", height:  50, width: 50, fit: BoxFit.cover, color: phone? Colors.white: Colors.black,),
            ),
          ),
        ),

        // FOR THE LAPTOP
        GestureDetector(
          onTap: (){
            furniture = false;
            phone = false;
            laptop = true;
            cloth = false;
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: laptop?Colors.black: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("images/icons8-laptop-100.png", height:  50, width: 50, fit: BoxFit.cover, color: laptop? Colors.white: Colors.black,),
            ),
          ),
        ),

        // FOR THE SHIRT
        GestureDetector(
          onTap: (){
            furniture = false;
            phone = false;
            laptop = false;
            cloth = true;
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: cloth?Colors.black: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("images/icons8-shirt-100.png", height:  50, width: 50, fit: BoxFit.cover, color: cloth? Colors.white: Colors.black,),
            ),
          ),
        ),
      ],
    );
  }
}
