import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopcon_web/categories/productcategory.dart';
import 'package:shopcon_web/widgets/responsive.dart';
import 'package:shopcon_web/screens/constants.dart';
import 'package:shopcon_web/screens/home/productscreen.dart';
import 'package:shopcon_web/screens/main/main_screen.dart';
import 'package:shopcon_web/screens/searching/searchproducts.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Image.asset(
                              "assets/logo.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "Shopcon/Produkte;",
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ProductCategory(
                              category: "automjete",
                            ),
                          ),
                        )
                      },
                      child: Container(
                       width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.1,
                        // width: MediaQuery.of(context).size.height * 0.18,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.car_rental,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Automjete",
                                style: GoogleFonts.robotoMono(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                 padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ProductCategory(
                              category: "veshje",
                            ),
                          ),
                        )
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            ),
                            Padding(
                             padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Veshje",
                                style: GoogleFonts.robotoMono(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ProductCategory(
                              category: "produktekozmetike",
                            ),
                          ),
                        )
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.brush,
                              color: Colors.white,
                            ),
                            Padding(
                             padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Kozmetike",
                                style: GoogleFonts.robotoMono(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                  padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ProductCategory(
                              category: "produktebio",
                            ),
                          ),
                        )
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.nature_people,
                              color: Colors.white,
                            ),
                            Padding(
                            padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Bio",
                                style: GoogleFonts.robotoMono(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ProductCategory(
                              category: "elektronike",
                            ),
                          ),
                        )
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.mobile_friendly,
                              color: Colors.white,
                            ),
                            Padding(
                             padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Elektronike",
                                style: GoogleFonts.robotoMono(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ProductCategory(
                              category: "elektroshtepiake",
                            ),
                          ),
                        )
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.electrical_services_rounded,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Elektroshtepiake",
                                style: GoogleFonts.robotoMono(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ProductCategory(
                              category: "tetjera",
                            ),
                          ),
                        )
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.all_out,
                              color: Colors.white,
                            ),
                            Padding(
                             padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Te Tjera",
                                style: GoogleFonts.robotoMono(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SearchProducts(),
                    ),
                  )
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(kDefaultPadding),
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Kerko produkte...",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              constraints: const BoxConstraints(maxWidth: kMaxWidth),
              child: const AllProductScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
