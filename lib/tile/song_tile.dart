import 'dart:io';
import 'package:flutter/material.dart';
import 'package:musicccc/Provider/song_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import '../Model/song_model.dart';

class SongTile extends StatefulWidget {
  final Song song;
  const SongTile({super.key, required this.song});


  @override
  State<SongTile> createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 30, 33, 40)
      ),

      child: ListTile(
         leading: QueryArtworkWidget(
             id: int.parse(widget.song.id),
             type: ArtworkType.AUDIO,
           nullArtworkWidget: const Icon(Icons.music_note, color: Colors.white, size: 34),
           artworkBorder: BorderRadius.circular(12),
           artworkFit: BoxFit.cover,
           artworkHeight: 50,
           artworkWidth: 50,
         ),
        title: Text(
            widget.song.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
            widget.song.artist?? "Unknown Artist",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.more_vert,color: Colors.white70,),
        onTap: () {
           Provider.of<SongProvider>(context, listen : false).setCurrentSong(widget.song);
        },
      ),
    );
  }
}
