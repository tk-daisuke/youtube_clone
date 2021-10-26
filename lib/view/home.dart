import 'package:appbar_custom/view/youtube.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomIndex = StateProvider<int>((ref) => 0);

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _index = useProvider(bottomIndex);
    const pageWidgets = [
      YoutubeAppbar(),
      YoutubeAppbar(),
      YoutubeAppbar(),
      YoutubeAppbar(),
      YoutubeAppbar(),
    ];
    return Scaffold(
      bottomNavigationBar: const BottomNavigationItems(),
      body: pageWidgets.elementAt(_index.state),
    );
  }
}

class BottomNavigationItems extends HookWidget {
  const BottomNavigationItems({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _index = useProvider(bottomIndex);

    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie_outlined),
          activeIcon: Icon(Icons.movie),
          label: 'ショート',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle_outline,
            size: 38,
          ),
          activeIcon: Icon(
            Icons.add_circle,
            size: 38,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.subscriptions_outlined),
          activeIcon: Icon(Icons.subscriptions),
          label: '登録チャンネル',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library_outlined),
          activeIcon: Icon(Icons.video_library),
          label: 'ライブラリ',
        ),
      ],
      currentIndex: _index.state,
      onTap: (selectIndex) async {
        if (selectIndex != 2) {
          _index.state = selectIndex;
        }
      },
    );
  }
}
