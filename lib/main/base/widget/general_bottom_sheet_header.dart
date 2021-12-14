import 'package:flutter/material.dart';

class GeneralBottomSheetHeader extends StatefulWidget {
  final Text title;
  final Widget body;

  const GeneralBottomSheetHeader(
      {Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _GeneralBottomSheetHeaderState();
}

class _GeneralBottomSheetHeaderState extends State<GeneralBottomSheetHeader> {
  final _barHeight = 5.0;

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
                height: _barHeight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.grey),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Flex(direction: Axis.horizontal, children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: widget.title,
              ))
            ]),
          ),
          ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: constraints.constrainHeight() - 200),
            child: SingleChildScrollView(
              child: widget.body,
            ),
          )
        ],
      );
    });
  }
}
