import 'package:just_audio/just_audio.dart';

  class AudioService {
    final player = AudioPlayer();

    //load song
    Future<void> loadSong(String filePath) async {
      await player.setFilePath(filePath);
    }

    //play
    Future<void> play() async {
      await player.play();
    }

    //pause
    Future<void> pause() async {
      await player.pause();
    }

    //stop
    Future<void> stop() async {
      await player.stop();
    }

    //set volume
    Future<void> setVolume(double volume) async {
      await player.setVolume(volume); // 0.0 to 1.0
    }

    //listen to position (useful for slider)
    Stream<Duration> get positionStream => player.positionStream;

    //get total duration of current song
    Duration? get duration => player.duration;

  }
