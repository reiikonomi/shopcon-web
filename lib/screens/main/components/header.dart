import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopcon_web/controllers/menu_controller.dart';
import 'package:shopcon_web/widgets/responsive.dart';
import 'package:shopcon_web/screens/constants.dart';
import 'package:shopcon_web/screens/main/components/web_menu.dart';

class Header extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kDarkBlackColor,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _controller.openOrCloseDrawer();
                          },
                        ),

                      const Spacer(),
                      if (Responsive.isDesktop(context)) WebMenu(),
                      const Spacer(),
                      // Socal
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
                    "Shopcon",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.orange.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      "Shopcon është një platformë interaktive e cila fton përdoruesin të bëhet pjesë e një komuniteti të gjerë punëdhënësish, punëdashësish dhe shit-blerësish!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.orange.shade800,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(10),
                    child: Text(
                      "Shkarkoni aplikacionin tonë për një eksperiencë më të këndshme dhe të kënaqshme.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.orange.shade800,
                        height: 1.5,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 200,
                      width: 300,
                      constraints:
                          const BoxConstraints(maxWidth: 150, maxHeight: 150),
                      child: Image.asset(
                        "assets/googleplay.png",
                        fit: BoxFit.fill,
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
    );
  }
}
