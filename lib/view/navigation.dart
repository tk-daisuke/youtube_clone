import 'package:appbar_custom/view/home_screen.dart';
import 'package:appbar_custom/view/explore_screen.dart';
import 'package:appbar_custom/view/widget/bottom_sheet_button.dart';
import 'package:appbar_custom/view/widget/video_add_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomIndex = StateProvider<int>((ref) => 0);

class Navigation extends HookWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _index = useProvider(bottomIndex);
    const pageWidgets = [
      HomeScreen(),
      ExploreScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
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
          icon: Icon(Icons.explore_outlined),
          activeIcon: Icon(Icons.explore),
          label: '探索',
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
        } else if (selectIndex == 2) {
          final buttons = [
            bottomSheetButton(Icons.upload, '動画のアップロード'),
            bottomSheetButton(Icons.live_tv, 'ショート動画を作成'),
            bottomSheetButton(Icons.settings_input_antenna, 'ライブ配信を開始'),
          ];
          showBottomSheetDialog(
            context,
            items: buttons,
            titleBar: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '作成',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
