import 'package:appbar_custom/item/youtube_video.dart';
import 'package:appbar_custom/view/home_screen.dart';
import 'package:appbar_custom/view/widget/youtube_video_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BuildVideoList extends StatelessWidget {
  const BuildVideoList(
    this.videos, {
    Key? key,
  }) : super(key: key);
  final List<YoutubeVideo> videos;
  @override
  Widget build(BuildContext context) {
    // final youtube = VideoList().videos;
    // final filter = useProvider(filterProvider);
    // final sotedVideo = filter.state != 0
    //     ? youtube.where((element) => element.category == filter.state).toList()
    //     : youtube;

    return Center(
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.spaceEvenly,
        children: videos
            .map((video) => ProviderScope(overrides: [
                  youtubeVideoScopedProvider.overrideWithValue(video),
                ], child: const YoutubeVideoCard()))
            .toList(),
      ),
    );
  }
}
