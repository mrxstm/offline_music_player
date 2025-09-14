
import 'package:flutter/material.dart';
import 'package:musicccc/Model/song_model.dart';
import 'package:musicccc/Service/mp3files_scanner.dart';

class SongProvider extends ChangeNotifier {


  // songs list
  List<Song> songs = [];   //list of all songs
  List<Song> favouriteSongs = []; //list of favourite songs

  // fetching song

  SongScanner songScanner = SongScanner();

  Future<void> fetchSongs() async {
    try {
      final response = await songScanner.scanAllSongs();
      songs = response;
      notifyListeners();
    } catch(e) {
      print("Failed to fetch songs: $e");
    }
  }


  // song currently being played
  Song? currentSong;

  //playing or pause
  bool isPlaying = false;

  //repeat
  bool isRepeat = false;

  //shuffle
  bool isShuffle = false;

  //functions :
  // to play
  void play() {
    isPlaying = true;
    notifyListeners();
  }

  // to pause
  void pause() {
    isPlaying = false;
    notifyListeners();
  }

  // on loop
  void toggleRepeat() {
    isRepeat = !isRepeat;
    notifyListeners();
  }

  // on loop
  void shuffle() {
    isShuffle = !isShuffle;
    notifyListeners();
  }

  // to mark the songs favourite
  void toggleFavourite(Song song) {
    song.isFavourite = !song.isFavourite;

    if(song.isFavourite) {
      favouriteSongs.add(song);
    } else {
      favouriteSongs.remove(song);
    }
    notifyListeners();
  }

  //setting current song
  void setCurrentSong(Song song) {
    currentSong = song;
    isPlaying = true;
    notifyListeners();
  }


}