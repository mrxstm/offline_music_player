
import 'package:flutter/material.dart';
import 'package:offline_music_player/Model/song_model.dart';

class SongProvider extends ChangeNotifier {
  // list of all the songs
  List<Song> songs = [];

  // song currently being played
  Song? currentSong;

  //playing or pause
  bool? isPlaying;

  //repeat
  bool? isRepeat;

  //shuffle
  bool? isShuffle;

  //functions

  void is

}