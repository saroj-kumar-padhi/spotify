
import 'package:chair/musicsearch.dart';
import 'package:chair/services/search_operations.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  Widget createAppBar(
    String message){
  return(AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text(message,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
  actions: [Padding(
    padding: const EdgeInsets.only(right: 12),
  )],
  ));
  }
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
  List<Widget> createListOfCategories()
  { 
   List<Category>  categoryList = SearchOperations.getCategories(); //receive data
   // convert data to widget using map function
   List<Widget> categories = categoryList.map((Category category)=>createCategory(category)).toList();
   return categories;
  }

  @override
  Widget build(BuildContext context) {
  TextEditingController search = TextEditingController();

    return Container(
       decoration: BoxDecoration(
           gradient: LinearGradient(colors: [Colors.blueGrey,Colors.black,],
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
           stops: [0.1,0.3]
           ) 
          ),
          child: ListView(
            children: [Column(
              children: [
                createAppBar(" Search"),
            SizedBox(height:5 ,),
            Container(
               padding: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller:  search,
                decoration: InputDecoration(
                  filled: true,
                    fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),),
                  
                  prefix: IconButton(onPressed: (() {searchArray(search.text);
                    
                  }), icon: Icon(Icons.search)),
                  hintText: "What do you want to listen to?"
                ),
              ),
            ),
            SizedBox(height: 15,),
            Text('Browse all',style: TextStyle(fontSize:25,color: Colors.white60 ,fontWeight: FontWeight.bold),),
            createGrid(),
            SizedBox(height: 1,),
            createGrid(),
              ],
            ),]
          ),);

  }
}