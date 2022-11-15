import 'package:chair/models/category.dart';

class CategoryOperations{
  CategoryOperations._() {}
 static  List<Category> getCategories(){
    return <Category>
    [
    Category('Top Songs', 'https://is4-ssl.mzstatic.com/image/thumb/Purple122/v4/ce/e3/72/cee3725b-1d68-eb88-93e5-528f5a00ebec/source/256x256bb.jpg'),
    Category('Arijit songs', 'https://pbs.twimg.com/profile_images/795243556621336576/gbbQ-AUt_400x400.jpg'),
    Category('Arman', 'https://www.orissapost.com/wp-content/uploads/2020/08/Armaan-Malik-Pinterest-640x430-1.jpg'),
    Category('Fateh ', 'https://bestoftheyear.in/wp-content/uploads/2017/10/rahat-fateh-ali-khan-songs.jpg'),
    Category('Neha kakkar', 'https://i.ytimg.com/vi/yjRZwHMybsE/sddefault.jpg'),
    Category('Tulsi kumar', 'https://i.pinimg.com/236x/b2/61/f1/b261f18d0fc4872e9177daf93a9d25c9.jpg'),

    
    




  ];
}
}