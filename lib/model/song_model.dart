class Song {
  final String id;
  final String title;
  final String? artist;
  final String path;
  final Duration duration;
  final String? thumbnail;
  bool isFavourite;

  //constructor
  Song({
    required this.id,
    required this.title,
    this.artist,
    required this.path,
    required this.duration,
    this.thumbnail,
    this.isFavourite = false
  });

}