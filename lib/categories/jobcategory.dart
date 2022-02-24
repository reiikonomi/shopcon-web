import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shopcon_web/models/jobs_model.dart';
import 'package:shopcon_web/screens/details/detailsscreen.dart';
import 'package:shopcon_web/screens/home/components/job_card.dart';
import 'package:shopcon_web/vars.dart';

class JobCategory extends StatefulWidget {
  final String category;
  const JobCategory({Key? key, required this.category}) : super(key: key);

  @override
  _JobCategoryState createState() => _JobCategoryState();
}

class _JobCategoryState extends State<JobCategory> {
  List jobs = [];
  // List refreshedJob = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getAllJobsByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.deepOrange,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List<Jobs>>(
        future: getAllJobsByCategory(widget.category),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int i) {
                  return GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            category: snapshot.data![i].category,
                            title: snapshot.data![i].title,
                            description: snapshot.data![i].description,
                            contactNr: snapshot.data![i].contactNr,
                            createdAt: snapshot.data![i].createdAt,
                            jobimage: snapshot.data![i].jobimage,
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
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Dicka shkoi keq, provoni perseri!",
                          style: GoogleFonts.robotoMono(
                              color: Colors.deepOrange, fontSize: 17),
                        ),
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.5,
                      //   width: MediaQuery.of(context).size.width,
                      //   child: SvgPicture.asset(
                      //     "assets/web.svg",
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            );
          }

          // By default, show a loading spinner.
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<List<Jobs>> getAllJobsByCategory(String category) async {
    final response =
        await http.get(Uri.parse(Variables.jobCategoryApiEndpoint + category));
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => Jobs.fromJson(job)).toList();
  }

  // Future<void> refreshData(category) async {
  //   setState(() {
  //     getAllJobsByCategory(category);
  //   });
  // }
}
