import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: const Center(
        child: Text('Add Transaction Page'),
      ),
    );
  }
}
