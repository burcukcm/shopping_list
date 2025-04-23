import 'package:flutter/material.dart';

abstract class AppColors {
  static const background = Color(0xFFFDFDFD);
  static const appBarColor = Color.fromARGB(255, 8, 154, 221);
  static const primaryColor = Colors.white; // metin/buton
  static const homePagebuttonColor = Color.fromRGBO(24, 159, 222, 1.0);
  static const cardColor = Color(0xFFE1F5FE);
  static const deleteColor = Color(0xFFFF8A65);
  static const transparent = Colors.transparent;
  static const notitemscolor = Colors.grey;
}

abstract class AppSizes {
  static const appbarHeight = Size.fromHeight(50.0);
  static const appbarBorder = BorderRadius.only(
    bottomLeft: Radius.circular(30),
    bottomRight: Radius.circular(30),
  );
}

abstract class Strings {
  static const String appBarTitle = "Shopping List";
  static const String homepagetitle = "Lets Started";
  static const String textfileLabel = 'Enter product to add';
  static const String addText = "Add";
  static const String errorBar = "Please enter a product name!";
  static const String noContext = "No items yet 🛍️";
}

abstract class AppImages {
  static const String firstLottie = "assets/lottie/animation2.json";
  static const String homePageIcon = "assets/img/shopping-list.png";
}
