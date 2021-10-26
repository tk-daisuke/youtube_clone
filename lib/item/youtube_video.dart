import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_video.freezed.dart';

// flutter pub run build_runner build
// flutter pub run build_runner build    --delete-conflicting-outputs

@freezed
class YoutubeVideo with _$YoutubeVideo {
  const factory YoutubeVideo({
    required int id,
    required String userName,
    required String title,
    required int view,
    required DateTime createdAt,
    required int good,
    required int bad,
    required int category,
  }) = _YoutubeVideo;
  const YoutubeVideo._();
}

class VideoList {
  final videos = <YoutubeVideo>[
    YoutubeVideo(
        id: 0,
        userName: 'FlutterUser',
        title: '劇場版00',
        view: 4124,
        createdAt: DateTime(2017, 10, 3, 17, 30),
        good: 1,
        bad: 0,
        category: VideoCategory.movie),
    YoutubeVideo(
        id: 1,
        userName: 'Flutter2',
        title: 'J-Pop',
        view: 65434,
        createdAt: DateTime(2021, 5, 15, 17, 30),
        good: 63241,
        bad: 326,
        category: VideoCategory.mix),
    YoutubeVideo(
        id: 2,
        userName: 'FlutterB',
        title: 'サントラ',
        view: 12355,
        createdAt: DateTime(2011, 10, 3, 17, 30),
        good: 2,
        bad: 0,
        category: VideoCategory.music),
    YoutubeVideo(
        id: 3,
        userName: 'cat',
        title: 'ねこ',
        view: 999484,
        createdAt: DateTime(2020, 1, 1, 1, 1),
        good: 1111111,
        bad: 0,
        category: VideoCategory.pet),
    YoutubeVideo(
        id: 4,
        userName: 'FlutterUser',
        title: '劇場版 Flutter',
        view: 953498,
        createdAt: DateTime(2016, 7, 7, 7, 30),
        good: 1,
        bad: 0,
        category: VideoCategory.movie),
    YoutubeVideo(
        id: 5,
        userName: '54y3',
        title: '野球',
        view: 2324,
        createdAt: DateTime(2019, 12, 3, 12, 30),
        good: 221,
        bad: 0,
        category: VideoCategory.sport),
  ];
}

class VideoCategory {
  static const int all = 0;
  static const int music = 1;
  static const int movie = 2;
  static const int pet = 3;
  static const int mix = 4;
  static const int sport = 5;
}
