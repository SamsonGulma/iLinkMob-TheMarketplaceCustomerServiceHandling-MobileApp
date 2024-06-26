import 'package:flutter/material.dart';
import 'package:ilink/widget/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
              child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,)),
            Image.asset(
              'images/dellLaptop.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              fit: BoxFit.fill,),

            SizedBox(height: 15.0),

            Row(
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Laptop', style: AppWidget.semiBoldTextFeildStyle(),),
                  Text('SLIM DELL touch screen,', style: AppWidget.boldTextFeildStyle(),),
                ],
              ),

                Spacer(),
                Container(
                  decoration: BoxDecoration(color: Colors.grey.shade800, borderRadius: BorderRadius.circular(8),),
                  child: Icon(Icons.report, color: Colors.white,) ,
                  width: 30.0,
                  height: 30.0,
                ),
                SizedBox(width: 10.0),

            ],),

            SizedBox(height: 10.0,),
             Text("""
  RYZEN 5 3450u 3.5ghz Turbo Speed 4core 8cpu 
  Model : inspiron 3505
  Condition: New
  Screen :15.6 inch FHD
  1080p.Touch screen
  Storage : 256gb SSD & HDD slot
  Ram : 8gb DDR4 
  2gb Radeon  Dedicated Graphics
  4hr.+ hours battery life
  FHD webcam
  HD Sound system, thin,sleek and lightweight!""",
                style: AppWidget.LightTextFeildStyle(),),
            
            SizedBox(height: 20.0,),
            Row(
              children: [
                Column(
                  children: [
                    Text("Contact Address", 
                      style: AppWidget.semiBoldTextFeildStyle(),),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.green,),
                        Text("+251 944228875", 
                          style: AppWidget.LightTextFeildStyle(),),
                      ]
                    ),


                  ],
                ),

              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price", style: AppWidget.semiBoldTextFeildStyle(),),
                      Text("ETB 8000", style: AppWidget.HeadlineTextFeildStyle(),)
                    ],),

                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Add to your\n wish cart", style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: 'Poppins'),),
                        SizedBox(width: 10.0,),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.grey , borderRadius: BorderRadius.circular(8)
                          ),
                          child: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                        ),
                        SizedBox(width: 5.0,)
                      ],
                    ),


                  ),
                ],
              ),
            )
        ],
        ),
      ),
    );
  }
}
