import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  _SebhaTabState createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> with SingleTickerProviderStateMixin {
  final List<String> tasbeeh1 = [
    'سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَىَ',
    'فَسَبِّحْ بِحَمْدِ رَبِّكَ',
    'ُقُلْ هُوَ اللَّهُ أَحَدٌ',
    'وَرَبَّكَ فَكَبِّرۡ'
  ];
  final List<String> tasbeeh2 = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
  ];
  int index = 0;
  int thikrIndex = 1;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rotateSebha() {
    setState(() {
      if (thikrIndex < 33) {
        thikrIndex++;
      } else {
        thikrIndex = 1;
        index = (index + 1) % tasbeeh2.length; // Loop back
      }
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Column(
            children: [
              const SizedBox(height: 20),
              Text(
                tasbeeh1[index],
                style: GoogleFonts.aBeeZee(
                  fontSize: 39,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/Mask.png',
                height: 86,
                width: 76,
              ),
              GestureDetector(
                onTap: _rotateSebha,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _controller.value * (2 * 3.14159 / 33),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.856,
                            height: MediaQuery.of(context).size.height * 0.41,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/sebhaimg.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height / 6),
                        Column(
                          children: [
                            Text(
                              tasbeeh2[index],
                              style: GoogleFonts.elMessiri(
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "$thikrIndex",
                              style: GoogleFonts.elMessiri(
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}