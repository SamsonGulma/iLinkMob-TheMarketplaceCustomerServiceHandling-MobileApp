import 'package:flutter/material.dart';

import '../widget/widget_support.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(7),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(14),
            height: 250,
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

    );
  }
}
