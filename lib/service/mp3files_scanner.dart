
import 'package:musicccc/Model/song_model.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongScanner {

  final OnAudioQuery _audioQuery = OnAudioQuery();

  Future<List<Song>> scanAllSongs() async {
    try {

      // permission should be taken from the user to access the storage to scan audio
      bool permissionStatus = await _audioQuery.permissionsRequest();

      // if permission is denied then it will return empty list
      if(!permissionStatus) return [];

      // if permission is granted :
      final deviceSongs = await _audioQuery.querySongs(); // all the songs stored in deviceSongs variable
      print("Scan completed. Found ${deviceSongs.length} songs.");

      /*
      Now we have to map our own model (SongModel) with the model from on_audio_query package
      */
      return deviceSongs.map(
              (s) => Song(
              id: s.id.toString(),
              title: s.title.toString(),
              artist: s.artist ?? "Unknown Artist",
              path: s.data,
              duration: Duration(milliseconds: s.duration?? 0),
              thumbnail: s.uri?.toString(),
              )
      ).toList();
    } catch(e) {
      print("Scan failed: $e");
      return [];
    }
  }
}