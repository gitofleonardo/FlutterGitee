import 'package:flutter/material.dart';

ShapeBorder bottomSheetShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10), topRight: Radius.circular(10)));

class HeaderContentBottomSheet extends StatelessWidget {
  final String title;
  final Widget body;
  final bool contentScrollable;

  const HeaderContentBottomSheet(
      {Key? key,
      required this.title,
      required this.body,
      this.contentScrollable = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                width: 64,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.primary),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Flex(direction: Axis.horizontal, children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
              ))
            ]),
          ),
          ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: constraints.constrainHeight() - 200),
            child: Builder(
              builder: (context) {
                if (contentScrollable) {
                  return SingleChildScrollView(
                    child: body,
                  );
                } else {
                  return body;
                }
              },
            ),
          )
        ],
      );
    });
  }
}
