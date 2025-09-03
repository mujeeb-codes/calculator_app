import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<String> history;

  const HistoryScreen({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        backgroundColor: Colors.blueGrey.withOpacity(.9),
        centerTitle: true,
      ),
      body: history.isEmpty
          ? const Center(
              child: Text(
                "No history yet",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    history[index],
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              },
            ),
      backgroundColor: Colors.black.withOpacity(.9),
    );
  }
}
