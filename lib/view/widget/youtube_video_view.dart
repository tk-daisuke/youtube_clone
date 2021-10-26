import 'package:appbar_custom/item/youtube_video.dart';
import 'package:appbar_custom/localize/ja_timeago.dart';
import 'package:appbar_custom/view/widget/user_images.dart';
import 'package:appbar_custom/view/youtube.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class YouTubeVideoView extends StatelessWidget {
  const YouTubeVideoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.white,
                ),
                const FlutterLogo(),
              ],
            ),
          ),
          Container(
            height: 60,
            constraints: const BoxConstraints(maxWidth: 400),
            child: Row(
              // mainAxisSize: MainAxisSize.max,
              children: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: UserImages(
                    path: 'assets/user/avatar.jpg',
                  ),
                ),
                Expanded(child: _VideoDetail()),
              ],
            ),
          ),
        ],
      ),
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

    Intl.defaultLocale = 'ja';
    final numberConverter = NumberFormat.compact();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: _buildTitleBar(video),
        )),
        Flexible(child: _buildVideoDetail(video, numberConverter, time)),
      ],
    );
  }

  Widget _buildTitleBar(YoutubeVideo video) {
    return Row(
      children: [
        Expanded(
          child: Text(
            video.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16),
          ),
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

  Widget _buildVideoDetail(
      YoutubeVideo video, NumberFormat numberConverter, String time) {
    return Text(
      video.userName + '・ ${numberConverter.format(video.view)}回視聴' + '・ $time',
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: 12,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
