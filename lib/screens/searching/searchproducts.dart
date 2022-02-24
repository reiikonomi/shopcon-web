import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:shopcon_web/models/product_model.dart';
import 'package:shopcon_web/screens/details/detailsscreen.dart';
import 'package:shopcon_web/vars.dart';
import 'package:shopcon_web/widgets/responsive.dart';
import 'package:shopcon_web/screens/constants.dart';
import 'package:shopcon_web/screens/home/components/job_card.dart';
import 'package:shopcon_web/screens/main/main_screen.dart';
import 'package:shopcon_web/widgets/searchbarwidget.dart';

class SearchProducts extends StatefulWidget {
  const SearchProducts({Key? key}) : super(key: key);

  @override
  State<SearchProducts> createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProducts> {
  List<Products> products = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final products = await getJobsByQuery(query);

    setState(() => this.products = products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: SideMenu(),
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
                          // Text(
                          //   "Shopcon/Produkte;",
                          //   style: TextStyle(
                          //     fontSize: 32,
                          //     color: Colors.orange.shade800,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       vertical: kDefaultPadding),
                          //   child: Text(
                          //     "Shopcon është një platformë interaktive e cila fton përdoruesin të bëhet pjesë e një komuniteti të gjerë punëdhënësish, punëdashësish dhe shit-blerësish!",
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //       color: Colors.orange.shade800,
                          //       height: 1.5,
                          //     ),
                          //   ),
                          // ),
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
            // Container(
            //   padding: const EdgeInsets.all(kDefaultPadding),
            //   constraints: const BoxConstraints(maxWidth: 500),
            //   height: MediaQuery.of(context).size.height * 0.4,
            //   child: SvgPicture.asset(
            //     "assets/onboard2.svg",
            //     fit: BoxFit.contain,
            //   ),
            // ),
            buildSearch(),
            Container(
              padding: const EdgeInsets.only(
                  top: kDefaultPadding,
                  left: kDefaultPadding,
                  right: kDefaultPadding),
              constraints: const BoxConstraints(maxWidth: 500),
              height: MediaQuery.of(context).size.height * 0.3,
              child: SvgPicture.asset(
                "assets/onboard2.svg",
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  right: kDefaultPadding,
                  left: kDefaultPadding,
                  bottom: kDefaultPadding),
              constraints: const BoxConstraints(maxWidth: kMaxWidth),
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return buildJob(product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: SearchWidget(
          text: query,
          hintText: 'Kerko produkte...',
          onChanged: searchJob,
        ),
      );

  Future searchJob(String query) async => debounce(() async {
        final products = await getJobsByQuery(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.products = products;
        });
      });

  Widget buildJob(Products products) => Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: GestureDetector(
          onTap: () => {},
          child: GestureDetector(
              onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => DetailsScreen(
                          jobimage: products.productImage,
                          createdAt: products.createdAt,
                          description: products.description,
                          title: products.productName,
                          category: products.category,
                          contactNr: products.contactNr,
                          postedBy: products.postedBy,
                        ),
                      ),
                    )
                  },
              child: BlogPostCard(
                jobimage: products.productImage,
                createdAt: products.createdAt,
                postedBy: products.postedBy,
                title: products.productName,
              )),
        ),
      );
}

Future<List<Products>> getJobsByQuery(String query) async {
  final url = Uri.parse(Variables.searchProductApiEndoint + query);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List products = json.decode(response.body);

    return products.map((json) => Products.fromJson(json)).where((products) {
      final titleLower = products.productName.toLowerCase();
      final descriptionLower = products.description.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          descriptionLower.contains(searchLower);
    }).toList();
  } else {
    throw Exception();
  }
}
