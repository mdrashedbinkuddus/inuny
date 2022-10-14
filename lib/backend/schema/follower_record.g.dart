// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FollowerRecord> _$followerRecordSerializer =
    new _$FollowerRecordSerializer();

class _$FollowerRecordSerializer
    implements StructuredSerializer<FollowerRecord> {
  @override
  final Iterable<Type> types = const [FollowerRecord, _$FollowerRecord];
  @override
  final String wireName = 'FollowerRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FollowerRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.follower;
    if (value != null) {
      result
        ..add('Follower')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.followee;
    if (value != null) {
      result
        ..add('Followee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.numFollowers;
    if (value != null) {
      result
        ..add('numFollowers')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numFollowings;
    if (value != null) {
      result
        ..add('numFollowings')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isFollowed;
    if (value != null) {
      result
        ..add('isFollowed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isFollowing;
    if (value != null) {
      result
        ..add('isFollowing')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  FollowerRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FollowerRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Follower':
          result.follower = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Followee':
          result.followee = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'numFollowers':
          result.numFollowers = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'numFollowings':
          result.numFollowings = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isFollowed':
          result.isFollowed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isFollowing':
          result.isFollowing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$FollowerRecord extends FollowerRecord {
  @override
  final DocumentReference<Object?>? follower;
  @override
  final DocumentReference<Object?>? followee;
  @override
  final int? numFollowers;
  @override
  final int? numFollowings;
  @override
  final bool? isFollowed;
  @override
  final bool? isFollowing;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FollowerRecord([void Function(FollowerRecordBuilder)? updates]) =>
      (new FollowerRecordBuilder()..update(updates))._build();

  _$FollowerRecord._(
      {this.follower,
      this.followee,
      this.numFollowers,
      this.numFollowings,
      this.isFollowed,
      this.isFollowing,
      this.ffRef})
      : super._();

  @override
  FollowerRecord rebuild(void Function(FollowerRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FollowerRecordBuilder toBuilder() =>
      new FollowerRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FollowerRecord &&
        follower == other.follower &&
        followee == other.followee &&
        numFollowers == other.numFollowers &&
        numFollowings == other.numFollowings &&
        isFollowed == other.isFollowed &&
        isFollowing == other.isFollowing &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, follower.hashCode), followee.hashCode),
                        numFollowers.hashCode),
                    numFollowings.hashCode),
                isFollowed.hashCode),
            isFollowing.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FollowerRecord')
          ..add('follower', follower)
          ..add('followee', followee)
          ..add('numFollowers', numFollowers)
          ..add('numFollowings', numFollowings)
          ..add('isFollowed', isFollowed)
          ..add('isFollowing', isFollowing)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FollowerRecordBuilder
    implements Builder<FollowerRecord, FollowerRecordBuilder> {
  _$FollowerRecord? _$v;

  DocumentReference<Object?>? _follower;
  DocumentReference<Object?>? get follower => _$this._follower;
  set follower(DocumentReference<Object?>? follower) =>
      _$this._follower = follower;

  DocumentReference<Object?>? _followee;
  DocumentReference<Object?>? get followee => _$this._followee;
  set followee(DocumentReference<Object?>? followee) =>
      _$this._followee = followee;

  int? _numFollowers;
  int? get numFollowers => _$this._numFollowers;
  set numFollowers(int? numFollowers) => _$this._numFollowers = numFollowers;

  int? _numFollowings;
  int? get numFollowings => _$this._numFollowings;
  set numFollowings(int? numFollowings) =>
      _$this._numFollowings = numFollowings;

  bool? _isFollowed;
  bool? get isFollowed => _$this._isFollowed;
  set isFollowed(bool? isFollowed) => _$this._isFollowed = isFollowed;

  bool? _isFollowing;
  bool? get isFollowing => _$this._isFollowing;
  set isFollowing(bool? isFollowing) => _$this._isFollowing = isFollowing;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FollowerRecordBuilder() {
    FollowerRecord._initializeBuilder(this);
  }

  FollowerRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _follower = $v.follower;
      _followee = $v.followee;
      _numFollowers = $v.numFollowers;
      _numFollowings = $v.numFollowings;
      _isFollowed = $v.isFollowed;
      _isFollowing = $v.isFollowing;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FollowerRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FollowerRecord;
  }

  @override
  void update(void Function(FollowerRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FollowerRecord build() => _build();

  _$FollowerRecord _build() {
    final _$result = _$v ??
        new _$FollowerRecord._(
            follower: follower,
            followee: followee,
            numFollowers: numFollowers,
            numFollowings: numFollowings,
            isFollowed: isFollowed,
            isFollowing: isFollowing,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
