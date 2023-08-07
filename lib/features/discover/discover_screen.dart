import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  // TabController controller = TabController(length: length, vsync: this);

  void _onSearchChanged(String value) {
    print(value);
  }

  void _onSearchSubmitted(String value) {
    print(value);
  }

  void _onTap(int value) {
    FocusScope.of(context).unfocus();
  }

  List<String> tabs = [];
  void initStateData() {
    tabs = [
      "Top",
      "Users",
      "Videos",
      "Sounds",
      "LIVE",
      "Shopping",
      "Brands",
    ];
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initStateData();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
            title: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Breakpoints.sm,
              ),
              child: CupertinoSearchTextField(
                onChanged: _onSearchChanged,
                onSubmitted: _onSearchSubmitted,
              ),
            ),
            elevation: 1,
            bottom: TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: Colors.grey.shade500,
              indicatorColor: Colors.black,
              isScrollable: true,
              padding: EdgeInsets.symmetric(horizontal: Sizes.size16),
              splashFactory: NoSplash.splashFactory,
              onTap: _onTap,
              tabs: tabs.map((e) => Tab(text: e)).toList(),
            )),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.symmetric(
                vertical: Sizes.size8,
                horizontal: Sizes.size8,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > Breakpoints.lg ? 5 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return LayoutBuilder(
                  builder: (context, constraints) => Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          Sizes.size3,
                        ),
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: FadeInImage.assetNetwork(
                            image:
                                "https://picsum.photos/900/1600?random=$index",
                            placeholder: "assets/flutter.png",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Gaps.v10,
                      Text(
                        "This is a very long caption for my tiktok that im upload just now currently.",
                        style: TextStyle(
                          fontSize: Sizes.size14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Gaps.v5,
                      if (constraints.maxWidth < 200 ||
                          constraints.maxWidth > 250)
                        Row(
                          children: [
                            CircleAvatar(
                              radius: Sizes.size12,
                              child: Text(
                                "하꼬",
                                style: TextStyle(
                                  fontSize: Sizes.size10,
                                ),
                              ),
                            ),
                            Gaps.h5,
                            Expanded(
                              child: Text(
                                "My avatar is going to be very long",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gaps.h5,
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size12,
                            ),
                            Gaps.h3,
                            Text(
                              "2.5M",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                    ],
                  ),
                );
              },
            ),
            ...tabs.where((element) => element != "Top").map(
                  (e) => Center(
                    child: Text(e),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
