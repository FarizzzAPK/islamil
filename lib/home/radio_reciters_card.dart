import 'package:flutter/material.dart';

class RadioRecitersCard extends StatefulWidget {
  late String Reciter_Radio_Name;
  RadioRecitersCard({required this.Reciter_Radio_Name, super.key});
  @override
  State<RadioRecitersCard> createState() => _RadioRecitersCardState();
}

class _RadioRecitersCardState extends State<RadioRecitersCard> {
  static bool isPlaying = false;
  static bool isMuted = false;

  void toggleIcon() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void toggleMute() {
    setState(() {
      isMuted = !isMuted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: MediaQuery.of(context).size.height / 7.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xffE2BE7F),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.Reciter_Radio_Name,
                  style: TextStyle(
                    color: Color(0xff202020),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: backImg(isPlaying),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width * 0.12,),
                        IconButton(
                          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                          iconSize: 40,
                          onPressed: toggleIcon,
                        ),
                        IconButton(
                          icon: Icon(isMuted ? Icons.volume_up : Icons.volume_off),
                          iconSize: 35,
                          onPressed: toggleMute,
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget backImg(isplaying) {
  if (!isplaying) {
    return Image.asset(
      "assets/images/Mosquee.png",
      fit: BoxFit.cover,
      width: double.infinity,
      opacity:  const AlwaysStoppedAnimation(.2),

    );
  } else {
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        "assets/images/soundWave.png",
        fit: BoxFit.cover,
        width: double.infinity,
        opacity:  const AlwaysStoppedAnimation(.2),
      ),
    );
  }
}
