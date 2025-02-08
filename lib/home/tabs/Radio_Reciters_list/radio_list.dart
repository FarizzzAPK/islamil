import 'package:flutter/material.dart';

import '../../radio_reciters_card.dart';

class RadioList extends StatefulWidget {
  const RadioList({super.key});

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RadioRecitersCard(Reciter_Radio_Name: "Radio Mohammed hammad"),
        RadioRecitersCard(Reciter_Radio_Name: "Radio Ahmed Atef"),
        RadioRecitersCard(Reciter_Radio_Name: "Radio Mohammed Obada"),
        RadioRecitersCard(Reciter_Radio_Name: "Radio Dr.Mostafa elgendy"),
        RadioRecitersCard(Reciter_Radio_Name: "Radio Mohammed hammad"),
        RadioRecitersCard(Reciter_Radio_Name: "Radio Mohammed hammad"),
      ],
    );
  }
}
