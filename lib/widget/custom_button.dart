import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color ? disabledColor;
  final Color ? borderColor;
  final Color textColor;
  final String text;
  final Widget ? leading;
  final VoidCallback onPressed;
  const CustomButton({
    Key ? key, this.backgroundColor =Colors.black , this.text = "null", this.leading,required this.onPressed, this.textColor=Colors.white, this.borderColor, this.disabledColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: onPressed == null ? disabledColor ?? Theme.of(context).primaryColor.withOpacity(.6)  : backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: onPressed == null ? disabledColor ?? Theme.of(context).primaryColor.withOpacity(.1) : borderColor ?? Theme.of(context).primaryColor, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(12),),
        ),
      ),
      onPressed:onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leading ?? Container(),
            leading == null ? Container() : const SizedBox(width: 20,),
            Text(
              text,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}