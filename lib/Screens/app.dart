import 'package:audioplayers/audioplayers.dart';
import 'package:chair/Screens/Home.dart';
import 'package:chair/Screens/search.dart';
import 'package:chair/Screens/yourlibrary.dart';
import 'package:chair/models/music.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  var Tabs = [];
  int currentTabIndex = 0;
  bool isPlaying = false;
  Music? music;
  Widget miniPlayer(Music? music, {bool stop = false}) {
    this.music = music;

    if (music == null) {
      return const SizedBox();
    }
    if (stop) {
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {});
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.blueGrey,
      width: deviceSize.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(music.image, fit: BoxFit.cover),
          Text(
            music.name,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          IconButton(
              onPressed: () async {
                isPlaying = !isPlaying;
                if (isPlaying) {
                  await _audioPlayer.play(music.audioURL);
                } else {
                  await _audioPlayer.pause();
                }
                setState(() {});
              },
              icon: isPlaying
                  ? const Icon(Icons.pause, color: Colors.white)
                  : const Icon(Icons.play_arrow, color: Colors.white))
        ],
      ),
    );
  }

  @override
  initState() {
    super.initState();
    Tabs = [Home(miniPlayer), Search(miniPlayer), const Yourlibrary()];
  }

  // UI Design Code Goes inside Build
  @override
  Widget build(BuildContext context) {
    print("Lets Build it");
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music),
          BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: (currentIndex) {
              print("Current Index is $currentIndex");
              currentTabIndex = currentIndex;
              setState(() {}); // re-render
            },
            selectedLabelStyle: const TextStyle(color: Colors.white),
            selectedItemColor: Colors.white,
            backgroundColor: Colors.black45,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.white),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books, color: Colors.white),
                  label: 'Your Library')
            ],
          )
        ],
      ),
    );
  }
}
