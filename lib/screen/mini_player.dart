import 'package:flutter/material.dart';
import 'package:musicccc/Provider/song_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

import '../Model/song_model.dart';

class MiniPlayer extends StatefulWidget {
  final Song currentSong;
  const MiniPlayer({super.key, required this.currentSong});


  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  //methods

  //play pause
  void togglePlayPause() {
    Provider.of<SongProvider>(context, listen: false).isPlaying
    //if already playing then pause
        ? Provider.of<SongProvider>(context, listen: false).pause()
    // if not then play
        : Provider.of<SongProvider>(context, listen: false).play();
  }

  //open full player
  void openFullPlayer() {
    print("For later opening full player widget (dragable from the bottom)");
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      color: Color.fromARGB(255, 152, 183, 158),
      height: 70,
      child: ListTile(
        leading: QueryArtworkWidget(
            id: int.parse(widget.currentSong.id),
            type: ArtworkType.AUDIO,
          nullArtworkWidget: Icon(Icons.music_note, color: Colors.white, size: 34,),
          artworkBorder: BorderRadius.circular(12),
          artworkFit: BoxFit.cover,
          artworkHeight: 50,
          artworkWidth: 50,
        ),
        title: Text(
          widget.currentSong.title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          widget.currentSong.artist ?? "Unknown Artist",
          style: TextStyle(
            color: Color.fromARGB(255, 50, 57, 57)
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Consumer<SongProvider>(
            builder: (context, songProvider, child) {
              return IconButton(
                  onPressed: () => togglePlayPause(),
                  icon: Icon(
                    songProvider.isPlaying ? Icons.pause_outlined : Icons.play_arrow_outlined,
                    color: Colors.black,
                    size: 28,
                  )
              );
            }
        ),
        onTap: ()=> openFullPlayer(),
      ),
    );
  }
}
