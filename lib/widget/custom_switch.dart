import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final String  title;
  final bool  tap;
  const CustomSwitch({Key ? key,required  this.title,required this.tap})
      : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = widget.tap;
    return Row(
      children: [
        Text(
          '${widget.title}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
          activeTrackColor: Colors.blue.shade200,
          activeColor: Colors.blue,
        )
      ],
    );
  }
}