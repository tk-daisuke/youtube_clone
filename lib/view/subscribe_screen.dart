import 'package:appbar_custom/item/youtube_video.dart';
import 'package:appbar_custom/view/home_screen.dart';
import 'package:appbar_custom/view/widget/build_chip_bar.dart';
import 'package:appbar_custom/view/widget/build_video_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final channelFilterProvider = StateProvider((ref) => '');

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({Key? key}) : super(key: key);
  static const String id = 'subscribe_screen';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final youtube = VideoList().videos.map((e) => e.userName).toList();

    final widgelist = youtube.toSet().map((e) {
      return Consumer(builder: (context, ref, child) {
        var filter = ref.watch(channelFilterProvider.state);
        final isSelect = filter.state == e;
        final noSelect = filter.state == '';
        return InkWell(
          onTap: () {
            if (isSelect) {
              filter.state = '';
            } else {
              filter.state = e;
            }
          },
          child: _ChannelFilter(
            noSelect: noSelect,
            isSelect: isSelect,
            child: SizedBox(
              width: 60,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    foregroundImage: AssetImage('assets/user/avatar.jpg'),
                  ),
                  Text(
                    e,
                    textScaleFactor: 1,
                    style: const TextStyle(fontSize: 9),
                  )
                ],
              ),
            ),
          ),
        );
      });
    }).toList();
    return Container(
      color: Theme.of(context).bottomAppBarColor,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              YoutubeAppbar(
                flexibleSpace: FlexibleSpaceBar(
                  // titlePadding: const EdgeInsets.only(bottom: 8.0),
                  collapseMode: CollapseMode.parallax,
                  // centerTitle: true,
                  background: Container(
                    margin: const EdgeInsets.only(top: 60),
                    // padding: EdgeInsets.only(left: 32.0, right: 32.0),
                    child: Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: widgelist,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                  final filter = ref.watch(channelFilterProvider.state);
                  final List<YoutubeVideo> sotedVideo;
                  if (filter.state != '') {
                    sotedVideo = youtube
                        .where((element) => element.userName == filter.state)
                        .toList();
                  } else {
                    sotedVideo = youtube;
                  }
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

class _ChannelFilter extends StatelessWidget {
  const _ChannelFilter(
      {Key? key,
      required this.noSelect,
      required this.child,
      required this.isSelect})
      : super(key: key);
  final bool noSelect;
  final bool isSelect;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return noSelect
        ? SizedBox(
            child: child,
          )
        : ColorFiltered(
            colorFilter: ColorFilter.mode(
                isSelect ? Colors.blue.withOpacity(0) : Colors.grey,
                isSelect ? BlendMode.colorDodge : BlendMode.modulate

                // isSelect ? Colors.blue.withOpacity(0.2) : Colors.grey,
                // isSelect ? BlendMode.colorDodge : BlendMode.modulate,
                ),
            child: child,
          );
  }
}
