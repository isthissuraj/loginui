import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;


  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? storingemailvalue;

  Future signIn() async {
    showDialog(
        context: this.context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());



    Navigator.of(context).pop();

 
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0e17ff),
        body: Container(
            height:MediaQuery.of(context).size.height,
           
            child: SafeArea(
              child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.adb_rounded, size: 100, color: Colors.white),
                    Text("HELLO",
              style: GoogleFonts.bebasNeue(
                fontSize: 50, color: Colors.white
              )),

             
                        SizedBox(height: 50,),

                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: TextField(

                              controller: _emailController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(12)),
                                  hintText: "Email",
                                  fillColor: Colors.grey.shade200,
                                  filled: true),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(12)),
                                hintText: "Password",
                                fillColor: Colors.grey.shade200,
                                filled: true,
                              ),
                              obscureText: true,
                            )),

                        SizedBox(height: 10,),

                     

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: GestureDetector(
                            onTap: () {
                              // if (storingemailvalue != null)
                              signIn();
                              // if(storingemailvalue==null)
                              //   {
                              //     return Container()
                              //
                              //   }
                            },
                            child: Container(
                              height: 50,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0xffee0366),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),

                        //not a member register now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Not Registered ? ",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: widget.showRegisterPage,
                              child: Text(
                                " Register Now",
                                style: TextStyle(
                                    color: Colors.blue.shade200, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        // loginUI(),
                        // loginControllers(context)
                      ],
                    ),
                  )
              ),
            )
        )
    );
  }

  
  //     );
  //
  //   }
  //   if (model.userDetails==null)
  //   {
  //     return loginControllers(context);
  //   }
  //   else
  //     return Text("please login");
  //   });
  // }
  //
  // loginControllers(BuildContext context) {
  //   return Center(
  //     child: GestureDetector(
  //         child: Image.asset(
  //           "assets/images/google.png",
  //           width: 240,
  //           height: 50,
  //         ),
  //         onTap: () {
  //           Provider.of<LoginController>(context, listen: false).googleLogin();
  //         }),
  //   );
  // }
  //
  // loggedIn(LoginController model) {
  //   setState((){UserEmail = model.googleSignInAccount?.email;});
  //   Navigator.push(context,MaterialPageRoute(builder: (context)
  //   =>tourism()));
  //
  // }
}


























// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//
//   // here are the controllers for the texts
//
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   Future signIn() async{
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: _emailController.text.trim(),
//       password: _passwordController.text.trim(),);
//   }
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff0e17ff),
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.adb_rounded, size: 100, color: Colors.white),
//
//               // on the top there will be a big Hello again!
//               Text("HOLÄ",
//               style: GoogleFonts.bebasNeue(
//                 fontSize: 50, color: Colors.white
//               )),
//
//               Text("WELCOME BACK",
//               style: GoogleFonts.spaceGrotesk(fontSize: 30, color: Colors.white)
//               ),
//
//               SizedBox(height: 50,),
//
//               //then the email text field
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade200,
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(12)
//
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left:20.0),
//                     child: TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Email',
//
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 10),
//               // then password text field
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0,),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(12)
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.only(left:20.0),
//                     child: TextField(
//                       controller: _passwordController,
//                       obscureText: true,      // obscureText will hide the password
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Password',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10,),
//
//               // then sign in button
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: GestureDetector(
//                   onTap: signIn,
//                   child: Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(color:Color(0xffee0366),
//                     borderRadius: BorderRadius.circular(12)),
//
//                    child: Center(child: Text('Sign In', style: TextStyle(
//                      color: Colors.white,
//                      fontWeight: FontWeight.bold,
//                      fontSize: 18
//                    ),
//                    )
//                    ),
//                     ),
//                 ),
//               ),
//               SizedBox(height: 10,),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Not a member? ",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     GestureDetector(
//                       onTap: widget.showRegisterPage,
//                       child: Text(
//                         "Register Now",
//                         style: TextStyle(
//                             color: Colors.blue, fontWeight: FontWeight.bold),
//                       ),
//                     )
//                   ],
//                 ),
//
//             ],
//
//             ),
//           ),
//         ),
//       ),
//
//     );
//   }
// }
