import 'package:audioplayers/audioplayers.dart';
import 'package:chair/Screens/Home.dart';
import 'package:chair/Screens/search.dart';
import 'package:chair/Screens/yourlibrary.dart';
import 'package:chair/models/music.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer _audioPlayer=new AudioPlayer();
  var Tabs =[];
  int currenttabindex = 0;
  bool isPlaying=false;
Music? music;
 Widget miniPlayer(Music? music,{bool stop=false}){
  this.music=music;
  
  if(music==null) {
    return SizedBox();
  }
  if(stop){
    isPlaying=false;
    _audioPlayer.stop();
  }
  setState(() {
    
  });
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(duration: const Duration(milliseconds: 500),
    color: Colors.blueGrey,
    width: deviceSize.width,
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(music.image,
        fit: BoxFit.cover,),
        Text(music.name,
        style: TextStyle(color: Colors.white,fontSize: 20),),
        IconButton(onPressed: ()async{
          isPlaying = !isPlaying;
          if(isPlaying){
          await _audioPlayer.play(music.audioURL);

          }
          else{
            await _audioPlayer.pause();
          }
          setState(() {
            
          });
        }, icon: isPlaying? Icon(Icons.pause,color: Colors.white,) : Icon(Icons.play_arrow,color: Colors.white,)) 
      ],
    ),);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tabs=[Home(miniPlayer),Search(),Yourlibrary()];
  }

  @override
  Widget build(BuildContext context) {
    print('lets build it');
    return Scaffold(
      body: Tabs[currenttabindex],
      backgroundColor: Colors.black ,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music),
          BottomNavigationBar(
            onTap: (currenttabindex){
              
              print('current Index is $currenttabindex');
              currentIndex: currenttabindex;
              setState(() {
                
              });
              
            },
            selectedLabelStyle: TextStyle(color: Colors.white),
            selectedItemColor: Colors.white,
            backgroundColor: Colors.black45,
            items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.white,),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books,color: Colors.white,),label: 'Your library'),

          ],
          ),
        ],
      ),
    );
  }
}

