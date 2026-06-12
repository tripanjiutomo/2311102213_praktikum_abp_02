import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () {
              taskProvider.deleteAllTasks();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Semua tugas dihapus')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Tugas baru...'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      taskProvider.addTask(_controller.text);
                      _controller.clear();
                    }
                  },
                  child: const Text('Tambah'),
                ),
              ],
            ),
          ),
          Expanded(
            child: taskProvider.tasks.isEmpty
                ? const Center(child: Text('Belum ada tugas'))
                : ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (ctx, index) {
                return ListTile(title: Text(taskProvider.tasks[index].title));
              },
            ),
          ),
        ],
      ),
    );
  }
}