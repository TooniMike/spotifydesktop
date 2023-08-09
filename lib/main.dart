import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifydesktop/data/data.dart';
import 'package:spotifydesktop/models/current_track.dart';
import 'screens/playlist_screen.dart';
import 'widgets/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)){
  await DesktopWindow.setWindowSize(const Size(600, 800));
  }
  runApp(ChangeNotifierProvider(
    create: (context) => CurrentTrackModel(),
    child: const MyApp()
    ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if(MediaQuery.of(context).size.width > 800)
                const SideMenu(),
                const Expanded(child: PlayListScreen(playlist: lofihiphopPlaylist,)),
              ],
            ),
          ),
          const CurrentTrack(),
        ],
      ),
    );
  }
}
