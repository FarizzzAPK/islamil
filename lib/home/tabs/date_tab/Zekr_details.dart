import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ZekrDetails extends StatelessWidget {
  String zekr ="";

   ZekrDetails({required this.zekr,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: zekr));

      },
      child: Text(
        zekr,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
