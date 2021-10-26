import 'package:appbar_custom/item/youtube_video.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_chip.freezed.dart';

// flutter pub run build_runner build
// flutter pub run build_runner build    --delete-conflicting-outputs

@freezed
class CategoryChip with _$CategoryChip {
  const factory CategoryChip({
    required String title,
    required int category,
  }) = _CategoryChip;
  const CategoryChip._();
}

class CategoryChipList {
  final chips = const <CategoryChip>[
    CategoryChip(title: 'ALL', category: VideoCategory.all),
    CategoryChip(title: '音楽', category: VideoCategory.music),
    CategoryChip(title: '映画', category: VideoCategory.movie),
    CategoryChip(title: 'ペット', category: VideoCategory.pet),
    CategoryChip(title: 'ミックス', category: VideoCategory.mix),
  ];
}
