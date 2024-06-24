import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ilink/admin/admin_home.dart';
import 'package:ilink/admin/admin_panel.dart';
import 'package:ilink/widget/widget_support.dart';



class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  String email = "", password = "";

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController adminidcontroller = new TextEditingController();
  TextEditingController adminpasswordcontroller = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown.shade50,
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              margin: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),

              child: Column(
                children: [
                  SizedBox(height: 100.0,),
                  ClipOval(child:
                  SizedBox.fromSize(size: Size.fromRadius(30),child: Center(child: Image.asset("assets/logo-foreground.png", fit: BoxFit.cover,)))),
                  SizedBox(height: 0.0,),

                  Form(
                    key: _formkey,
                    child: Column(

                      children: [
                        SizedBox(height: 5.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Admin Login", style: AppWidget.HeadlineTextFeildStyle(),),
                            SizedBox(height: 15.0,),
                            Row(
                              children: [
                                Icon(Icons.warning, color: Colors.red,),
                                Text("Admin Only!!!", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 20.0),),
                              ]
                            )

                          ],
                        ),


                        SizedBox(height: 10.0,),
                        TextFormField(
                          controller: adminidcontroller,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Please Enter Admin Email";
                            }
                            return null;
                          },
                          decoration:
                          InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)
                              ),
                              hintText: "Admin Id",
                              hintStyle: AppWidget.LightTextFeildStyle(),
                              prefixIcon: Icon(Icons.key, color: Colors.black,)),
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          controller: adminpasswordcontroller,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Please Enter Admin Password";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)
                              ),
                              hintText: "Admin Password",
                              hintStyle: AppWidget.LightTextFeildStyle(),
                              prefixIcon: Icon(Icons.password, color: Colors.black,)),
                        ),

                        SizedBox(height: 50.0,),
                        GestureDetector(
                          onTap: (){
                            LoginAdmin();
                          },
                          child: Container(

                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
                              width: 120.0,
                              height: 40.0,
                              child: Center(child: Text("LOGIN", style: TextStyle(color: Colors.white, fontFamily: 'Poppins1', fontSize: 18.0, fontWeight: FontWeight.bold),
                              )
                              ),
                            ),
                          ),
                        )

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

  LoginAdmin(){
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot){
      snapshot.docs.forEach((result) {

          if(result.data()['password'] != adminpasswordcontroller.text.trim() && result.data()['id'] != adminidcontroller.text.trim()){


            ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('Please check your Id-key or password!, It might not be correct', style: TextStyle(fontSize: 18.0),),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 100,
                right: 20,
                left: 20),
          ));
        }
        else if(result.data()['id'] != adminidcontroller.text.trim()){

          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('Oops your Id-key is not correct', style: TextStyle(fontSize: 18.0),),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 100,
                right: 20,
                left: 20),
          ));
        }
        else if(result.data()['password'] != adminpasswordcontroller.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('Oops your password is not correct', style: TextStyle(fontSize: 18.0),),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 100,
                right: 20,
                left: 20),
          ));
        }

        else{
          Route route = MaterialPageRoute(builder: (context)=>AdminPanel());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }

}
