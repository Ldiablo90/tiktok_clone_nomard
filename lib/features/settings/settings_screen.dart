import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/common/widgets/video_config/video_config.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/voides/view_models/playback_config_vm.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: ListWheelScrollView(
              diameterRatio: 1.4,
              offAxisFraction: 0,
              itemExtent: 80,
              children: List.generate(10, (index) => index)
                  .map((e) => FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          color: Colors.teal,
                          alignment: Alignment.center,
                          child: Text(
                            'Pick me $e',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size24,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          AboutListTile(),
          // ValueListenableBuilder(
          //   valueListenable: videoConfig,
          //   builder: (context, value, child) => SwitchListTile.adaptive(
          //     // value: videoConfig.autoMute,
          //     value: value,
          //     onChanged: (_) {
          //       videoConfig.value = !videoConfig.value;
          //     },
          //     // onChanged: (_) {
          //     //   videoConfig.toggleAutoMute();
          //     // },
          //     // value: VideoConfigData.of(context).autuMute,
          //     // onChanged: (_) {
          //     //   VideoConfigData.of(context).toggleMute();
          //     // },
          //     title: const Text("Auto Mute"),
          //     subtitle: const Text("Videos will be muted by default."),
          //   ),
          // ),
          //
          // ###################### Riverpod 방식
          SwitchListTile.adaptive(
            value: false,
            onChanged: (value) {},
            // onChanged: _onNotificationsChanged,
            // value: VideoConfigData.of(context).autuMute,
            // onChanged: (_) {
            //   VideoConfigData.of(context).toggleMute();
            // },
            title: const Text("Auto Mute"),
            subtitle: const Text("Videos will be muted by default."),
          ),
          SwitchListTile.adaptive(
            value: false,
            onChanged: (value) {},
            // onChanged: _onNotificationsChanged,
            // value: VideoConfigData.of(context).autuMute,
            // onChanged: (_) {
            //   VideoConfigData.of(context).toggleMute();
            // },
            title: const Text("Auto Play"),
            subtitle: const Text("Videos will start playing automatically."),
          ),
          // ###################### Riverpod 방식 끝
          // ###################### Provider 방식
          // SwitchListTile.adaptive(
          //   value: context.watch<PlaybackConfigViewModel>().muted,
          //   onChanged: (value) {
          //     context.read<PlaybackConfigViewModel>().setMuted(value);
          //   },
          //   // onChanged: _onNotificationsChanged,
          //   // value: VideoConfigData.of(context).autuMute,
          //   // onChanged: (_) {
          //   //   VideoConfigData.of(context).toggleMute();
          //   // },
          //   title: const Text("Auto Mute"),
          //   subtitle: const Text("Videos will be muted by default."),
          // ),
          // SwitchListTile.adaptive(
          //   value: context.watch<PlaybackConfigViewModel>().autoplay,
          //   onChanged: (value) {
          //     context.read<PlaybackConfigViewModel>().setAutoplay(value);
          //   },
          //   // onChanged: _onNotificationsChanged,
          //   // value: VideoConfigData.of(context).autuMute,
          //   // onChanged: (_) {
          //   //   VideoConfigData.of(context).toggleMute();
          //   // },
          //   title: const Text("Auto Play"),
          //   subtitle: const Text("Videos will start playing automatically."),
          // ),
          // ###################### Provider 방식 끝
          CheckboxListTile(
            activeColor: Colors.black,
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: const Text("Enable notifications"),
            subtitle: const Text("We won't spam you."),
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
              );
              print(date);
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                        appBarTheme: const AppBarTheme(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black)),
                    child: child!,
                  );
                },
              );
              print(booking);
            },
            title: const Text("What is your birthday?"),
            subtitle: const Text("I need to know!"),
          ),
          ListTile(
            title: const Text("Log out (iOS)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("Plx dont go"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (Android)"),
            textColor: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  icon: const FaIcon(FontAwesomeIcons.skull),
                  title: const Text("Are you sure?"),
                  content: const Text("Plx dont go"),
                  actions: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const FaIcon(FontAwesomeIcons.car),
                    ),
                    TextButton(
                      onPressed: () => context.pop(),
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (iOS / Bottom)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text("Are you sure?"),
                  message: const Text("Please dooooont gooooo"),
                  actions: [
                    CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () => context.pop(),
                      child: const Text("Not log out"),
                    ),
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () => context.pop(),
                      child: const Text("Yes plz."),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
