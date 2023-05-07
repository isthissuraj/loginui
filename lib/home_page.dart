import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginui/add_from_camera.dart';
import 'package:loginui/add_image.dart';
import 'package:loginui/uploaded.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
        backgroundColor: Color(0xff0213f0),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Text(
              'signed in as: ' + user.email!,
              style: (TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
          Column(
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddImage()));
                  },
                  icon: Icon(Icons.add_photo_alternate_rounded),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0213f0)),
                  label: Text('add a photo')),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddCamera()));
                  },
                  icon: Icon(
                    Icons.add_a_photo,
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0213f0)),
                  label: Text('add from camera')),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UploadedImages()));
                  },
                  icon: Icon(Icons.arrow_forward),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0213f0)),
                  label: Text('uploaded images'))
            ],
          ),

       
        ],
      )),
    );
  }
}
