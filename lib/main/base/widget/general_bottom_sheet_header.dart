import 'package:flutter/material.dart';

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
                    borderRadius: BorderRadius.circular(5), color: Colors.grey),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Flex(direction: Axis.horizontal, children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  icon: const Icon(Icons.close),
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
