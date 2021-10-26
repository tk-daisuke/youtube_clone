import 'package:appbar_custom/localize/ja_timeago.dart';
import 'package:appbar_custom/view/widget/user_images.dart';
import 'package:appbar_custom/view/youtube.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class YouTubeVideoView extends StatelessWidget {
  const YouTubeVideoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.white,
              ),
              const FlutterLogo(
                size: 50,
              ),
            ],
          ),
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: UserImages(
                path: 'assets/user/avatar.jpg',
              ),
            ),
            Flexible(child: _VideoDetail()),
          ],
        ),
      ],
    );
  }
}

class _VideoDetail extends HookWidget {
  const _VideoDetail({
    Key? key,
  }) : super(key: key);
  String getContract({
    required DateTime startTime,
  }) {
    final now = DateTime.now();
    final difference = now.difference(startTime).inDays;
    timeago.setLocaleMessages('ja', JaCustomMessages());
    final fifteenAgo = now.subtract(Duration(days: difference));
    return timeago.format(fifteenAgo, locale: 'ja');
  }

  @override
  Widget build(BuildContext context) {
    final video = useProvider(youtubeVideoScopedProvider);
    final time = getContract(startTime: video.createdAt);

    return Column(
      children: [
        _Title(
          title: video.title,
        ),
        _Detail(
          channel: video.userName,
          time: time,
          view: video.view,
        ),
      ],
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail({
    Key? key,
    required this.channel,
    required this.view,
    required this.time,
  }) : super(key: key);
  final String channel;
  final int view;
  final String time;

  @override
  Widget build(BuildContext context) {
    // final datetime = getContract(startTime: time);
    return DefaultTextStyle(
      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
      child: Row(
        children: [
          Text(
            channel,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '・$view回視聴',
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '・$time',
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16),
        ),
        MaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          height: 17,
          // padding: const EdgeInsets.all(0),
          minWidth: 0,
          onPressed: () {},
          // color: Colors.blue,
          // textColor: Colors.white,
          child: const Icon(
            Icons.more_vert,
            size: 17,
          ),
          // padding: const EdgeInsets.all(16),
          shape: const CircleBorder(),
        ),
      ],
    );
  }
}
