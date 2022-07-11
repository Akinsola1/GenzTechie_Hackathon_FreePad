import 'package:flutter/material.dart';

class ViewPreviousDOnation extends StatelessWidget {
  const ViewPreviousDOnation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'Not available!',
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w700),
      ),
    ));
  }
}
