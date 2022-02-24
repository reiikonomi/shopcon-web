import 'package:flutter/material.dart';

import 'package:shopcon_web/screens/constants.dart';
import 'package:shopcon_web/screens/home/components/sidebar_container.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: "Search",
      child: TextField(
        onChanged: (value) {},
        decoration: const InputDecoration(
          hintText: "Type Here ...",
          suffixIcon: Padding(
            padding: EdgeInsets.all(kDefaultPadding / 2),
            child: Icon(Icons.search),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(kDefaultPadding / 2),
            ),
            borderSide: BorderSide(color: Color(0xFFCCCCCC)),
          ),
        ),
      ),
    );
  }
}
