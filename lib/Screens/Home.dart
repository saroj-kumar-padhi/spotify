import 'package:chair/models/category.dart';
import 'package:chair/models/music.dart';
import 'package:chair/services/category_operations.dart';
import 'package:chair/services/music_operations.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
 Function _miniPlayer;
  Home(this._miniPlayer);
  //const Home({super.key});
  Widget createCategory(Category category){
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(children: [
        Image.network(category.imageURL,fit: BoxFit.cover,),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(category.name,style: TextStyle(color: Colors.white),),
        )
      ]),
    );
  }
  List<Widget> createListOfCategories()
  { 
   List<Category>  categoryList = CategoryOperations.getCategories(); //receive data
   // convert data to widget using map function
   List<Widget> categories = categoryList.map((Category category)=>createCategory(category)).toList();
   return categories;
  }
  Widget createMusic(Music music){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 200,
            child: InkWell(
              onTap: () {
                _miniPlayer(music,stop:true);
                
              },
              child: Image.network(
                music.image,fit: BoxFit.cover,),
            )),
          Text(music.name,style: TextStyle(color: Colors.white),),
          Text(music.desc,style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
  Widget createMusicList(String label){
    List<Music> musicList = MusicOperations.getMusic();
     return Padding(
       padding: const EdgeInsets.only(left: 10),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          Text(
            label,
          style: TextStyle(
            color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
           Container(
            height: 300,
             child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder:(ctx,index){
             return createMusic(musicList[index]);
             },
             itemCount: musicList.length,
             ),
           ),
         ],
       ),
     );
  }
   Widget createGrid(){
    return Container(
      padding: EdgeInsets.all(10 ),
      height: 280,
      child: GridView.count(
        childAspectRatio:6 / 2 ,
        crossAxisSpacing: 8,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: createListOfCategories(),
      ),
    );
  }
  Widget createAppBar(
    String message){
  return(AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text(message),
  actions: [Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Icon(Icons.settings),
  )],
  ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Column(children: [
          createAppBar(" Nikki & Harman->Good Morning"),
          SizedBox(height:5 ,),
          createGrid(),
          createMusicList('Made for you'),
          createMusicList('Popular Playlist')
          ]),
          decoration: BoxDecoration(
           gradient: LinearGradient(colors: [Colors.blueGrey.shade300,Colors.black,],
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
           stops: [0.1,0.3]
           ) 
          ),
          )
      ),
    );
  }
}

