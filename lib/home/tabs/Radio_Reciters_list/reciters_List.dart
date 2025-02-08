import 'package:flutter/material.dart';

import '../../radio_reciters_card.dart';

class RecitersList extends StatefulWidget {
  const RecitersList({super.key});

  @override
  State<RecitersList> createState() => _RecitersListState();
}

class _RecitersListState extends State<RecitersList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RadioRecitersCard(Reciter_Radio_Name: "Mohammed hammad"),
        RadioRecitersCard(Reciter_Radio_Name: "Mohammed hammad"),
        RadioRecitersCard(Reciter_Radio_Name: "Mohammed hammad"),
        RadioRecitersCard(Reciter_Radio_Name: "Ahmed Atef"),
        RadioRecitersCard(Reciter_Radio_Name: "Mohammed Obada"),
        RadioRecitersCard(Reciter_Radio_Name: "Dr.Mostafa elgendy"),
      ],
    );
  }
}
