import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final User? user;

  const CreatePage({Key? key, this.user}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  File? _image;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _getImage(),
          child: Icon(
            Icons.add_a_photo,
          )),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () => _handleTaskExample(), icon: Icon(Icons.send))
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _image != null ? Image.file(_image!) : Text('No Image'),
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요.'),
            controller: textEditingController,
          )
        ],
      ),
    );
  }

  Future<void> _getImage() async {
    var pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected');
      }
    });
  }

  Future<void> _handleTaskExample() async {
    if (_image != null) {
      final task = FirebaseStorage.instance
          .ref()
          .child('post')
          .child('${DateTime.now().millisecondsSinceEpoch}.png')
          .putFile(_image!, SettableMetadata(contentType: 'image/png'));

      try {
        TaskSnapshot taskSnapshot = await task;
        var downloadURL = await taskSnapshot.ref.getDownloadURL();
        var doc = FirebaseFirestore.instance.collection('post').doc();
        doc.set({
          'id': doc.id,
          'photoURL': downloadURL,
          'contents': textEditingController.text,
          'email': widget.user?.email != null ? widget.user!.email : '이메일 없음',
          'displayName': widget.user?.displayName != null
              ? widget.user!.displayName
              : '이름 없음',
          'userPhotoURL': widget.user?.photoURL != null
              ? widget.user!.photoURL
              : 'https://mblogthumb-phinf.pstatic.net/20150427_261/ninevincent_1430122791768m7oO1_JPEG/kakao_1.jpg?type=w2'
        }).then((value){
          Navigator.pop(context);
        });
      } on FirebaseException catch (e) {
        print(task.snapshot);

        if (e.code == 'permission-denied') {
          print('User does not have permission to upload to this reference.');
        }
      }
    }
  }
}
