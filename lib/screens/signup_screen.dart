
import 'dart:io';
import 'package:dokan_clone/screens/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';


class SignUpScreen extends StatefulWidget {
  static String route = 'SignUpScreen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool _passwordVisible=false;
  late bool _confirm_passwordVisible=false;
  File? imageFile;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    TextEditingController user_name_controller= TextEditingController();
    TextEditingController user_mail_controller= TextEditingController();
    TextEditingController user_password_controller= TextEditingController();
    TextEditingController user_confirm_password_controller= TextEditingController();
    print(imageFile);
    ImagePicker picker = ImagePicker();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Setting Screen'),
      // ),

      body: SafeArea(

        child: Container(
          color: Color(0xffF8F8F8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              imageFile==null?
              InkWell(
                onTap: () {
                  print("clicked");
                  SnackBar snackBar = SnackBar(
                    content: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                _getFromCamera();
                              }, child: Text("From Camera")),
                          ElevatedButton(onPressed: (){
                            _getFromGallery();
                          }, child: Text("From gallery")),
                        ],
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  alignment: Alignment.center,
                  height:80,
                  width:80,
                  decoration: BoxDecoration(

                    image: const DecorationImage(
                        image:  AssetImage("assets/images/profile_image_picker.png"),
                        fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),

                  padding: EdgeInsets.only(left:20,right:20),
                ),
              ):
              Container(
                      alignment: Alignment.center,
                      height:80,
                      width:80,
                      decoration: BoxDecoration(

                        image:  DecorationImage(
                            // image:  AssetImage("assets/images/profile_image_picker.png"),
                           image: FileImage(imageFile!),
                            fit: BoxFit.cover
                        ),
                        
                        borderRadius: BorderRadius.circular(40),
                      ),

                      padding: EdgeInsets.only(left:20,right:20),
                    ),

              Padding(
                padding: const EdgeInsets.only(left:16.0,right:16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: user_name_controller,
                        decoration: InputDecoration(
                          hintText: "Name",
                          prefixIcon: Icon(Icons.person),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height:20),
                    Container(
                      padding: EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                          controller: user_mail_controller,
                          decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.mail),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height:20),
                    Container(
                        padding: EdgeInsets.only(left:10,right:10),
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: user_password_controller,
                        obscureText: !_passwordVisible,//This will obscure text dynamically

                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                               color: Colors.grey,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height:20),
                    Container(
                      padding: EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: user_confirm_password_controller,
                        obscureText: !_confirm_passwordVisible,//This will obscure text dynamically

                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _confirm_passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _confirm_passwordVisible = !_confirm_passwordVisible;
                              });
                            },
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Container(
                  padding: const EdgeInsets.only(left:16.0,right:16.0,top:30),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepOrangeAccent,
                      ),
                      height:50,

                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text('Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)

                  ),
                ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            image: DecorationImage(
                              image: AssetImage("assets/images/fb_logo.png"),
                            )
                        ),
                        height:50,
                        width: 50,

                      ),

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            image: DecorationImage(
                              image: AssetImage("assets/images/google_logo.png"),
                            )
                        ),
                        height:50,
                        width: 50,

                      )
                    ],
                  ),



                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),SizedBox(width:8),
                        InkWell(child: Text("Sign In",style: TextStyle(color: Colors.blueAccent),),
                          onTap:(){
                              Navigator.pushNamed(context, SignInScreen.route);
                           },)
                      ]
                  )



            ],
          ),
        ),
      ),
    );
  }
}
