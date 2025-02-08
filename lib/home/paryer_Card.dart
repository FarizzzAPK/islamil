import 'package:flutter/material.dart';

class PrayerCard extends StatelessWidget {
  String prayerName;
  String prayerTime;

  PrayerCard({required this.prayerName, required this.prayerTime, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.height * 0.13,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff202020),
                Color(0xffB19768),
              ],
              tileMode: TileMode.mirror,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              prayerName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(), // Adds equal spacing between items
            Text(
              prayerTime,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(), // Adds equal spacing between items
            Text(
              (prayerName == "Fajr" || prayerName == "Sunrise") ? "AM" : "PM",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
          ],
        )


      ),
    );
  }
}
