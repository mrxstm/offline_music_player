class Song {
  final String id;
  final String title;
  final String? artist;
  final String path;
  final String duration;
  final bool isFavourite;

  //constructor
  const Song({
    required this.id,
    required this.title,
    this.artist,
    required this.path,
    required this.duration,
    required this.isFavourite
  });

}