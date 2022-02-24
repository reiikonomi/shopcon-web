import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shopcon_web/screens/constants.dart';
import 'package:shopcon_web/screens/main/main_screen.dart';
import 'package:shopcon_web/vars.dart';
import 'package:shopcon_web/widgets/responsive.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(
      {Key? key,
      required this.title,
      required this.description,
      required this.contactNr,
      required this.createdAt,
      required this.jobimage,
      required this.postedBy,
      required this.category})
      : super(key: key);

  final String title;
  final String description;
  final String jobimage;
  final String createdAt;
  final String postedBy;
  final String contactNr;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: kDarkBlackColor,
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: kMaxWidth),
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          MainScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          // const SizedBox(height: kDefaultPadding * 2),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Image.asset(
                              "assets/logo.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "Shopcon/Pune;",
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.orange.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding),
                            child: Text(
                              "Shopcon është një platformë interaktive e cila fton përdoruesin të bëhet pjesë e një komuniteti të gjerë punëdhënësish, punëdashësish dhe shit-blerësish!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.orange.shade800,
                                height: 1.5,
                              ),
                            ),
                          ),
                          // FittedBox(
                          //   child: TextButton(
                          //     onPressed: () {},
                          //     child: Row(
                          //       children: const [
                          //         Text(
                          //           "Learn More",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             color: Colors.white,
                          //           ),
                          //         ),
                          //         SizedBox(width: kDefaultPadding / 2),
                          //         Icon(
                          //           Icons.arrow_forward,
                          //           color: Colors.white,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          if (Responsive.isDesktop(context))
                            const SizedBox(height: kDefaultPadding),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              constraints: const BoxConstraints(maxWidth: kMaxWidth),
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showImageViewer(
                            context,
                            NetworkImage(
                                Variables.imageApiEndpoint + jobimage));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  Variables.imageApiEndpoint + jobimage),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.robotoMono(
                                color: Colors.black, fontSize: 30),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Data e postimit:${DateFormat("dd-MM-yyyy, HH-mm").format(DateTime.parse(createdAt))}",
                                  // DateFormat("dd-MM-yyyy, HH-mm")
                                  //     .format(DateTime.parse(createdAt)),
                                  style: GoogleFonts.robotoMono(
                                      color: Colors.black, fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Postuar nga: $postedBy",
                                  style: GoogleFonts.robotoMono(
                                      color: Colors.black, fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Kategoria: $category",
                                  style: GoogleFonts.robotoMono(
                                      color: Colors.black, fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          width: 2, color: Colors.deepOrange)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Pershkrimi:',
                                          style: GoogleFonts.robotoMono(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          description,
                                          style: GoogleFonts.robotoMono(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
