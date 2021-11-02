import 'package:appbar_custom/item/youtube_video.dart';
import 'package:appbar_custom/view/widget/build_video_list.dart';
import 'package:appbar_custom/view/widget/genre_card.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  static const String id = 'explore_screen';
  @override
  Widget build(BuildContext context) {
    final explores = <GenreCard>[
      const GenreCard('急上昇', Icons.local_fire_department, Colors.red),
      const GenreCard('音楽', Icons.music_note, Colors.amber),
      const GenreCard('ライブ', Icons.settings_input_antenna, Colors.lightGreen),
      const GenreCard('学び', Icons.lightbulb, Colors.green),
      const GenreCard('ゲーム', Icons.sports_esports, Colors.red),
      const GenreCard('ニュース', Icons.feed, Colors.lightBlue),
      const GenreCard('スポーツ', Icons.local_fire_department, Colors.blue),
    ]; 
    
    
    final youtube = VideoList().videos;


    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('探索'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.cast)),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildGenre(explores, size),
            const Divider(),
             BuildVideoList(youtube),
          ],
        ),
      ),
    );
  }

  Widget _buildGenre(List<GenreCard> explores, Size size) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: explores.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: size.width / 4,
          ),
          //  const SliverGridDelegateWithMaxCrossAxisExtent(
          //   maxCrossAxisExtent: 100,
          // ),
          itemBuilder: (BuildContext context, int index) {
            return explores[index];
          }),
    );
  }
}
