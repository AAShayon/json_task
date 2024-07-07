import 'package:flutter/material.dart';
import 'package:json_practice/json_parser.dart';
import 'package:json_practice/model_class.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Android Versions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                List<AndroidVersion> versions = parseJson(jsonString1);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Output 1'),
                    content: Text(versions.map((v) => '${v.title} (ID: ${v.id})').join('\n')),
                  ),
                );
              },
              child: const Text('Show Output 1'),
            ),
            ElevatedButton(
              onPressed: () {
                List<AndroidVersion> versions = parseJson(jsonString2);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(' Output 2'),
                    content: Text(versions.map((v) => '${v.title} (ID: ${v.id})').join('\n')),
                  ),
                );
              },
              child: Text('Show Output 2'),
            ),
          ],
        ),
      ),
    );
  }
}
