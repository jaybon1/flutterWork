import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/create_page.dart';
import 'package:flutter_insta_clone/detail_post_page.dart';

class SearchPage extends StatefulWidget {

  final User? user;

  const SearchPage({Key? key, this.user}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => CreatePage(user: widget.user,)))
        ,
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildBody() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('post').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        } else {
          var items = snapshot.data!.docs;

          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _buildListItem(context, items[index]);
              });
        }
      });
  }

  Widget _buildListItem(BuildContext context, document) {
    return Hero(
      tag: document['photoURL'],
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPostPage(document: document,);
            },));
          },
          child: Image.network(
            document['photoURL'],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
