import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shopcon_web/models/jobs_model.dart';
import 'package:shopcon_web/screens/details/detailsscreen.dart';
import 'package:shopcon_web/vars.dart';
import 'package:shopcon_web/widgets/responsive.dart';
import 'package:shopcon_web/screens/constants.dart';
import 'package:shopcon_web/screens/home/components/job_card.dart';
import 'components/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List jobs = [];
  List refreshedJob = [];

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getAllJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrange, width: 1),
                borderRadius: BorderRadius.circular(20)),
            height: MediaQuery.of(context).size.height * 0.3,
            child: FutureBuilder<List<Jobs>>(
              future: getAllJobs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      addAutomaticKeepAlives: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      //TODO change item count later so that it is not infinite
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int i) {
                        //if (itemlist[i] is String) {
                        return GestureDetector(
                          onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    DetailsScreen(
                                  jobimage: snapshot.data![i].jobimage,
                                  createdAt: snapshot.data![i].createdAt,
                                  description: snapshot.data![i].description,
                                  title: snapshot.data![i].title,
                                  category: snapshot.data![i].category,
                                  contactNr: snapshot.data![i].contactNr,
                                  postedBy: snapshot.data![i].postedBy,
                                ),
                              ),
                            )
                          },
                          child: BlogPostCard(
                            jobimage: snapshot.data![i].jobimage,
                            createdAt: snapshot.data![i].createdAt,
                            postedBy: snapshot.data![i].postedBy,
                            title: snapshot.data![i].title,
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return ListView(
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Dicka shkoi keq, provoni perseri!",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.height * 0.5,
                        child: SvgPicture.asset(
                          "assets/error.svg",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  );
                }

                // By default, show a loading spinner.
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
        if (Responsive.isMobile(context))

          //   const SizedBox(width: kDefaultPadding),
          // // Sidebar
          if (!Responsive.isMobile(context))
            Expanded(
              child: Column(
                children: const [
                  Search(),
                  SizedBox(height: kDefaultPadding),
                  SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
      ],
    ); 
  }

  Future<List<Jobs>> getAllJobs() async {
    String jobUri = Variables.getAllJobsApiEndpoint;

    final response = await http.get(Uri.parse(jobUri));
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => Jobs.fromJson(job)).toList();
  }

  Future<void> refreshData() async {
    setState(() {
      getAllJobs();
    });
  }
}

class AllJobsScreen extends StatefulWidget {
  const AllJobsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllJobsScreen> createState() => _AllJobsScreenState();
}

class _AllJobsScreenState extends State<AllJobsScreen> {
  List jobs = [];
  List refreshedJob = [];

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getAllJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(20)),
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<List<Jobs>>(
              future: getAllJobs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      addAutomaticKeepAlives: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int i) {
                        //if (itemlist[i] is String) {
                        return GestureDetector(
                          onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    DetailsScreen(
                                  jobimage: snapshot.data![i].jobimage,
                                  createdAt: snapshot.data![i].createdAt,
                                  description: snapshot.data![i].description,
                                  title: snapshot.data![i].title,
                                  category: snapshot.data![i].category,
                                  contactNr: snapshot.data![i].contactNr,
                                  postedBy: snapshot.data![i].postedBy,
                                ),
                              ),
                            )
                          },
                          child: BlogPostCard(
                            jobimage: snapshot.data![i].jobimage,
                            createdAt: snapshot.data![i].createdAt,
                            postedBy: snapshot.data![i].postedBy,
                            title: snapshot.data![i].title,
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return ListView(
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Dicka shkoi keq, provoni perseri!",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.height * 0.5,
                        child: SvgPicture.asset(
                          "assets/error.svg",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  );
                }

                // By default, show a loading spinner.
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
        if (Responsive.isMobile(context))

          //   const SizedBox(width: kDefaultPadding),
          // // Sidebar
          if (!Responsive.isMobile(context))
            Expanded(
              child: Column(
                children: const [
                  Search(),
                  SizedBox(height: kDefaultPadding),
                  SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
      ],
    );
  }

  Future<List<Jobs>> getAllJobs() async {
    String jobUri = Variables.getAllJobsApiEndpoint;

    final response = await http.get(Uri.parse(jobUri));
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => Jobs.fromJson(job)).toList();
  }

  Future<void> refreshData() async {
    setState(() {
      getAllJobs();
    });
  }
}
