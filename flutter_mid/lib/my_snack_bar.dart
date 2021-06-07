import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  _MySnackBarState createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tt'),
      ),
      body: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("메일이 삭제되었습니다."),
            action: SnackBarAction(
              label: '취소',
              onPressed: () {
                //눌렀을 때 처리
              },
            ),
          ));
        },
        child: Text('스낵바 띄우기'),
      ),
    );
  }
}
