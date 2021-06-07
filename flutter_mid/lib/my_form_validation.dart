
import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  const MyFormValidation({Key? key}) : super(key: key);

  @override
  _MyFormValidationState createState() => _MyFormValidationState();
}

class _MyFormValidationState extends State<MyFormValidation> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode nameFocusNode;
  final nameEditController = TextEditingController();

  @override
  void initState() {
    nameFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    nameEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("aa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '공백은 허용되지 않습니다.';
                    }
                  },
                  cursorColor: Colors.black,
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("ㅁㅁㅁㅁ")));
                      }
                    },
                    child: Text('완료')),
                TextField(
                  controller: nameEditController,
                  onChanged: (value) {
                    print(value);
                  },
                  focusNode: nameFocusNode,
                  decoration: InputDecoration(hintText: "이름을 입력해주세요", border: InputBorder.none, labelText: '이름'),
                  autofocus: true,
                ),
                ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(nameFocusNode);
                    },
                    child: Text('포커스')),
                ElevatedButton(
                    onPressed: () {
                      print(nameEditController.text);
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          content: Text(nameEditController.text),
                        );
                      },);
                    },
                    child: Text('TextField 값 확인')),
              ],
            )),
      ),
    );
  }
}
