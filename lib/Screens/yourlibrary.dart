import 'package:flutter/material.dart';

class Yourlibrary extends StatelessWidget {
  const Yourlibrary({super.key});
  Widget createAppBar(
    String message){
      return(AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text(message,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
  actions: [Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Icon(Icons.search),
  )],
  ));
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
       decoration: BoxDecoration(
           gradient: LinearGradient(colors: [Colors.blueGrey,Colors.black,],
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
           stops: [0.1,0.3]
           ) 
          ),
          child:ListView(
            children: [
              Column(
                  children: [
                    createAppBar(" Your library"),
                    
                SizedBox(height:5 ,),
 Padding(
   padding: const EdgeInsets.only(left: 18,right: 10,top: 30),
   child: Row(
     children: [
       TextButton(onPressed:(() {
         
       }) , child: Text("Playlists",style: TextStyle(color: Colors.white),),
       style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0),
       side: BorderSide(color: Colors.white)
       ))),
       ),
       SizedBox(width: 15,),
       TextButton(onPressed:(() {
         
       }) , child: Text("Artists",style: TextStyle(color: Colors.white),),
       style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0),
       side: BorderSide(color: Colors.white)
       ))),
       ),
     ],
   ),
 ),
  Divider(
      thickness: 1,
      color: Color(0xff818181),
    ),
    SizedBox(height: 15,),
    Padding(
      padding: const EdgeInsets.only(right: 200),
      child: Text('Recently played',style: TextStyle(color: Colors.white),),
    ),
    SizedBox(height: 15,),
   Padding(
     padding: const EdgeInsets.only(left: 15),
     child: ListTile(leading: CircleAvatar(radius: 30,backgroundImage: NetworkImage('https://i.pinimg.com/originals/72/79/f8/7279f8857314635e6f8c50e0f60971d0.jpg'),),
     title: Text('Sidhu Moosewala',style: TextStyle(color: Colors.white),),
     subtitle: Text('Artist',style: TextStyle(color: Colors.white),),
     ),

   ),
   SizedBox(height: 10,),
   Padding(
     padding: const EdgeInsets.only(left: 15),
     child: ListTile(leading: CircleAvatar(radius: 30,backgroundImage: AssetImage('lib/assets/nikki.jpeg'),),
     title: Text('Nikki nisha',style: TextStyle(color: Colors.white),),
     subtitle: Text('Singer',style: TextStyle(color: Colors.white),),
     ),

   ),
   SizedBox(height: 10,),
   Padding(
     padding: const EdgeInsets.only(left: 15),
     child: ListTile(leading: CircleAvatar(radius: 30,backgroundImage: AssetImage('lib/assets/hemu.jpeg'),),

     title: Text('Harmanpreet kaur',style: TextStyle(color: Colors.white),),
     subtitle: Text('Artist',style: TextStyle(color: Colors.white),),
     ),

   ),
   SizedBox(height: 10,),
   Padding(
     padding: const EdgeInsets.only(left: 15),
     child: ListTile(leading: CircleAvatar(radius: 30,backgroundImage: AssetImage('lib/assets/armaan.jpeg'),),

     title: Text('Arman Malik',style: TextStyle(color: Colors.white),),
     subtitle: Text('Artist',style: TextStyle(color: Colors.white),),
     ),

   ),
   SizedBox(height: 10,),
   Padding(
     padding: const EdgeInsets.only(left: 15),
     child: ListTile(leading: CircleAvatar(radius: 30,backgroundImage: AssetImage('lib/assets/WhatsApp Image 2022-11-16 at 9.16.36 PM.jpeg'),),

     title: Text('Arijit Singh',style: TextStyle(color: Colors.white),),
     subtitle: Text('Artist',style: TextStyle(color: Colors.white),),
     ),

   ),
   
    
   
    

]
 ),
            ],
          ),
    
  
);
    
 }
}
            