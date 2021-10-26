// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'category_chip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoryChipTearOff {
  const _$CategoryChipTearOff();

  _CategoryChip call({required String title, required int category}) {
    return _CategoryChip(
      title: title,
      category: category,
    );
  }
}

/// @nodoc
const $CategoryChip = _$CategoryChipTearOff();

/// @nodoc
mixin _$CategoryChip {
  String get title => throw _privateConstructorUsedError;
  int get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryChipCopyWith<CategoryChip> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryChipCopyWith<$Res> {
  factory $CategoryChipCopyWith(
          CategoryChip value, $Res Function(CategoryChip) then) =
      _$CategoryChipCopyWithImpl<$Res>;
  $Res call({String title, int category});
}

/// @nodoc
class _$CategoryChipCopyWithImpl<$Res> implements $CategoryChipCopyWith<$Res> {
  _$CategoryChipCopyWithImpl(this._value, this._then);

  final CategoryChip _value;
  // ignore: unused_field
  final $Res Function(CategoryChip) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CategoryChipCopyWith<$Res>
    implements $CategoryChipCopyWith<$Res> {
  factory _$CategoryChipCopyWith(
          _CategoryChip value, $Res Function(_CategoryChip) then) =
      __$CategoryChipCopyWithImpl<$Res>;
  @override
  $Res call({String title, int category});
}

/// @nodoc
class __$CategoryChipCopyWithImpl<$Res> extends _$CategoryChipCopyWithImpl<$Res>
    implements _$CategoryChipCopyWith<$Res> {
  __$CategoryChipCopyWithImpl(
      _CategoryChip _value, $Res Function(_CategoryChip) _then)
      : super(_value, (v) => _then(v as _CategoryChip));

  @override
  _CategoryChip get _value => super._value as _CategoryChip;

  @override
  $Res call({
    Object? title = freezed,
    Object? category = freezed,
  }) {
    return _then(_CategoryChip(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CategoryChip extends _CategoryChip with DiagnosticableTreeMixin {
  const _$_CategoryChip({required this.title, required this.category})
      : super._();

  @override
  final String title;
  @override
  final int category;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryChip(title: $title, category: $category)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryChip'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('category', category));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CategoryChip &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(category);

  @JsonKey(ignore: true)
  @override
  _$CategoryChipCopyWith<_CategoryChip> get copyWith =>
      __$CategoryChipCopyWithImpl<_CategoryChip>(this, _$identity);
}

abstract class _CategoryChip extends CategoryChip {
  const factory _CategoryChip({required String title, required int category}) =
      _$_CategoryChip;
  const _CategoryChip._() : super._();

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  int get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CategoryChipCopyWith<_CategoryChip> get copyWith =>
      throw _privateConstructorUsedError;
}
