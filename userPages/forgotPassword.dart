import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilink/pages/signup.dart';
import 'package:ilink/widget/widget_support.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailcontroller = new TextEditingController();

  String email = "";

  final _formkey = GlobalKey<FormState>();

  resetPassword()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Reset Email has been sent!",
        style: TextStyle(fontSize: 18.0),)));
    } on FirebaseException catch(e){
      if(e.code == "user-not-found"){
        ScaffoldMessenger.of(context).showSnackBar((SnackBar(content: Text("No user found for that email",
          style: TextStyle(fontSize: 18.0),))));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(children: [
          SizedBox(height: 150.0,),
          Container(
            alignment: Alignment.topCenter,
            child: Text("Password Recovery",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold
            ),),),
            SizedBox(height: 10.0,),
            Text("Enter your email", style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold,
            ),),
          Expanded(child:
            Form(
              key: _formkey,
              child:
             Padding(padding: EdgeInsets.only(left: 10.0),
               child: ListView(
                 children: [
                   Container(
                     padding: EdgeInsets.only(left: 10.0),
                     child: TextFormField(
                       controller: emailcontroller,
                       validator: (value){
                         if(value == null || value.isEmpty){
                           return "Please Enter Recovery Email";
                         }
                         return null;
                       },

                       style: TextStyle(color: Colors.white,),
                       decoration:
                       InputDecoration(
                           enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.white)
                           ),
                           focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.green)
                           ),
                           hintText: "Recovery Email",

                           prefixIcon: Icon(Icons.email, color: Colors.white,)),
                     ),
                       ),

                   SizedBox(height: 40.0,),
                 GestureDetector(
                   onTap: (){
                     if(_formkey.currentState!.validate()){
                       setState(() {
                         email = emailcontroller.text;
                       });
                       resetPassword();
                     }
                   },
                   child: Container(
                     width: 140,
                                   padding: EdgeInsets.all(10.0),
                                   decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                                   ),
                     child: Center(
                       child: Text("Send Email", style: TextStyle(
                         color: Colors.black,
                         fontSize: 18.0,
                         fontWeight: FontWeight.bold
                       ),
                       ),
                     ),
                               ),
                 ),
                   SizedBox(height: 50.0,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("Don't have an account?", style: TextStyle(fontSize: 18.0, color: Colors.white),),
                      SizedBox(width: 5.0,),
                       GestureDetector(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                         },
                         child: Text("Create Now", style: TextStyle(
                           color: Colors. yellow.shade700,
                           fontSize: 20.0, fontWeight: FontWeight.w500,
                         ),),
                       )
                     ],
                   ),
                 ],
               ),
          ),
          ),

          )
          
        ],)
      )
    );
  }
}
