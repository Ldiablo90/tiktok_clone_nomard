import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox.dart/activity_screen.dart';
import 'package:tiktok_clone/features/inbox.dart/chats_screen.dart';

class InBoxScreen extends StatefulWidget {
  const InBoxScreen({super.key});

  @override
  State<InBoxScreen> createState() => _InBoxScreenState();
}

class _InBoxScreenState extends State<InBoxScreen> {
  void _onDMPressed() {
    context.pushNamed(ChatsScreen.routerName);
  }

  void _onActivityTab() {
    context.pushNamed(ActivityScreen.routerName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INBOX"),
        actions: [
          IconButton(
            onPressed: _onDMPressed,
            icon: FaIcon(
              FontAwesomeIcons.paperPlane,
            ),
          ),
        ],
        elevation: 1,
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: _onActivityTab,
            title: Text(
              "Activity",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              size: Sizes.size20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
