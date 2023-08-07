import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/voides/video_recording_screen.dart';

// class MainNavigationBarItem extends BottomNavigationBarItem {
//   MainNavigationBarItem({
//     required this.icons,
//     required this.labeld,
//     required this.initaLocation,
//   }) : super(
//           icon: Icon(
//             icons,
//           ),
//           label: labeld,
//         );

//   IconData? icons;
//   String labeld;
//   String initaLocation;
// }

class MainNavigationBarItem extends StatelessWidget {
  MainNavigationBarItem({
    super.key,
    required this.icons,
    required this.selectIcons,
    required this.labeld,
    required this.initaLocation,
    this.selectedIndex = 0,
    this.onTap = false,
    this.selected = false,
  });
  IconData? icons;
  IconData? selectIcons;
  String labeld;
  String initaLocation;
  bool onTap;
  bool selected;
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    if (onTap) {
      return GestureDetector(
          onTap: () => context.pushNamed(labeld),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Positioned(
                    right: 50,
                    child: Container(
                      width: 30,
                      height: 33,
                      decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(Sizes.size6)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Positioned(
                    left: 20,
                    child: Container(
                      width: 30,
                      height: 33,
                      decoration: BoxDecoration(
                          color: Colors.indigo[200],
                          borderRadius: BorderRadius.circular(Sizes.size6)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 35,
                    // padding: const EdgeInsets.symmetric(
                    //   horizontal: Sizes.size12,
                    // ),
                    decoration: BoxDecoration(
                      color: selectedIndex == 0 ? Colors.white : Colors.black,
                      borderRadius: BorderRadius.circular(
                        Sizes.size6,
                      ),
                    ),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.plus,
                        color: selectedIndex == 0 ? Colors.black : Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ));
    }

    return NavigationDestination(
      icon: FaIcon(
        icons,
        color: Colors.grey.withOpacity(.8),
        size: Sizes.size24,
      ),
      selectedIcon: FaIcon(
        selectIcons,
        color: selectedIndex == 0 ? Colors.white : Colors.black,
        size: Sizes.size24,
      ),
      label: labeld,
    );
    // return Column(
    //   children: [
    //     FaIcon(
    //       selected ? selectIcons : icons,
    //       color: selected
    //           ? selectedIndex == 0
    //               ? Colors.white
    //               : Colors.black
    //           : Colors.grey[200],
    //       size: Sizes.size24,
    //     ),
    //     Text(
    //       labeld,
    //       style: TextStyle(
    //         color: selected
    //             ? selectedIndex == 0
    //                 ? Colors.white
    //                 : Colors.black
    //             : Colors.grey[200],
    //       ),
    //     ),
    //   ],
    // );
  }
}

// class MainNavigationBarItem extends NavigationDestination {
//   MainNavigationBarItem({
//     super.key,
//     required this.icons,
//     required this.selectIcons,
//     required this.labeld,
//     required this.initaLocation,
//   }) : super(
//           icon: FaIcon(
//             icons,
//             color: Colors.grey.withOpacity(.8),
//           ),
//           label: labeld,
//           selectedIcon: FaIcon(
//             selectIcons,
//             color: Colors.white,
//           ),
//         );

//   IconData? icons;
//   IconData? selectIcons;
//   String labeld;
//   String initaLocation;
// }

// class MainNavigationBarItem extends NavigationDestination {
//   MainNavigationBarItem({
//     super.key,
//     required this.icons,
//     required this.selectIcons,
//     required this.labeld,
//     required this.initaLocation,
//   }) : super(
//           icon: FaIcon(
//             icons,
//             color: Colors.grey.withOpacity(.8),
//           ),
//           label: labeld,
//           selectedIcon: FaIcon(
//             selectIcons,
//             color: Colors.white,
//           ),
//         );

//   IconData? icons;
//   IconData? selectIcons;
//   String labeld;
//   String initaLocation;
// }
