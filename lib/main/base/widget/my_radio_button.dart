import 'package:flutter/material.dart';

class MyRadioButton<T> extends StatelessWidget {
  final T? value;
  final T? groupValue;

  bool get _selected {
    return value == groupValue;
  }

  const MyRadioButton({Key? key, required this.value, required this.groupValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (!_selected) {
        return const Icon(Icons.check, color: Colors.grey);
      } else {
        return Icon(Icons.check, color: Theme.of(context).colorScheme.primary);
      }
    });
  }
}
