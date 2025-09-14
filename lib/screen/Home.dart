import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //variables
  int selectedIndex = 0;

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
              child: Text(
                  "GoatedPlayer",
                style: TextStyle(
                  color: Color.fromARGB(255, 152, 183, 158),
                  fontWeight: FontWeight.bold
                ),
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
                        selected: selectedIndex == 3,
                        selectedColor:Color.fromARGB(255, 152, 183, 158),
                        backgroundColor: Color.fromARGB(255, 30, 33, 40),
                        side: BorderSide.none,
                        showCheckmark: false,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedIndex = 3;
                          });
                        },
                      )
                    ],
                  ),
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 34),
            child: Text(
              "Your Tracks",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
