import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:ilink/service/database.dart';
import 'package:ilink/widget/widget_support.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  File? selectedImage;
  final List<String> items = ["**Select your Sales Category**", "Furniture", "Phone", "Laptop", "Clothing"];
  String? value;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  final picker = ImagePicker();

  Future getImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  void uploadItem() async {
    if (selectedImage == null || namecontroller.text.isEmpty || pricecontroller.text.isEmpty || descriptioncontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please fill all fields and select an image."),
      ));
      return;
    }

    String addId = randomAlphaNumeric(10);
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImages").child(addId);
    UploadTask uploadTask = firebaseStorageRef.putFile(selectedImage!);

    try {
      TaskSnapshot taskSnapshot = await uploadTask;
      var downloadUrl = await taskSnapshot.ref.getDownloadURL();

      Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "Name": namecontroller.text,
        "Price": pricecontroller.text,
        "Description": descriptioncontroller.text
      };

      await DatabaseMethods().addSalesItem(addItem, value!).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Your post has been sent successfully. Just wait for approval."),
          backgroundColor: Colors.greenAccent,
        ));
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to upload item. Please try again later."),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.0),
              Text("Post your sale!", style: AppWidget.HeadlineTextFeildStyle()),
              SizedBox(height: 20.0),
              Text("Upload the Sales Picture", style: AppWidget.semiBoldTextFeildStyle()),
              SizedBox(height: 10.0),
              selectedImage == null
                  ? GestureDetector(
                onTap: getImage,
                child: Center(
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.camera_alt_outlined, color: Colors.black),
                    ),
                  ),
                ),
              )
                  : Center(
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(selectedImage!, fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text("Sales Name", style: AppWidget.semiBoldTextFeildStyle()),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  maxLength: 30,
                  controller: namecontroller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    hintText: "Enter Sales Name",
                    hintStyle: AppWidget.LightTextFeildStyle(),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text("Sales Category", style: AppWidget.semiBoldTextFeildStyle()),
              SizedBox(height: 5.0),
              Container(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: items.map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, style: AppWidget.LightTextFeildStyle()),
                    )).toList(),
                    onChanged: (value) => setState(() {
                      this.value = value;
                    }),
                    dropdownColor: Colors.white,
                    hint: Text("Select Your Sales Category", style: AppWidget.LightTextFeildStyle()),
                    iconSize: 37,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black87),
                    value: value,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text("Sales Price", style: AppWidget.semiBoldTextFeildStyle()),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  maxLength: 12,
                  controller: pricecontroller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    hintText: "Enter Sales Price",
                    hintStyle: AppWidget.LightTextFeildStyle(),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text("Sales Description", style: AppWidget.semiBoldTextFeildStyle()),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  maxLines: 7,
                  maxLength: 700,
                  controller: descriptioncontroller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    hintText: "Enter Sales Description",
                    hintStyle: AppWidget.LightTextFeildStyle(),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              GestureDetector(
                onTap: uploadItem,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
                    width: 120.0,
                    height: 40.0,
                    child: Center(
                      child: Text(
                        "POST",
                        style: TextStyle(color: Colors.white, fontFamily: 'Poppins1', fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        padding: EdgeInsets.only(bottom: 30),
      ),
    );
  }
}
