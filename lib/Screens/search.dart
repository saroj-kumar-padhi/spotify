import 'package:chair/models/music.dart';
import 'package:chair/services/music_operations.dart';
import 'package:chair/services/search_operations.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';

class Search extends StatefulWidget {
  final Function _miniPlayer;
  const Search(this._miniPlayer);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Widget createAppBar(String message) {
    return (AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        message,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12),
        )
      ],
    ));
  }

  Widget createCategory(Category category) {
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(children: [
        Image.network(
          category.imageURL,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            category.name,
            style: const TextStyle(color: Colors.white),
          ),
        )
      ]),
    );
  }

  Widget createGrid() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 280,
      child: GridView.count(
        childAspectRatio: 6 / 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: createListOfCategories(),
      ),
    );
  }

  List<Widget> createListOfCategories() {
    List<Category> categoryList =
        SearchOperations.getCategories(); //receive data
    // convert data to widget using map function
    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList();
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    List<Music> musicList = MusicOperations.getMusic();
    TextEditingController search = TextEditingController();

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.blueGrey,
                Colors.black,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.3])),
      child: ListView(children: [
        Column(
          children: [
            createAppBar(" Search"),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: search,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    prefix: IconButton(
                        onPressed: (() {
                          int find = findIndex(search.text);
                          widget._miniPlayer(musicList[find]);
                          setState(() {});
                        }),
                        icon: const Icon(Icons.search)),
                    hintText: "What do you want to listen to?"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Browse all',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white60,
                  fontWeight: FontWeight.bold),
            ),
            createGrid(),
            const SizedBox(
              height: 1,
            ),
            createGrid(),
          ],
        ),
      ]),
    );
  }
}

int findIndex(String key) {
  int index = -1;

  var arr = [
    '295',
    'No Love',
    'Lovely',
    'Tu kafi hai',
    'Rihaayi',
    'Lele ram ram',
    'Samjhawan',
    'Piya aaye na',
    'Ajj kal ve',
    'Desires',
    'Brown munde',
    'Arcade',
    'Unstoppable',
    'intentions'
  ];
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == key) {
      index = i;
    }
  }
  return index;
}
