import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicccc/Provider/song_provider.dart';
import 'package:musicccc/screen/mini_player.dart';
import 'package:musicccc/tile/song_tile.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //variables
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    //Fetch song only after screen loads
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<SongProvider>(context, listen: false).fetchSongs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/headphone-line.svg',
                    height: 24,
                    width: 24,
                    color: Colors.white70
                  ),
                  SizedBox(width: 10),
                  Text(
                      "GoatedPlayer",
                    style: TextStyle(
                      color: Color.fromARGB(255, 152, 183, 158),
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              thickness: 0.5,
            ),
        ),
      ),

      //Navigation bar
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(

                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 30, 33, 40),
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                    children: [

                      //Songs choice chip
                      ChoiceChip(
                        label: Row(
                          children: [
                            Icon(Icons.queue_music_outlined, color: Colors.white,),
                            SizedBox(width: 10),
                            Text(
                                "Songs",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: 0.2,
                          vertical: 0.2
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        selected: selectedIndex == 0,
                        backgroundColor: Color.fromARGB(255, 30, 33, 40),
                        selectedColor:Color.fromARGB(255, 152, 183, 158),
                        side: BorderSide.none,
                        showCheckmark: false,
                        onSelected: (bool selected) {
                        setState(() {
                          selectedIndex = 0;
                        });
                        },
                      ),

                      //Playlists choice chip
                      ChoiceChip(
                        label: Row(
                          children: [
                            Icon(Icons.list_sharp, color: Colors.white,),
                            SizedBox(width: 10),
                            Text(
                                "Playlists",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),

                          ],
                        ),
                        labelPadding: EdgeInsets.symmetric(
                            horizontal: 0.2,
                            vertical: 0.2
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        selected: selectedIndex == 1,
                        selectedColor:Color.fromARGB(255, 152, 183, 158),
                        backgroundColor: Color.fromARGB(255, 30, 33, 40),
                        side: BorderSide.none,
                        showCheckmark: false,

                        onSelected: (bool selected) {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                      ),

                      //Favourite choice chip
                      ChoiceChip(
                        label: Row(
                          children: [
                            Icon(Icons.favorite_outline, color: Colors.white,),
                            SizedBox(width: 10),
                            Text(
                                "Favourites",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        labelPadding: EdgeInsets.symmetric(
                            horizontal: 0.2,
                            vertical: 0.2
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        selected: selectedIndex == 2,
                        selectedColor:Color.fromARGB(255, 152, 183, 158),
                        backgroundColor: Color.fromARGB(255, 30, 33, 40),
                        side: BorderSide.none,
                        showCheckmark: false,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedIndex = 2;
                          });
                        },
                      )
                    ],
                  ),
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 34),
            child: Consumer<SongProvider>(
                builder: (context, songProvider, child) {
                  return Row(
                    children: [
                      Text(
                        "Your Tracks",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                          "(${songProvider.songs.length} songs)",
                        style: TextStyle(
                          color: Colors.white70
                        ),
                      )
                    ],
                  );
                }
            )
          ),
          Expanded(
            child: Consumer<SongProvider>(
              builder: (context, songProvider, child) {
                // Check if songs list is empty (loading state)
                if (songProvider.songs.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Color.fromARGB(255, 152, 183, 158)),
                        SizedBox(height: 16),
                        Text(
                          "Loading songs...",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  );
                }

                // If songs are loaded, show the list
                return ListView.builder(
                  itemCount: songProvider.songs.length,
                  itemBuilder: (context, index) {
                    return SongTile(song: songProvider.songs[index]);
                  },
                );
              },
            ),
          )
        ],
      ),
      bottomSheet: Consumer<SongProvider>(
          builder: (context, songProvider, child) {
            if(songProvider.currentSong == null) return SizedBox.shrink();
            return MiniPlayer(currentSong: songProvider.currentSong!);
          }
      ),
    );
  }
}
