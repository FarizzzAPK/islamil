import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c13_sunday/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetails";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var suraModel = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(suraModel.index);
    }
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      appBar: AppBar(
        title: Text(
          suraModel.nameEn,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/images/details_bg.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 12,
                ),
                child: Text(
                  suraModel.nameAr,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE2BE7F)),
                          borderRadius: BorderRadius.circular(16)),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: verses[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.white),
                              ),
                              TextSpan(
                                text: "(${index + 1})",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: verses.length,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String textFile =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = textFile.split("\n");
    print(lines);
    verses = lines;
    setState(() {});
  }
}
