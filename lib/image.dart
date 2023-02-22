import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timer_snackbar/timer_snackbar.dart';

class Linkdin extends StatefulWidget {
  const Linkdin({Key? key}) : super(key: key);

  @override
  State<Linkdin> createState() => _LinkdinState();
}

class _LinkdinState extends State<Linkdin> {
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Image Save App", style: GoogleFonts.abel(fontSize: 30)
              // TextStyle(fontSize: 25, color: Colors.white,),
              ),
          leading: Icon(Icons.settings_sharp),
          //
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RepaintBoundary(
              key: key,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 100,
                  backgroundImage: AssetImage("assets/images/car.jpg"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Well this is the first car i m driving and its look"
                " best ride best and its performance is not up to the"
                " mark for fast riders. Although this car completes "
                "my all expectations. Pros is like its low price ofc "
                "and tata build quality, average is normal but good only"
                " if 4 people are sitting into it",
                style: GoogleFonts.dancingScript(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            InkWell(
              onTap: () async {
                final boundary = key.currentContext?.findRenderObject()
                    as RenderRepaintBoundary?;
                final image = await boundary?.toImage(pixelRatio: 3.0);
                final byteData =
                    await image?.toByteData(format: ImageByteFormat.png);
                final imageBytes = byteData?.buffer.asUint8List();

                if (imageBytes != null) {
                  final directory = await getApplicationDocumentsDirectory();
                  final imagePath =
                      await File('${directory.path}/container_image.png')
                          .create();
                  await imagePath.writeAsBytes(imageBytes);
                }

                timerSnackbar(
                    context: context,
                    contentText: "Congratulations 🎉 Save",
                    afterTimeExecute: () => print("object"),
                    second: 3);
              },
              child: Container(
                height: 50,
                width: 125,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black),
                child: Center(
                  child: Text(
                    "Save",
                    style:
                        GoogleFonts.alegreya(color: Colors.white, fontSize: 30),

                    // TextStyle(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
