import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import '../../evening_Azkar_Details.dart';
import '../../morning_Azkar_Details.dart';
import '../../paryer_Card.dart';

class DateTab extends StatefulWidget {
  const DateTab({super.key});
  static const String routeName = "Date";
  @override
  _DateTabState createState() => _DateTabState();
}

class _DateTabState extends State<DateTab> {
  late PageController _pageController;
  late Timer _timer;
  bool isMuted = false;
  final List<Map<String, String>> _prayers = [
    {"prayerName": "Fajr", "prayerTime": "05:15"},
    {"prayerName": "Sunrise", "prayerTime": "06:44"},
    {"prayerName": "Dhuhr", "prayerTime": "12:11"},
    {"prayerName": "ASR", "prayerTime": "03:14"},
    {"prayerName": "Maghrib", "prayerTime": "05:36"},
    {"prayerName": "Isha", "prayerTime": "06:55"},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.25, initialPage: 1000);

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void toggleMute() {
    setState(() {
      isMuted = !isMuted;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Background
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: const Color(0xff856B3F),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              // Middle Layer
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: const Color(0xffE2BE7F),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              // Foreground Small Box
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: const Color(0xffE2BE7F),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              // Decorative Images
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                right: MediaQuery.of(context).size.width * 0.13,
                child: Image.asset("assets/images/rangel.png"),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.13,
                child: Image.asset("assets/images/langel.png"),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.11,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.135,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      PrayerCard(
                        prayerName: "Fajr",
                        prayerTime: "05:15",
                      ),
                      PrayerCard(
                        prayerName: "Sunrise",
                        prayerTime: "06:44",
                      ),
                      PrayerCard(
                        prayerName: "Dhuhr",
                        prayerTime: "12:11",
                      ),
                      PrayerCard(
                        prayerName: "ASR",
                        prayerTime: "03:14",
                      ),
                      PrayerCard(
                        prayerName: "Maghrib",
                        prayerTime: "05:36",
                      ),
                      PrayerCard(
                        prayerName: "Isha",
                        prayerTime: "06:55",
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 14,
                left: 26,
                child: Text(
                  DateFormat('dd MMM ,\n yyyy').format(DateTime.now()),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                top: 14,
                right: 26,
                child: Text(
                  HijriCalendar.now().toFormat("dd MM ,\n yyyy"),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Positioned(
                bottom: 12,
                right: 26,
                child: IconButton(
                  icon: Icon(isMuted ? Icons.volume_up : Icons.volume_off),
                  iconSize: 35,
                  onPressed: toggleMute,
                ),
              ),
              Positioned(
                  top: 20,
                  child: Container(
                    height: 80,
                    child: Column(
                      children: [
                        Text(
                          "Prayer Time",
                          style: TextStyle(
                            color: Color(0xB6202020),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Text(
                          DateFormat('EEEE').format(DateTime.now()),
                          style: TextStyle(
                            color: Color(0xE6202020),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Next Prayer ",
                      style: TextStyle(
                        color: Color(0xB6202020),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "- 02:32",
                      style: TextStyle(
                        color: Color(0xE6202020),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            children: [
              Text(
                "Azkar",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EveningAzkarDetails()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xffE2BE7F), width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Image.asset("assets/images/masaa.png"),
                      Text(
                        "Evening Azkar",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MorningAzkarDetails()),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xffE2BE7F), width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Image.asset("assets/images/sabah.png"),
                      Text(
                        "Morning Azkar",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
