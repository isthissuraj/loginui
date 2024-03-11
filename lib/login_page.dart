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
                        
                      ],
                    ),
                  )
              ),
            )
        )
    );
  }
}



































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
