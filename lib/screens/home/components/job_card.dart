import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopcon_web/widgets/responsive.dart';
import 'package:shopcon_web/screens/constants.dart';

class BlogPostCard extends StatelessWidget {
  final String title;
  final String postedBy;
  final String jobimage;
  final String createdAt;
  const BlogPostCard({
    Key? key,
    required this.createdAt,
    required this.postedBy,
    required this.jobimage,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: kDefaultPadding),
                    Text(
                      DateFormat("dd-MM-yyyy, HH-mm")
                          .format(DateTime.parse(createdAt)),
                      // createdAt,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Responsive.isDesktop(context) ? 32 : 24,
                      fontFamily: "Raleway",
                      color: kDarkBlackColor,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  postedBy,
                  maxLines: 4,
                  style: const TextStyle(height: 1.5),
                ),
                const SizedBox(height: kDefaultPadding),
                Row(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: kDefaultPadding / 4),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: kPrimaryColor, width: 3),
                        ),
                      ),
                      child: const Text(
                        "Lexo më shumë",
                        style: TextStyle(color: kDarkBlackColor),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
