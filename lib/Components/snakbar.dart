import 'package:flutter/material.dart';

class CustomSnackBar {
  static showSuccessSnackBar(BuildContext context,
      {required String message,
      int milliseconds = 10000,
      SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        backgroundColor: Colors.purple,
        margin: const EdgeInsets.only(bottom: 100.0),
        behavior: snackBarBehavior,
        action: SnackBarAction(
            textColor: Colors.white,
            label: '',
            onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void showErrorSnackBar(BuildContext context,
      { String? message,
      int milliseconds = 5000,
      SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFFFF647C),
        behavior: snackBarBehavior,
        action: SnackBarAction(
            textColor: Colors.black,
            label: 'DISMISS',
            onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message ?? 'Ocorreu um erro',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void _dismissCurrentSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}