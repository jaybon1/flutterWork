import 'package:flutter/material.dart';

class DetailPostPage extends StatelessWidget {
  final dynamic document;

  const DetailPostPage({Key? key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(document['userPhotoURL']),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        document['email'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        document['displayName'],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Hero(tag: document['photoURL'],
              child: Image.network(document['photoURL'])),
          Padding(padding: EdgeInsets.all(8.0)),
          Text(document['contents']),
        ],
      ),
    ));
  }
}
