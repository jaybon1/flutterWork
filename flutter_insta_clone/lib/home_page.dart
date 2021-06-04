import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User? user;

  const HomePage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('인스타그램 클론'),
        titleTextStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text(
                  '인스타그램에 오신 것을 환영합니다.',
                  style: TextStyle(fontSize: 24.0),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Text(
                  '사진과 동영상을 보려면 팔로우하세요.',
                ),
                Padding(padding: EdgeInsets.all(16.0)),
                SizedBox(
                  width: 260.0,
                  child: Card(
                    elevation: 10.0,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(5.0)),
                        SizedBox(
                          width: 80.0,
                          height: 80.0,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                user?.photoURL != null ? user!.photoURL! : 'https://mblogthumb-phinf.pstatic.net/20150427_261/ninevincent_1430122791768m7oO1_JPEG/kakao_1.jpg?type=w2'
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Text(
                          user?.email != null ? user!.email! : "이메일 없음",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(user?.displayName != null ? user!.displayName! : "이름 없음",),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network(
                                'https://blog.kakaocdn.net/dn/dR9qks/btqUvCx2DdO/WbtDKyYOfzXQTIh62VYjc0/img.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network(
                                'https://blog.kakaocdn.net/dn/dR9qks/btqUvCx2DdO/WbtDKyYOfzXQTIh62VYjc0/img.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network(
                                'https://blog.kakaocdn.net/dn/dR9qks/btqUvCx2DdO/WbtDKyYOfzXQTIh62VYjc0/img.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(4.0)),
                        Text('페이스북 친구'),
                        Padding(padding: EdgeInsets.all(4.0)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black
                          ),
                            onPressed: () {},
                            child: Text('팔로우')
                        ),
                        Padding(padding: EdgeInsets.all(4.0)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
