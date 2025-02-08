import 'package:flutter/material.dart';
import 'package:islami_c13_sunday/home/radio_reciters_card.dart';

import 'radio_list.dart';
import 'reciters_List.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool Reciters_tabbed = false;
  bool Radio_tabbed = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                  color: Color(0xd9202020),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Reciters_tabbed = false;
                          Radio_tabbed = true;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Radio_tabbed ? Color(0xffE2BE7F) : Colors.transparent,
                        ),
                        child: Text(
                          "Radio",
                          style: TextStyle(
                              color: Radio_tabbed ? Color(0xff202020) : Colors.white,
                              // color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Radio_tabbed = false;
                          Reciters_tabbed = true;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Reciters_tabbed ? Color(0xffE2BE7F): Colors.transparent ,
                        ),
                        child: Text(
                          "Reciters",
                          style: TextStyle(
                              color: Reciters_tabbed
                                  ?  Color(0xff202020) : Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.56,
              child: Radio_tabbed ? RadioList() : RecitersList(),
            ),
          ],
        ),

      ),
    );
  }
}