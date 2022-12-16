import 'package:flutter/material.dart';

class Utils {

  static showErrorSnackBar(BuildContext context,String? text, Color bg) {
    Color bgColor = bg;

    if (text == null) return;
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error_outline, size: 21,),
          const SizedBox(width: 16,),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      backgroundColor: bgColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}