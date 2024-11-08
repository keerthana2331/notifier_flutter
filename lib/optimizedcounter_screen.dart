import 'package:change_notifier/change_notifier.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class OptimizedCounterScreen extends StatelessWidget {
  const OptimizedCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Optimized Counter App')),
      body: Center(
        child: Selector<CounterModel, int>(
          selector: (context, counterModel) => counterModel.counter,
          builder: (context, counterValue, child) {
            return Text(
              'Counter Value (Optimized): $counterValue',
              style: const TextStyle(fontSize: 32),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterModel>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => context.read<CounterModel>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
