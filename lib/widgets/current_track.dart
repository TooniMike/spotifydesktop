import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifydesktop/models/current_track.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          const _TrackInfo(),
          const Spacer(),
          const _PlayerControls(),
          const Spacer(),
          if(MediaQuery.of(context).size.width > 800)
          const _MoreControls(),
        ],
      ),
      ),
    );
  }
}


class _TrackInfo extends StatelessWidget {
  const _TrackInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if(selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset('assets/lofigirl.jpg', 
        height: 60.0,
        width: 60.0,
        fit: BoxFit.cover,
        ),
        const SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(selected.title, style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4.0),
            Text(selected.artist, style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.grey[300],
            fontSize: 12.0,
            ),
            )
        ],
        ),
        const SizedBox(width: 12.0),
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.favorite_border),
          ),
      ],
    );
  }
}


class _PlayerControls extends StatelessWidget {
  const _PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(children: [
          IconButton(
            padding: const EdgeInsets.only(),
            iconSize: 20.0,
            onPressed: (){}, 
            icon: const Icon(Icons.shuffle),
            ),
            IconButton(
            padding: const EdgeInsets.only(),
            iconSize: 20.0,
            onPressed: (){}, 
            icon: const Icon(Icons.skip_previous_outlined),
            ),
            IconButton(
            padding: const EdgeInsets.only(),
            iconSize: 34.0,
            onPressed: (){}, 
            icon: const Icon(Icons.play_circle_fill_outlined),
            ),
            IconButton(
            padding: const EdgeInsets.only(),
            iconSize: 20.0,
            onPressed: (){}, 
            icon: const Icon(Icons.skip_next_outlined),
            ),
            IconButton(
            padding: const EdgeInsets.only(),
            iconSize: 20.0,
            onPressed: (){}, 
            icon: const Icon(Icons.repeat),
            ),
        ],
        ),
        const SizedBox(height: 4.0,),
        Row(
          children: [
            Text('0:00', style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(width: 4.0,),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5)
              ),
            ),
            const SizedBox(width: 8.0),
            Text(selected?.duration ?? '0:00', 
            style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        )
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
        onPressed: (){}, 
        icon: const Icon(Icons.devices_outlined),
        iconSize: 20.0,
        ),
        Row(
          children: [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.volume_up_outlined),
            ),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            )
          ],
        ),
        IconButton(onPressed: (){}, 
        icon: const Icon(Icons.fullscreen_exit_outlined),
        ),
      ],
    );
  }
}