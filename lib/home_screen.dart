import 'package:flutter/material.dart';
import 'json_parser.dart';
import 'model_class.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  Future<List<List<AndroidVersion>>> _loadData() async {
    List<AndroidVersion> versions1 = parseJson(jsonString1);
    List<AndroidVersion> versions2 = parseJson(jsonString2);
    return [versions1, versions2];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Android Versions'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<List<AndroidVersion>>>(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          }

          List<AndroidVersion> versions1 = snapshot.data![0];
          List<AndroidVersion> versions2 = snapshot.data![1];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'JSON 1 Versions',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: versions1.length,
                          itemBuilder: (context, index) {
                            final version = versions1[index];
                            return ListTile(
                              title: Text('${version.title} (ID: ${version.id})'),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'JSON 2 Versions',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: versions2.length,
                          itemBuilder: (context, index) {
                            final version = versions2[index];
                            return ListTile(
                              title: Text('${version.title} (ID: ${version.id})'),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
