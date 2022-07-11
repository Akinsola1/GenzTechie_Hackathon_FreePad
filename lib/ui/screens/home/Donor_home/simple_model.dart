// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class breakDown {
  final String amount;
  final String title;

  breakDown(this.amount, this.title);
}

class dashboardOption {
  final String animation;
  final String title;
  final VoidCallback onPressed;


  dashboardOption(
    this.animation,
    this.title,
    this.onPressed,
  );

  
}
