import 'dart:math';

import 'package:appbar_custom/item/youtube_video.dart';
import 'package:appbar_custom/view/widget/build_chip_bar.dart';
import 'package:appbar_custom/view/widget/user_images.dart';
import 'package:appbar_custom/view/widget/youtube_video_view.dart';
import 'package:appbar_custom/view/widget/youtube_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chipIndexProvider = StateProvider((ref) => 0);
final filterProvider = StateProvider((ref) => 0);
// final videoIndexScopedProvider = ScopedProvider<int?>(null);
final youtubeVideoScopedProvider =
    ScopedProvider<YoutubeVideo>((watch) => throw UnimplementedError());

class YoutubeAppbar extends StatelessWidget {
  const YoutubeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).bottomAppBarColor,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              const _YoutubeAppbar(),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
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
                HookBuilder(builder: (context) {
                  final youtube = VideoList().videos;
                  final filter = useProvider(filterProvider);
                  final sotedVideo = filter.state != 0
                      ? youtube
                          .where((element) => element.category == filter.state)
                          .toList()
                      : youtube;

                  return Center(
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.spaceEvenly,
                      children: sotedVideo
                          .map((video) => ProviderScope(overrides: [
                                youtubeVideoScopedProvider
                                    .overrideWithValue(video),
                              ], child: const YouTubeVideoView()))
                          .toList(),
                    ),
                  );
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
                }),
                const SizedBox(
                  height: 2000,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class _YoutubeAppbar extends StatelessWidget {
  const _YoutubeAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const YoutubeLogo(),
      // floating: true,
      // pinned: true,
      // expandedHeight: 200,
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
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
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
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
