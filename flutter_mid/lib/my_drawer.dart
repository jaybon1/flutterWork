import 'package:flutter/material.dart';
import 'package:flutter_mid/my_animated_container.dart';
import 'package:flutter_mid/my_animated_opacity.dart';
import 'package:flutter_mid/my_form_validation.dart';
import 'package:flutter_mid/my_method_channel.dart';
import 'package:flutter_mid/my_orientation.dart';
import 'package:flutter_mid/my_snack_bar.dart';
import 'package:flutter_mid/my_swipe_to_dismiss_state.dart';
import 'package:flutter_mid/my_tab_controller.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('header'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('MyAnimatedContainer'),
              onTap: () {
                // 할일
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyAnimatedContainer();
                },));
              },
            ),
            ListTile(
              title: Text('MyAnimatedOpacity'),
              onTap: () {
                // 할일
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyAnimatedOpacity();
                },));
              },
            ),
            ListTile(
              title: Text('MyOrientation'),
              onTap: () {
                // 할일
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyOrientation();
                },));
              },
            ),
            ListTile(
              title: Text('MySnackBar'),
              onTap: () {
                // 할일
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MySnackBar();
                },));
              },
            ),
            ListTile(
              title: Text('MyTabController'),
              onTap: () {
                // 할일
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyTabController();
                },));
              },
            ),
            ListTile(
              title: Text('MyFormValidation'),
              onTap: () {
                // 할일
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyFormValidation();
                },));
              },
            ),
            ListTile(
              title: Text('MySwipeToDismissState'),
              onTap: () {
                // 할일
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MySwipeToDismissState();
                },));
              },
            ),
            ListTile(
              title: Text('MyMethodChannel'),
              onTap: () {
                // 할일
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyMethodChannel();
                },));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('drawer'),
      ),
      body: Center(
        child: Text('Drawer 예제'),
      ),
    );
  }
}
