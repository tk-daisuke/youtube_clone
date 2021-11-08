import 'dart:math';

import 'package:appbar_custom/item/youtube_video.dart';
import 'package:appbar_custom/view/widget/bottom_sheet_button.dart';
import 'package:appbar_custom/view/widget/build_chip_bar.dart';
import 'package:appbar_custom/view/widget/build_video_list.dart';
import 'package:appbar_custom/view/widget/user_images.dart';
import 'package:appbar_custom/view/widget/video_add_dialog.dart';
import 'package:appbar_custom/view/widget/youtube_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chipIndexProvider = StateProvider((ref) => 0);
final filterProvider = StateProvider((ref) => 0);
// final videoIndexScopedProvider = ScopedProvider<int?>(null);
final youtubeVideoScopedProvider =
    Provider<YoutubeVideo>((watch) => throw UnimplementedError());

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Theme.of(context).bottomAppBarColor,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              const YoutubeAppbar(),
              SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                  minHeight: 50,
                  maxHeight: 50,
                  child: buildChipBar(),
                ),
                pinned: false,
              ),
            ];
          },
          body: Scaffold(
            // appBar: _buildChipBar(chipTitles),
            body: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: size.height / 40,
                ),
                Consumer(builder: (context, ref, child) {
                  final youtube = VideoList().videos;
                  final filter = ref.watch(filterProvider.state);
                  final sotedVideo = filter.state != 0
                      ? youtube
                          .where((element) => element.category == filter.state)
                          .toList()
                      : youtube;

                  return BuildVideoList(sotedVideo);
                }),
                const SizedBox(
                  height: 200,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

// return ListView.builder(
//   primary: false,
//   shrinkWrap: true,
//   itemCount: sotedVideo.length,
//   itemBuilder: (BuildContext context, int index) {
//     final video = sotedVideo[index];
//     return ProviderScope(overrides: [
//       // videoIndexScopedProvider.overrideWithValue(index),
//       youtubeVideoScopedProvider.overrideWithValue(video),
//     ], child: const YouTubeVideoView());
//   },
// );
class YoutubeAppbar extends StatelessWidget {
  const YoutubeAppbar({
    this.flexibleSpace,
    Key? key,
  }) : super(key: key);
  final Widget? flexibleSpace;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const YoutubeLogo(),
      expandedHeight: flexibleSpace != null ? 130.0 : 0,
      flexibleSpace: flexibleSpace,
      // floating: true,
      // pinned: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.cast),
          onPressed: () {
            final buttons = [
              bottomSheetButton(Icons.airplay, 'AirPlay&Bluetooth devices'),
              bottomSheetButton(Icons.live_tv, 'テレビコードでリンク'),
              bottomSheetButton(Icons.settings_input_antenna, '詳細'),
              const Divider(
                thickness: 2,
              ),
              bottomSheetButton(Icons.close, 'キャンセル',
                  onPress: () => Navigator.of(context).pop()),
            ];
            showBottomSheetDialog(
              context,
              titleBar: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'デバイスに接続',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              items: buttons,
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        MaterialButton(
          // padding: const EdgeInsets.all(0),
          minWidth: 0,
          onPressed: () {},
          child: const UserImages(
            path: 'assets/user/avatar.jpg',
          ),
          shape: const CircleBorder(),
        ),
      ],
    );
  }
}

// Container(
//   color: Theme.of(context).primaryColor,
//   child: SafeArea(
//     child:
//     NestedScrollView(
//         headerSliverBuilder: (context, value) {
//           return [
//             const SliverAppBar(
//               title: Text('data'),
//             ),
//             // _FilterBar(),
//           ];
//         },
//         body: Scaffold(appBar: _buildChipBar(chipTitles))),
//   ),
// )
// 1

// ???
class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  // 2
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  // 3
  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
