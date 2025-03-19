import 'package:flutter/material.dart';
class output extends StatefulWidget {
  const output({super.key});

  @override
  State<output> createState() => _outputState();
}
final name =TextEditingController();
String txt='';
class _outputState extends State<output> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: name,
          ),
          Container(
            height: 40,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  txt = name.text;
                });
              },
              child: Text('Submit'),
            ),
          ),
          Text(txt),
        ],
      ),
    );
  }
}
