// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studyrooms_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StudyroomsRecord> _$studyroomsRecordSerializer =
    new _$StudyroomsRecordSerializer();

class _$StudyroomsRecordSerializer
    implements StructuredSerializer<StudyroomsRecord> {
  @override
  final Iterable<Type> types = const [StudyroomsRecord, _$StudyroomsRecord];
  @override
  final String wireName = 'StudyroomsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StudyroomsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.creator;
    if (value != null) {
      result
        ..add('creator')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.header;
    if (value != null) {
      result
        ..add('header')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.roomName;
    if (value != null) {
      result
        ..add('RoomName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isLive;
    if (value != null) {
      result
        ..add('is_live')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.playbackname;
    if (value != null) {
      result
        ..add('playbackname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.playbackUrl;
    if (value != null) {
      result
        ..add('playback_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isPublic;
    if (value != null) {
      result
        ..add('isPublic')
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
  StudyroomsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StudyroomsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'creator':
          result.creator = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'header':
          result.header = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'RoomName':
          result.roomName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_live':
          result.isLive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'playbackname':
          result.playbackname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'playback_url':
          result.playbackUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isPublic':
          result.isPublic = serializers.deserialize(value,
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

class _$StudyroomsRecord extends StudyroomsRecord {
  @override
  final String? creator;
  @override
  final String? header;
  @override
  final String? roomName;
  @override
  final String? description;
  @override
  final bool? isLive;
  @override
  final String? playbackname;
  @override
  final String? playbackUrl;
  @override
  final DateTime? timestamp;
  @override
  final String? uid;
  @override
  final bool? isPublic;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StudyroomsRecord(
          [void Function(StudyroomsRecordBuilder)? updates]) =>
      (new StudyroomsRecordBuilder()..update(updates))._build();

  _$StudyroomsRecord._(
      {this.creator,
      this.header,
      this.roomName,
      this.description,
      this.isLive,
      this.playbackname,
      this.playbackUrl,
      this.timestamp,
      this.uid,
      this.isPublic,
      this.ffRef})
      : super._();

  @override
  StudyroomsRecord rebuild(void Function(StudyroomsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudyroomsRecordBuilder toBuilder() =>
      new StudyroomsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudyroomsRecord &&
        creator == other.creator &&
        header == other.header &&
        roomName == other.roomName &&
        description == other.description &&
        isLive == other.isLive &&
        playbackname == other.playbackname &&
        playbackUrl == other.playbackUrl &&
        timestamp == other.timestamp &&
        uid == other.uid &&
        isPublic == other.isPublic &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, creator.hashCode),
                                            header.hashCode),
                                        roomName.hashCode),
                                    description.hashCode),
                                isLive.hashCode),
                            playbackname.hashCode),
                        playbackUrl.hashCode),
                    timestamp.hashCode),
                uid.hashCode),
            isPublic.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StudyroomsRecord')
          ..add('creator', creator)
          ..add('header', header)
          ..add('roomName', roomName)
          ..add('description', description)
          ..add('isLive', isLive)
          ..add('playbackname', playbackname)
          ..add('playbackUrl', playbackUrl)
          ..add('timestamp', timestamp)
          ..add('uid', uid)
          ..add('isPublic', isPublic)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StudyroomsRecordBuilder
    implements Builder<StudyroomsRecord, StudyroomsRecordBuilder> {
  _$StudyroomsRecord? _$v;

  String? _creator;
  String? get creator => _$this._creator;
  set creator(String? creator) => _$this._creator = creator;

  String? _header;
  String? get header => _$this._header;
  set header(String? header) => _$this._header = header;

  String? _roomName;
  String? get roomName => _$this._roomName;
  set roomName(String? roomName) => _$this._roomName = roomName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _isLive;
  bool? get isLive => _$this._isLive;
  set isLive(bool? isLive) => _$this._isLive = isLive;

  String? _playbackname;
  String? get playbackname => _$this._playbackname;
  set playbackname(String? playbackname) => _$this._playbackname = playbackname;

  String? _playbackUrl;
  String? get playbackUrl => _$this._playbackUrl;
  set playbackUrl(String? playbackUrl) => _$this._playbackUrl = playbackUrl;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  bool? _isPublic;
  bool? get isPublic => _$this._isPublic;
  set isPublic(bool? isPublic) => _$this._isPublic = isPublic;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StudyroomsRecordBuilder() {
    StudyroomsRecord._initializeBuilder(this);
  }

  StudyroomsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _creator = $v.creator;
      _header = $v.header;
      _roomName = $v.roomName;
      _description = $v.description;
      _isLive = $v.isLive;
      _playbackname = $v.playbackname;
      _playbackUrl = $v.playbackUrl;
      _timestamp = $v.timestamp;
      _uid = $v.uid;
      _isPublic = $v.isPublic;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudyroomsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StudyroomsRecord;
  }

  @override
  void update(void Function(StudyroomsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StudyroomsRecord build() => _build();

  _$StudyroomsRecord _build() {
    final _$result = _$v ??
        new _$StudyroomsRecord._(
            creator: creator,
            header: header,
            roomName: roomName,
            description: description,
            isLive: isLive,
            playbackname: playbackname,
            playbackUrl: playbackUrl,
            timestamp: timestamp,
            uid: uid,
            isPublic: isPublic,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
