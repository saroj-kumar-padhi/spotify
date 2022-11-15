import 'package:chair/models/music.dart';

class MusicOperations{
  MusicOperations._() {}
  static List<Music> getMusic() {
    return <Music>[
      Music(
        '295',
        'https://images.tv9hindi.com/wp-content/uploads/2022/05/sidhu-moosewala-2.jpg',
        'Sach bolega ta milu 295',
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/0b/b8/5f/0bb85f4f-5ce0-8777-1509-c550fc3b6bbe/mzaf_1802557619067239120.plus.aac.p.m4a',
      ),
      Music(
        'No Love',
        'https://i.scdn.co/image/ab67616d0000b2732a46046339bd779f95a8cf8b',
        'Ehda ni chlde pyar',
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/ce/d5/f5/ced5f5a3-0d78-6262-a00b-acf4c48bd231/mzaf_314082565532823013.plus.aac.p.m4a',
      ),
      Music(
        'Lovely',
        'https://pics.filmaffinity.com/Billie_Eilish_feat_Khalid_Lovely_Music_Video-730519693-large.jpg',
        'Lovely all alone',
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/92/e9/94/92e9949d-7d6f-5ff8-a586-8d6cde186aaa/mzaf_7346702548563727816.plus.aac.p.m4a',
      ),
      Music(
        'Tu kafi hai',
        'https://c.saavncdn.com/884/Tu-Kaafi-Hai-feat-Avanti-Nagral--English-2021-20210616163141-500x500.jpg',
        'Tere liye tu kafi hai',
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/b9/49/f0/b949f037-3077-9760-90b2-659fed0e200b/mzaf_15305122710502736.plus.aac.p.m4a',
      ),
    ];
  }
}