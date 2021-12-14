import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TapToRetryWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String message;
  const TapToRetryWidget({Key? key, required this.onTap, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(
                "assets/images/git.svg",
                color: Colors.red,
                width: 64,
                height: 64,
              ),
            ),
            TextButton.icon(
                onPressed: onTap,
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.red,
                ),
                label: Text(message,
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
