import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ListFruit extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/banana.jpeg',
      'label': 'Banana',
    },
    {
      'image': 'assets/images/mango.jpeg',
      'label': 'Mango',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'label': 'Orange',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'ListView Example',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradientText(
              'Daftar buah-buahan',
              style: TextStyle(
                fontSize: 40.0,
              ),
              colors: [
                Colors.blue,
                Colors.teal,
                Colors.green,
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          items[index]['image']!,
                          width: 64,
                          height: 64,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        items[index]['label']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
