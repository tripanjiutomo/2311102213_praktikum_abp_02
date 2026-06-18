import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Widgets',
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false, 
      home: const WidgetLatihanScreen(),
    );
  }
}

class WidgetLatihanScreen extends StatelessWidget {
  const WidgetLatihanScreen({super.key});

  final List<String> builderData = const ['Data Array 1', 'Data Array 2', 'Data Array 3'];
  final List<String> separatedData = const ['Item 1', 'Item2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Baris title telah dihapus agar teks di bagian atas hilang
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Container
            const Text('1. Container', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blueAccent,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 24),

            // 2. GridView 
            const Text('2. GridView ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 3, 
              shrinkWrap: true, 
              physics: const NeverScrollableScrollPhysics(), 
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(6, (index) => Container(
                color: Colors.teal[300],
                alignment: Alignment.center,
                child: Text('Grid ${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              )),
            ),
            const SizedBox(height: 24),

            // 3. ListView
            const Text('3. ListView', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(color: Colors.grey[200], child: const ListTile(title: Text('Item A'))),
                Container(color: Colors.grey[300], child: const ListTile(title: Text('Item B'))),
                Container(color: Colors.grey[200], child: const ListTile(title: Text('Item C'))),
              ],
            ),
            const SizedBox(height: 24),

            // 4. ListView.builder 
            const Text('4. ListView.builder', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: builderData.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.orange[100],
                  child: ListTile(title: Text(builderData[index])),
                );
              },
            ),
            const SizedBox(height: 24),

            // 5. ListView.separated
            const Text('5. ListView.separated', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: separatedData.length,
              separatorBuilder: (context, index) => const Divider(color: Colors.red, thickness: 2), 
              itemBuilder: (context, index) {
                return ListTile(title: Text(separatedData[index]));
              },
            ),
            const SizedBox(height: 24),

            // 6. Stack
            const Text('6. Stack', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(height: 150, width: double.infinity, color: Colors.purple[200]),
                Container(height: 100, width: 200, color: Colors.purple[400]),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}