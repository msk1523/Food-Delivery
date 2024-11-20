import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle headlineTextFieldStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle lightTextFieldStyle() {
    return const TextStyle(
      color: Color.fromARGB(255, 217, 110, 103),
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle semiBoldTextFieldStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle contextTextFieldStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle hintTextFieldStyle() {
    return TextStyle(
      color: Colors.red.shade200,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle hint2TextFieldStyle() {
    return TextStyle(
      color: Colors.black54,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }
}
