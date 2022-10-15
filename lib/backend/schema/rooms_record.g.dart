// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RoomsRecord> _$roomsRecordSerializer = new _$RoomsRecordSerializer();

class _$RoomsRecordSerializer implements StructuredSerializer<RoomsRecord> {
  @override
  final Iterable<Type> types = const [RoomsRecord, _$RoomsRecord];
  @override
  final String wireName = 'RoomsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RoomsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.picRoom;
    if (value != null) {
      result
        ..add('picRoom')
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
    value = object.isLive;
    if (value != null) {
      result
        ..add('isLive')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.therePhoto;
    if (value != null) {
      result
        ..add('therePhoto')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.member;
    if (value != null) {
      result
        ..add('member')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.shortDescription;
    if (value != null) {
      result
        ..add('shortDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.organizer;
    if (value != null) {
      result
        ..add('organizer')
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
  RoomsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoomsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'RoomName':
          result.roomName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'picRoom':
          result.picRoom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isPublic':
          result.isPublic = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isLive':
          result.isLive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'therePhoto':
          result.therePhoto = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'member':
          result.member.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'shortDescription':
          result.shortDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'organizer':
          result.organizer = serializers.deserialize(value,
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

class _$RoomsRecord extends RoomsRecord {
  @override
  final String? roomName;
  @override
  final String? description;
  @override
  final String? picRoom;
  @override
  final bool? isPublic;
  @override
  final bool? isLive;
  @override
  final bool? therePhoto;
  @override
  final BuiltList<DocumentReference<Object?>>? member;
  @override
  final String? shortDescription;
  @override
  final bool? organizer;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RoomsRecord([void Function(RoomsRecordBuilder)? updates]) =>
      (new RoomsRecordBuilder()..update(updates))._build();

  _$RoomsRecord._(
      {this.roomName,
      this.description,
      this.picRoom,
      this.isPublic,
      this.isLive,
      this.therePhoto,
      this.member,
      this.shortDescription,
      this.organizer,
      this.ffRef})
      : super._();

  @override
  RoomsRecord rebuild(void Function(RoomsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoomsRecordBuilder toBuilder() => new RoomsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoomsRecord &&
        roomName == other.roomName &&
        description == other.description &&
        picRoom == other.picRoom &&
        isPublic == other.isPublic &&
        isLive == other.isLive &&
        therePhoto == other.therePhoto &&
        member == other.member &&
        shortDescription == other.shortDescription &&
        organizer == other.organizer &&
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
                                    $jc($jc(0, roomName.hashCode),
                                        description.hashCode),
                                    picRoom.hashCode),
                                isPublic.hashCode),
                            isLive.hashCode),
                        therePhoto.hashCode),
                    member.hashCode),
                shortDescription.hashCode),
            organizer.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RoomsRecord')
          ..add('roomName', roomName)
          ..add('description', description)
          ..add('picRoom', picRoom)
          ..add('isPublic', isPublic)
          ..add('isLive', isLive)
          ..add('therePhoto', therePhoto)
          ..add('member', member)
          ..add('shortDescription', shortDescription)
          ..add('organizer', organizer)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RoomsRecordBuilder implements Builder<RoomsRecord, RoomsRecordBuilder> {
  _$RoomsRecord? _$v;

  String? _roomName;
  String? get roomName => _$this._roomName;
  set roomName(String? roomName) => _$this._roomName = roomName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _picRoom;
  String? get picRoom => _$this._picRoom;
  set picRoom(String? picRoom) => _$this._picRoom = picRoom;

  bool? _isPublic;
  bool? get isPublic => _$this._isPublic;
  set isPublic(bool? isPublic) => _$this._isPublic = isPublic;

  bool? _isLive;
  bool? get isLive => _$this._isLive;
  set isLive(bool? isLive) => _$this._isLive = isLive;

  bool? _therePhoto;
  bool? get therePhoto => _$this._therePhoto;
  set therePhoto(bool? therePhoto) => _$this._therePhoto = therePhoto;

  ListBuilder<DocumentReference<Object?>>? _member;
  ListBuilder<DocumentReference<Object?>> get member =>
      _$this._member ??= new ListBuilder<DocumentReference<Object?>>();
  set member(ListBuilder<DocumentReference<Object?>>? member) =>
      _$this._member = member;

  String? _shortDescription;
  String? get shortDescription => _$this._shortDescription;
  set shortDescription(String? shortDescription) =>
      _$this._shortDescription = shortDescription;

  bool? _organizer;
  bool? get organizer => _$this._organizer;
  set organizer(bool? organizer) => _$this._organizer = organizer;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RoomsRecordBuilder() {
    RoomsRecord._initializeBuilder(this);
  }

  RoomsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _roomName = $v.roomName;
      _description = $v.description;
      _picRoom = $v.picRoom;
      _isPublic = $v.isPublic;
      _isLive = $v.isLive;
      _therePhoto = $v.therePhoto;
      _member = $v.member?.toBuilder();
      _shortDescription = $v.shortDescription;
      _organizer = $v.organizer;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoomsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RoomsRecord;
  }

  @override
  void update(void Function(RoomsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RoomsRecord build() => _build();

  _$RoomsRecord _build() {
    _$RoomsRecord _$result;
    try {
      _$result = _$v ??
          new _$RoomsRecord._(
              roomName: roomName,
              description: description,
              picRoom: picRoom,
              isPublic: isPublic,
              isLive: isLive,
              therePhoto: therePhoto,
              member: _member?.build(),
              shortDescription: shortDescription,
              organizer: organizer,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'member';
        _member?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RoomsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
