import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widget/base_state.dart';

class TapToRetryWidget extends StatefulWidget {
  final VoidCallback onTap;
  final String message;
  const TapToRetryWidget({Key? key, required this.onTap, required this.message})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends BaseState<TapToRetryWidget> {
  @override
  Widget create(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: widget.onTap,
              child: SvgPicture.asset(
                "assets/images/git.svg",
                color: theme.theme.colorScheme.error,
                width: 64,
                height: 64,
              ),
            ),
            TextButton.icon(
                onPressed: widget.onTap,
                icon: Icon(
                  Icons.close_rounded,
                  color: theme.theme.colorScheme.error,
                ),
                label: Text(widget.message,
                    style: TextStyle(
                        color: theme.theme.colorScheme.error,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
