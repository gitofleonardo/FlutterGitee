import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const LoginButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).colorScheme.secondary,
                offset: const Offset(2, 2),
                blurRadius: 5)
          ]),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(text,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        ),
      ),
    );
  }
}
