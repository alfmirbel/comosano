// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TargetPoints {
  Map<String, int> get slotsPerCategory;

  /// Create a copy of TargetPoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TargetPointsCopyWith<TargetPoints> get copyWith =>
      _$TargetPointsCopyWithImpl<TargetPoints>(
          this as TargetPoints, _$identity);

  /// Serializes this TargetPoints to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TargetPoints &&
            const DeepCollectionEquality()
                .equals(other.slotsPerCategory, slotsPerCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(slotsPerCategory));

  @override
  String toString() {
    return 'TargetPoints(slotsPerCategory: $slotsPerCategory)';
  }
}

/// @nodoc
abstract mixin class $TargetPointsCopyWith<$Res> {
  factory $TargetPointsCopyWith(
          TargetPoints value, $Res Function(TargetPoints) _then) =
      _$TargetPointsCopyWithImpl;
  @useResult
  $Res call({Map<String, int> slotsPerCategory});
}

/// @nodoc
class _$TargetPointsCopyWithImpl<$Res> implements $TargetPointsCopyWith<$Res> {
  _$TargetPointsCopyWithImpl(this._self, this._then);

  final TargetPoints _self;
  final $Res Function(TargetPoints) _then;

  /// Create a copy of TargetPoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slotsPerCategory = null,
  }) {
    return _then(_self.copyWith(
      slotsPerCategory: null == slotsPerCategory
          ? _self.slotsPerCategory
          : slotsPerCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// Adds pattern-matching-related methods to [TargetPoints].
extension TargetPointsPatterns on TargetPoints {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TargetPoints value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TargetPoints() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TargetPoints value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TargetPoints():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TargetPoints value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TargetPoints() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<String, int> slotsPerCategory)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TargetPoints() when $default != null:
        return $default(_that.slotsPerCategory);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<String, int> slotsPerCategory) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TargetPoints():
        return $default(_that.slotsPerCategory);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<String, int> slotsPerCategory)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TargetPoints() when $default != null:
        return $default(_that.slotsPerCategory);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TargetPoints extends TargetPoints {
  const _TargetPoints(
      {final Map<String, int> slotsPerCategory = const <String, int>{}})
      : _slotsPerCategory = slotsPerCategory,
        super._();
  factory _TargetPoints.fromJson(Map<String, dynamic> json) =>
      _$TargetPointsFromJson(json);

  final Map<String, int> _slotsPerCategory;
  @override
  @JsonKey()
  Map<String, int> get slotsPerCategory {
    if (_slotsPerCategory is EqualUnmodifiableMapView) return _slotsPerCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_slotsPerCategory);
  }

  /// Create a copy of TargetPoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TargetPointsCopyWith<_TargetPoints> get copyWith =>
      __$TargetPointsCopyWithImpl<_TargetPoints>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TargetPointsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TargetPoints &&
            const DeepCollectionEquality()
                .equals(other._slotsPerCategory, _slotsPerCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_slotsPerCategory));

  @override
  String toString() {
    return 'TargetPoints(slotsPerCategory: $slotsPerCategory)';
  }
}

/// @nodoc
abstract mixin class _$TargetPointsCopyWith<$Res>
    implements $TargetPointsCopyWith<$Res> {
  factory _$TargetPointsCopyWith(
          _TargetPoints value, $Res Function(_TargetPoints) _then) =
      __$TargetPointsCopyWithImpl;
  @override
  @useResult
  $Res call({Map<String, int> slotsPerCategory});
}

/// @nodoc
class __$TargetPointsCopyWithImpl<$Res>
    implements _$TargetPointsCopyWith<$Res> {
  __$TargetPointsCopyWithImpl(this._self, this._then);

  final _TargetPoints _self;
  final $Res Function(_TargetPoints) _then;

  /// Create a copy of TargetPoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? slotsPerCategory = null,
  }) {
    return _then(_TargetPoints(
      slotsPerCategory: null == slotsPerCategory
          ? _self._slotsPerCategory
          : slotsPerCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
mixin _$FoodEntry {
  String get id;
  String get name;
  String get category;
  Map<String, int> get colorPoints;
  bool get isFree;
  DateTime get timestamp;

  /// Create a copy of FoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FoodEntryCopyWith<FoodEntry> get copyWith =>
      _$FoodEntryCopyWithImpl<FoodEntry>(this as FoodEntry, _$identity);

  /// Serializes this FoodEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodEntry &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other.colorPoints, colorPoints) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, category,
      const DeepCollectionEquality().hash(colorPoints), isFree, timestamp);

  @override
  String toString() {
    return 'FoodEntry(id: $id, name: $name, category: $category, colorPoints: $colorPoints, isFree: $isFree, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $FoodEntryCopyWith<$Res> {
  factory $FoodEntryCopyWith(FoodEntry value, $Res Function(FoodEntry) _then) =
      _$FoodEntryCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String category,
      Map<String, int> colorPoints,
      bool isFree,
      DateTime timestamp});
}

/// @nodoc
class _$FoodEntryCopyWithImpl<$Res> implements $FoodEntryCopyWith<$Res> {
  _$FoodEntryCopyWithImpl(this._self, this._then);

  final FoodEntry _self;
  final $Res Function(FoodEntry) _then;

  /// Create a copy of FoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? colorPoints = null,
    Object? isFree = null,
    Object? timestamp = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      colorPoints: null == colorPoints
          ? _self.colorPoints
          : colorPoints // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      isFree: null == isFree
          ? _self.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [FoodEntry].
extension FoodEntryPatterns on FoodEntry {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FoodEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FoodEntry() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FoodEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FoodEntry():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FoodEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FoodEntry() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, String category,
            Map<String, int> colorPoints, bool isFree, DateTime timestamp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FoodEntry() when $default != null:
        return $default(_that.id, _that.name, _that.category, _that.colorPoints,
            _that.isFree, _that.timestamp);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String category,
            Map<String, int> colorPoints, bool isFree, DateTime timestamp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FoodEntry():
        return $default(_that.id, _that.name, _that.category, _that.colorPoints,
            _that.isFree, _that.timestamp);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, String category,
            Map<String, int> colorPoints, bool isFree, DateTime timestamp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FoodEntry() when $default != null:
        return $default(_that.id, _that.name, _that.category, _that.colorPoints,
            _that.isFree, _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FoodEntry extends FoodEntry {
  const _FoodEntry(
      {required this.id,
      required this.name,
      required this.category,
      required final Map<String, int> colorPoints,
      this.isFree = false,
      required this.timestamp})
      : _colorPoints = colorPoints,
        super._();
  factory _FoodEntry.fromJson(Map<String, dynamic> json) =>
      _$FoodEntryFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String category;
  final Map<String, int> _colorPoints;
  @override
  Map<String, int> get colorPoints {
    if (_colorPoints is EqualUnmodifiableMapView) return _colorPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_colorPoints);
  }

  @override
  @JsonKey()
  final bool isFree;
  @override
  final DateTime timestamp;

  /// Create a copy of FoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FoodEntryCopyWith<_FoodEntry> get copyWith =>
      __$FoodEntryCopyWithImpl<_FoodEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FoodEntryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodEntry &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._colorPoints, _colorPoints) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, category,
      const DeepCollectionEquality().hash(_colorPoints), isFree, timestamp);

  @override
  String toString() {
    return 'FoodEntry(id: $id, name: $name, category: $category, colorPoints: $colorPoints, isFree: $isFree, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$FoodEntryCopyWith<$Res>
    implements $FoodEntryCopyWith<$Res> {
  factory _$FoodEntryCopyWith(
          _FoodEntry value, $Res Function(_FoodEntry) _then) =
      __$FoodEntryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String category,
      Map<String, int> colorPoints,
      bool isFree,
      DateTime timestamp});
}

/// @nodoc
class __$FoodEntryCopyWithImpl<$Res> implements _$FoodEntryCopyWith<$Res> {
  __$FoodEntryCopyWithImpl(this._self, this._then);

  final _FoodEntry _self;
  final $Res Function(_FoodEntry) _then;

  /// Create a copy of FoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? colorPoints = null,
    Object? isFree = null,
    Object? timestamp = null,
  }) {
    return _then(_FoodEntry(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      colorPoints: null == colorPoints
          ? _self._colorPoints
          : colorPoints // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      isFree: null == isFree
          ? _self.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$DailyLog {
  String get id; // Por lo general, se usa "YYYY-MM-DD"
  DateTime get date;
  TargetPoints get targetPoints;
  List<FoodEntry> get consumedFoods;

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailyLogCopyWith<DailyLog> get copyWith =>
      _$DailyLogCopyWithImpl<DailyLog>(this as DailyLog, _$identity);

  /// Serializes this DailyLog to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.targetPoints, targetPoints) ||
                other.targetPoints == targetPoints) &&
            const DeepCollectionEquality()
                .equals(other.consumedFoods, consumedFoods));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, targetPoints,
      const DeepCollectionEquality().hash(consumedFoods));

  @override
  String toString() {
    return 'DailyLog(id: $id, date: $date, targetPoints: $targetPoints, consumedFoods: $consumedFoods)';
  }
}

/// @nodoc
abstract mixin class $DailyLogCopyWith<$Res> {
  factory $DailyLogCopyWith(DailyLog value, $Res Function(DailyLog) _then) =
      _$DailyLogCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      TargetPoints targetPoints,
      List<FoodEntry> consumedFoods});

  $TargetPointsCopyWith<$Res> get targetPoints;
}

/// @nodoc
class _$DailyLogCopyWithImpl<$Res> implements $DailyLogCopyWith<$Res> {
  _$DailyLogCopyWithImpl(this._self, this._then);

  final DailyLog _self;
  final $Res Function(DailyLog) _then;

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? targetPoints = null,
    Object? consumedFoods = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetPoints: null == targetPoints
          ? _self.targetPoints
          : targetPoints // ignore: cast_nullable_to_non_nullable
              as TargetPoints,
      consumedFoods: null == consumedFoods
          ? _self.consumedFoods
          : consumedFoods // ignore: cast_nullable_to_non_nullable
              as List<FoodEntry>,
    ));
  }

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TargetPointsCopyWith<$Res> get targetPoints {
    return $TargetPointsCopyWith<$Res>(_self.targetPoints, (value) {
      return _then(_self.copyWith(targetPoints: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DailyLog].
extension DailyLogPatterns on DailyLog {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DailyLog value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyLog() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DailyLog value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyLog():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DailyLog value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyLog() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, DateTime date, TargetPoints targetPoints,
            List<FoodEntry> consumedFoods)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DailyLog() when $default != null:
        return $default(
            _that.id, _that.date, _that.targetPoints, _that.consumedFoods);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, DateTime date, TargetPoints targetPoints,
            List<FoodEntry> consumedFoods)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyLog():
        return $default(
            _that.id, _that.date, _that.targetPoints, _that.consumedFoods);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, DateTime date, TargetPoints targetPoints,
            List<FoodEntry> consumedFoods)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DailyLog() when $default != null:
        return $default(
            _that.id, _that.date, _that.targetPoints, _that.consumedFoods);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DailyLog extends DailyLog {
  const _DailyLog(
      {required this.id,
      required this.date,
      required this.targetPoints,
      final List<FoodEntry> consumedFoods = const []})
      : _consumedFoods = consumedFoods,
        super._();
  factory _DailyLog.fromJson(Map<String, dynamic> json) =>
      _$DailyLogFromJson(json);

  @override
  final String id;
// Por lo general, se usa "YYYY-MM-DD"
  @override
  final DateTime date;
  @override
  final TargetPoints targetPoints;
  final List<FoodEntry> _consumedFoods;
  @override
  @JsonKey()
  List<FoodEntry> get consumedFoods {
    if (_consumedFoods is EqualUnmodifiableListView) return _consumedFoods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_consumedFoods);
  }

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailyLogCopyWith<_DailyLog> get copyWith =>
      __$DailyLogCopyWithImpl<_DailyLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DailyLogToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.targetPoints, targetPoints) ||
                other.targetPoints == targetPoints) &&
            const DeepCollectionEquality()
                .equals(other._consumedFoods, _consumedFoods));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, targetPoints,
      const DeepCollectionEquality().hash(_consumedFoods));

  @override
  String toString() {
    return 'DailyLog(id: $id, date: $date, targetPoints: $targetPoints, consumedFoods: $consumedFoods)';
  }
}

/// @nodoc
abstract mixin class _$DailyLogCopyWith<$Res>
    implements $DailyLogCopyWith<$Res> {
  factory _$DailyLogCopyWith(_DailyLog value, $Res Function(_DailyLog) _then) =
      __$DailyLogCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      TargetPoints targetPoints,
      List<FoodEntry> consumedFoods});

  @override
  $TargetPointsCopyWith<$Res> get targetPoints;
}

/// @nodoc
class __$DailyLogCopyWithImpl<$Res> implements _$DailyLogCopyWith<$Res> {
  __$DailyLogCopyWithImpl(this._self, this._then);

  final _DailyLog _self;
  final $Res Function(_DailyLog) _then;

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? targetPoints = null,
    Object? consumedFoods = null,
  }) {
    return _then(_DailyLog(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetPoints: null == targetPoints
          ? _self.targetPoints
          : targetPoints // ignore: cast_nullable_to_non_nullable
              as TargetPoints,
      consumedFoods: null == consumedFoods
          ? _self._consumedFoods
          : consumedFoods // ignore: cast_nullable_to_non_nullable
              as List<FoodEntry>,
    ));
  }

  /// Create a copy of DailyLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TargetPointsCopyWith<$Res> get targetPoints {
    return $TargetPointsCopyWith<$Res>(_self.targetPoints, (value) {
      return _then(_self.copyWith(targetPoints: value));
    });
  }
}

/// @nodoc
mixin _$FoodCatalogItem {
  @JsonKey(name: '_id')
  String get id;
  String get category;
  String get name;
  String get portion;
  bool get isFree;
  Map<String, int> get colorPoints;
  String get type;
  String? get userId;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  String? get weightOrVolume;

  /// Create a copy of FoodCatalogItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FoodCatalogItemCopyWith<FoodCatalogItem> get copyWith =>
      _$FoodCatalogItemCopyWithImpl<FoodCatalogItem>(
          this as FoodCatalogItem, _$identity);

  /// Serializes this FoodCatalogItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodCatalogItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.portion, portion) || other.portion == portion) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            const DeepCollectionEquality()
                .equals(other.colorPoints, colorPoints) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.weightOrVolume, weightOrVolume) ||
                other.weightOrVolume == weightOrVolume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      name,
      portion,
      isFree,
      const DeepCollectionEquality().hash(colorPoints),
      type,
      userId,
      createdAt,
      updatedAt,
      weightOrVolume);

  @override
  String toString() {
    return 'FoodCatalogItem(id: $id, category: $category, name: $name, portion: $portion, isFree: $isFree, colorPoints: $colorPoints, type: $type, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, weightOrVolume: $weightOrVolume)';
  }
}

/// @nodoc
abstract mixin class $FoodCatalogItemCopyWith<$Res> {
  factory $FoodCatalogItemCopyWith(
          FoodCatalogItem value, $Res Function(FoodCatalogItem) _then) =
      _$FoodCatalogItemCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String category,
      String name,
      String portion,
      bool isFree,
      Map<String, int> colorPoints,
      String type,
      String? userId,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? weightOrVolume});
}

/// @nodoc
class _$FoodCatalogItemCopyWithImpl<$Res>
    implements $FoodCatalogItemCopyWith<$Res> {
  _$FoodCatalogItemCopyWithImpl(this._self, this._then);

  final FoodCatalogItem _self;
  final $Res Function(FoodCatalogItem) _then;

  /// Create a copy of FoodCatalogItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? name = null,
    Object? portion = null,
    Object? isFree = null,
    Object? colorPoints = null,
    Object? type = null,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? weightOrVolume = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      portion: null == portion
          ? _self.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as String,
      isFree: null == isFree
          ? _self.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool,
      colorPoints: null == colorPoints
          ? _self.colorPoints
          : colorPoints // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weightOrVolume: freezed == weightOrVolume
          ? _self.weightOrVolume
          : weightOrVolume // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FoodCatalogItem].
extension FoodCatalogItemPatterns on FoodCatalogItem {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FoodCatalogItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FoodCatalogItem() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FoodCatalogItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FoodCatalogItem():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FoodCatalogItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FoodCatalogItem() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: '_id') String id,
            String category,
            String name,
            String portion,
            bool isFree,
            Map<String, int> colorPoints,
            String type,
            String? userId,
            DateTime? createdAt,
            DateTime? updatedAt,
            String? weightOrVolume)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FoodCatalogItem() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.name,
            _that.portion,
            _that.isFree,
            _that.colorPoints,
            _that.type,
            _that.userId,
            _that.createdAt,
            _that.updatedAt,
            _that.weightOrVolume);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: '_id') String id,
            String category,
            String name,
            String portion,
            bool isFree,
            Map<String, int> colorPoints,
            String type,
            String? userId,
            DateTime? createdAt,
            DateTime? updatedAt,
            String? weightOrVolume)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FoodCatalogItem():
        return $default(
            _that.id,
            _that.category,
            _that.name,
            _that.portion,
            _that.isFree,
            _that.colorPoints,
            _that.type,
            _that.userId,
            _that.createdAt,
            _that.updatedAt,
            _that.weightOrVolume);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: '_id') String id,
            String category,
            String name,
            String portion,
            bool isFree,
            Map<String, int> colorPoints,
            String type,
            String? userId,
            DateTime? createdAt,
            DateTime? updatedAt,
            String? weightOrVolume)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FoodCatalogItem() when $default != null:
        return $default(
            _that.id,
            _that.category,
            _that.name,
            _that.portion,
            _that.isFree,
            _that.colorPoints,
            _that.type,
            _that.userId,
            _that.createdAt,
            _that.updatedAt,
            _that.weightOrVolume);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FoodCatalogItem extends FoodCatalogItem {
  const _FoodCatalogItem(
      {@JsonKey(name: '_id') required this.id,
      required this.category,
      required this.name,
      required this.portion,
      this.isFree = false,
      final Map<String, int> colorPoints = const <String, int>{},
      this.type = 'general',
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.weightOrVolume})
      : _colorPoints = colorPoints,
        super._();
  factory _FoodCatalogItem.fromJson(Map<String, dynamic> json) =>
      _$FoodCatalogItemFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String category;
  @override
  final String name;
  @override
  final String portion;
  @override
  @JsonKey()
  final bool isFree;
  final Map<String, int> _colorPoints;
  @override
  @JsonKey()
  Map<String, int> get colorPoints {
    if (_colorPoints is EqualUnmodifiableMapView) return _colorPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_colorPoints);
  }

  @override
  @JsonKey()
  final String type;
  @override
  final String? userId;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? weightOrVolume;

  /// Create a copy of FoodCatalogItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FoodCatalogItemCopyWith<_FoodCatalogItem> get copyWith =>
      __$FoodCatalogItemCopyWithImpl<_FoodCatalogItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FoodCatalogItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodCatalogItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.portion, portion) || other.portion == portion) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            const DeepCollectionEquality()
                .equals(other._colorPoints, _colorPoints) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.weightOrVolume, weightOrVolume) ||
                other.weightOrVolume == weightOrVolume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      name,
      portion,
      isFree,
      const DeepCollectionEquality().hash(_colorPoints),
      type,
      userId,
      createdAt,
      updatedAt,
      weightOrVolume);

  @override
  String toString() {
    return 'FoodCatalogItem(id: $id, category: $category, name: $name, portion: $portion, isFree: $isFree, colorPoints: $colorPoints, type: $type, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, weightOrVolume: $weightOrVolume)';
  }
}

/// @nodoc
abstract mixin class _$FoodCatalogItemCopyWith<$Res>
    implements $FoodCatalogItemCopyWith<$Res> {
  factory _$FoodCatalogItemCopyWith(
          _FoodCatalogItem value, $Res Function(_FoodCatalogItem) _then) =
      __$FoodCatalogItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String category,
      String name,
      String portion,
      bool isFree,
      Map<String, int> colorPoints,
      String type,
      String? userId,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? weightOrVolume});
}

/// @nodoc
class __$FoodCatalogItemCopyWithImpl<$Res>
    implements _$FoodCatalogItemCopyWith<$Res> {
  __$FoodCatalogItemCopyWithImpl(this._self, this._then);

  final _FoodCatalogItem _self;
  final $Res Function(_FoodCatalogItem) _then;

  /// Create a copy of FoodCatalogItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? name = null,
    Object? portion = null,
    Object? isFree = null,
    Object? colorPoints = null,
    Object? type = null,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? weightOrVolume = freezed,
  }) {
    return _then(_FoodCatalogItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      portion: null == portion
          ? _self.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as String,
      isFree: null == isFree
          ? _self.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool,
      colorPoints: null == colorPoints
          ? _self._colorPoints
          : colorPoints // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weightOrVolume: freezed == weightOrVolume
          ? _self.weightOrVolume
          : weightOrVolume // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
