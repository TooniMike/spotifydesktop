import 'package:flutter/material.dart';
import '../data/data.dart';

class PlayListHeader extends StatelessWidget {
  final Playlist playlist;
  const PlayListHeader({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(playlist.imageURL,
            height: 200.0,
            width: 200.0,
            fit: BoxFit.cover
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PLAYLIST',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 12.0, fontFamily: 'Montserrat', color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12.0),
                  Text(playlist.name, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16.0),
                  Text(playlist.description, style: Theme.of(context).textTheme.labelLarge,),
                  const SizedBox(height: 16.0),
                  Text('Created by ${playlist.creator} * ${playlist.songs.length} songs, ${playlist.duration}',
                  style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  
                ],
              )
              )
          ],
        ),
        const SizedBox(height: 20.0,),
              _PlaylistButtons(followers: playlist.followers),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String followers;
  const _PlaylistButtons({super.key, required this.followers});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
        onPressed: (){}, 
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 20.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),
          ),
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 11, 151, 16),
          textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 12.0, letterSpacing: 2.0)
        ),
        child: const Text('PLAY'),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.favorite_border),
        iconSize: 30.0,
        ),
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.more_horiz),
        iconSize: 30.0,
        ),
        const Spacer(),
        Text('FOLLOWER\n$followers', 
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12.0),
        textAlign: TextAlign.right,
        ),
      ],
    );
  }
}