import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SavedListScreen extends ConsumerStatefulWidget {
  const SavedListScreen({super.key});

  @override
  ConsumerState createState() => _SavedListScreenState();
}

class _SavedListScreenState extends ConsumerState<SavedListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SavedListScreen'),
      ),
      body: Container(),
    );
  }
}
