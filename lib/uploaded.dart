// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transparent_image/transparent_image.dart';

import 'add_image.dart';

class UploadedImages extends StatefulWidget {
  const UploadedImages({Key? key}) : super(key: key);

  @override
  State<UploadedImages> createState() => _UploadedImagesState();
}

class _UploadedImagesState extends State<UploadedImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Uploaded Images'),
      backgroundColor: Color(0xff0213f0),
      ),

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => AddImage()));
      //   },
      // ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('imageURLs').snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Container(
            padding: EdgeInsets.all(4),
            child: GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(3),
                    child: FadeInImage.memoryNetwork(
                        fit: BoxFit.cover,
                        placeholder: kTransparentImage,
                        image: snapshot.data!.docs[index].get('url')),
                  );
                }),
          );
        },
      ),
    );
  }
}





//
// class FetchImages{
//
//   static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
//       Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());
//   static Future<List<FirebaseFile>> listAll(String path) async{
//     final ref = FirebaseStorage.instance.ref(path);
//     final result = await ref.listAll();
//
//     final urls = await _getDownloadLinks(result.items);
//
//     return urls.asMap().map((index, url){
//       final ref = result.items[index];
//       final name = ref.name;
//       final file = FirebaseFile(ref: ref, name: name, url: url);
//
//       return MapEntry(index, file);
//     }).values.toList();
//   }
// }
//
// class FirebaseFile {
//   final Reference ref;
//   final String name;
//   final String url;
//
//   const FirebaseFile({
//     required this.ref,
//     required this.name,
//     required this.url,
//   });
// }
//
// class ImagePage extends StatelessWidget {
//   final FirebaseFile file;
//
//   const ImagePage({Key? key, required this.file}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Image.network(
//         file.url,
//         height: double.infinity,
//         width: double.infinity,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }