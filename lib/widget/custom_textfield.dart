// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_pad/ui/size_config/sizeConfig.dart';



class CustomTextField extends StatefulWidget {
  final bool ? hasLeading;
  final bool ? isDate;
  final bool ? isPassword;
  final bool ? readOnly;
  final bool ? changePhoneNumber;
  final int ? maxLines;
  final Function ? validator;
  final Widget ? prefix;
  final String ? hintText;
  final String ? labelText;
  final String ? trailling;
  final bool ? hasBorder;
  final bool ? obscureText;
  final IconData ? suffixData;
  final Function ? onTap;
  final String ? imgUri;
  final Color ? fillColor;
  final TextEditingController ? controller;
  final TextInputAction ? textInputAction;
  final TextInputType ? textInputType;
  final AutovalidateMode ? autovalidateMode;

  ///labelText cannot be used when hintText is used
  const CustomTextField({
    Key ? key,
    this.hasLeading = false,
    this.isDate = false,
    this.isPassword = false,
    this.readOnly = false,
    this.changePhoneNumber = false,
    this.maxLines = 1,
    this.validator,
    this.prefix,
    this.hintText,
    this.labelText,
    this.trailling = '',
    this.hasBorder,
    this.obscureText = false,
    this.suffixData,
    this.onTap,
    this.imgUri,
    this.fillColor = const Color(0xffC9CAD9),
    this.controller,
    this.textInputAction = TextInputAction.done,
    this.textInputType,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hide = true;
  @override
  void initState() {
    super.initState();
    hide = widget.obscureText!;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child:  TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    isDense: false,
                    //fillColor: Colors.red,
                    suffixIcon: widget.obscureText! ?  IconButton(
                      onPressed: () {
                        setState(() {
                          hide = !hide;
                        });
                      },
                      icon: !hide
                          ?  Icon(
                              Icons.visibility_outlined,
                              color: Theme.of(context).iconTheme.color,
                            )
                          :  Icon(
                              Icons.visibility_off_outlined,
                              color: Theme.of(context).iconTheme.color,
                            ),
                    ) : SizedBox(),
                    labelText: widget.labelText,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    labelStyle: TextStyle(color:Theme.of(context).iconTheme.color),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.5)),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              );
  }
}
