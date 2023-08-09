import 'package:flutter/material.dart';
import 'package:spotifydesktop/data/data.dart';

import '../widgets/widgets.dart';


class PlayListScreen extends StatefulWidget {
  final Playlist playlist;
  const PlayListScreen({super.key, required this.playlist});

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: (){},
                child: Container(padding: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                  color: Colors.black26, 
                  shape: BoxShape.circle
                  ),
                  child: const Icon(Icons.chevron_left, size: 28.0,),
                ),
              ),
              const SizedBox(width: 16.0),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: (){},
                child: Container(padding: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                  color: Colors.black26, 
                  shape: BoxShape.circle
                  ),
                  child: const Icon(Icons.chevron_right, size: 28.0,),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              iconColor: Colors.white
            ),
            onPressed: (){}, 
            icon: const Icon(Icons.account_circle_outlined, size: 30.0,), 
            label: const Text('Tooni Mikee', 
            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
            ),
            ),
            const SizedBox(width: 8,),
            IconButton(
              padding: const EdgeInsets.only(),
              onPressed: (){}, 
              icon: const Icon(Icons.keyboard_arrow_down, size: 30.0,),
            ),
            const SizedBox(width: 20.0,)
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFAF1018),
              // Theme.of(context).dialogBackgroundColor
              Colors.black87,
            ],
            stops: [0, 0.3],
          )
        ),
        child: Scrollbar(
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0, 
              vertical: 60.0
              ),
              children: [
                PlayListHeader(playlist: widget.playlist),
                TracksList(tracks: widget.playlist.songs),
              ],
          )
          ),
      ),
    );
  }
}