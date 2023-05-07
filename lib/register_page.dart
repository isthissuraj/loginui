import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
var _emailController=TextEditingController();

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({Key? key,required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? variablename;

  //text controller

  //final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  final _confirmpasswordController=TextEditingController();
  final _firstnameController=TextEditingController();
  final _lastnameController=TextEditingController();
  final _ageController=TextEditingController();


 



Future signup() async
{
  if(passwordConfirmed())
    {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(),
          password: _passwordController.text.trim());


      addUserDetails(
        _firstnameController.text.trim(),
        _lastnameController.text.trim(),
        _emailController.text.trim(),
      int.parse(_ageController.text.trim()),
      );
    }

}


 Future addUserDetails(String firstname,String lastname,String email,int
 age) async
 {
   await FirebaseFirestore.instance.collection('users').add({
     'fist name':firstname,
     'last name':lastname,
     'email':email,
     'age':age
   });

 }


 bool passwordConfirmed()
 {
   if(_passwordController.text.trim()==_confirmpasswordController.text.trim())
     {
       return true;
     }
     else
       return false;

 }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0e17ff),


      body: SafeArea(

        child: Container(
          height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(image: DecorationImage(image: AssetImage
        //     ("assets/images/loginimage.png"),fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //hellom again
SizedBox(height: 30,),
                Text("Welcome ",style: GoogleFonts.bebasNeue(fontSize:
                30, fontWeight: FontWeight.w500, color: Colors.white),),
                SizedBox(height: 4,),
                Text("Register below with your details",style: GoogleFonts.bebasNeue(fontSize:
                15 , color: Colors.white),),
                SizedBox(height: 25,),



                //first nAME txt filed

                Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: _firstnameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),

                    focusedBorder: OutlineInputBorder(borderSide: BorderSide
                      (color: Colors.blue),borderRadius: BorderRadius.circular(12)),
                    hintText: "First name",
                    filled: true,
                    fillColor: Colors.grey.shade200
                  ),
                  onSubmitted: (value){
                    setState(()
                    {
                      variablename=value;

                    }
                    );
                  }
                ,),
                ),
                SizedBox(height: 10,),



//lastname

                Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _lastnameController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),

                        focusedBorder: OutlineInputBorder(borderSide: BorderSide
                          (color: Colors.blue),borderRadius: BorderRadius.circular(12)),
                        hintText: "Last name",
                        filled: true,
                        fillColor: Colors.grey.shade200
                    ),
                  ),
                ),
                SizedBox(height: 10,)





                //age text field




                ,Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _ageController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),

                        focusedBorder: OutlineInputBorder(borderSide: BorderSide
                          (color: Colors.blue),borderRadius: BorderRadius.circular(12)),
                        hintText: "Age",
                        filled: true,
                        fillColor: Colors.grey.shade200
                    ),
                  ),
                ),
                SizedBox(height: 10,),




                //email text field


                Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),

                        focusedBorder: OutlineInputBorder(borderSide: BorderSide
                          (color: Colors.blue),borderRadius: BorderRadius.circular(12)),
                        hintText: "Email",
                        filled: true,
                        fillColor: Colors.grey.shade200
                    ),
                  ),
                ),
                SizedBox(height: 10,)




                //password text field




               , Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),

                        focusedBorder: OutlineInputBorder(borderSide: BorderSide
                          (color: Colors.blue),borderRadius: BorderRadius.circular(12)),
                        hintText: "Password",
                        filled: true,
                        fillColor: Colors.grey.shade200
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 10,)






                //conform password




               , Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _confirmpasswordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),

                        focusedBorder: OutlineInputBorder(borderSide: BorderSide
                          (color: Colors.blue),borderRadius: BorderRadius.circular(12)),
                        hintText: "Confirm Password",
                        filled: true,
                        fillColor: Colors.grey.shade200
                    ),
                  ),
                ),
                SizedBox(height: 10,)



                //signin button

                ,Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: signup,
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.all(5),

                    decoration: BoxDecoration(
                        color: Color(0xffee0366),borderRadius:
                    BorderRadius.circular(12),

                    ),
                    child: Center(
                      child: Text("Register",style: TextStyle(
                        color: Colors.white,fontSize:18,fontWeight: FontWeight
                          .bold
                      ),),

                    ),

                  ),

                )

                ),


                SizedBox(height: 25,),



                //not a member fregister now


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("I am a member! ",style: TextStyle
                      (fontWeight:FontWeight.bold, color: Colors.white)),

                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text("Login Now",style: TextStyle(color: Colors
                              .blue.shade200,fontWeight: FontWeight.bold),),
                    )
                  ],

                )





              ],
            ),
          ),
        ),
      )
    );
  }


}
