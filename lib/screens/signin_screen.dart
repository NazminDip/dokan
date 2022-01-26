import 'package:dokan_clone/screens/home_screen.dart';
import 'package:dokan_clone/screens/signup_screen.dart';
import 'package:dokan_clone/screens/test_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'my_bottom_bar.dart';

class SignInScreen extends StatefulWidget {
  static String route = 'SignInScreen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late bool _passwordVisible=false;
  TextEditingController user_name_controller= TextEditingController();
  TextEditingController user_mail_controller= TextEditingController();
  TextEditingController user_password_controller= TextEditingController();
  TextEditingController user_confirm_password_controller= TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Setting Screen'),
      // ),
      body: SafeArea(

        child: Container(
          color: Color(0xffF8F8F8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(

                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),fit: BoxFit.contain
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    height:50,
                    padding: EdgeInsets.only(left:20,right:20),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text("Sign In",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Roboto",
                ),),
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

                               controller: user_mail_controller,
                               decoration: InputDecoration(
                               hintText: "Mail",
                               prefixIcon: Icon(Icons.mail),
                               border: InputBorder.none,
                             ),
                          ),
                        ),

                      SizedBox(height:10),

                       Container(
                          padding: EdgeInsets.only(left:10,right:10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            controller: user_password_controller,

                            keyboardType: TextInputType.text,

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
                                  color: Theme.of(context).primaryColorDark,
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

                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(left:16.0,right:16,top:40),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepOrangeAccent,
                      ),
                    height:50,

                    width: double.infinity,
                        alignment: Alignment.center,
                        child: InkWell(child: Text('Login',style:TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18),),
                          onTap: (){
                          print(user_mail_controller.text);
                          print(user_password_controller.text);

                          SnackBar snackBar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height:200,
                                width: double.infinity,
                                child: Column(
                                  children:[
                                    Text("User Mail: ${user_mail_controller.text.toString()}"),
                                    SizedBox(height:30),
                                    Text("User Pass: ${user_password_controller.text.toString()}"),
                                  ]

                                ),
                              )
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        )

                  ),
                ),


              Expanded(
                flex: 2,
                child: Row(
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
                  SizedBox(width: 10),
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
              ),
              Expanded(
                  flex: 1,
                  child: InkWell(
                      child: Text("Create an account",style:TextStyle(color:Colors.blueGrey)),
                    onTap:(){
                      Navigator.pushNamed(context, SignUpScreen.route);
                    },
                  )
              ),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Text("Go To Home",style:TextStyle(color:Colors.blueGrey)),
                    onTap:(){
                      Navigator.pushNamed(context, MyBottomBar.route,);
                      Navigator.pushNamed(context, TestBottomBar.route,);
                    },
                  )
              ),


            ],
          ),
        ),
      ),
    );
  }
}
