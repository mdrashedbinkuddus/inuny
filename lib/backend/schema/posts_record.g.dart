// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostsRecord> _$postsRecordSerializer = new _$PostsRecordSerializer();

class _$PostsRecordSerializer implements StructuredSerializer<PostsRecord> {
  @override
  final Iterable<Type> types = const [PostsRecord, _$PostsRecord];
  @override
  final String wireName = 'PostsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.fullName;
    if (value != null) {
      result
        ..add('FullName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('Photo')
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
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.picture;
    if (value != null) {
      result
        ..add('Picture')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('Video')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postUser;
    if (value != null) {
      result
        ..add('postUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.postOwner;
    if (value != null) {
      result
        ..add('postOwner')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.numComments;
    if (value != null) {
      result
        ..add('numComments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.useful;
    if (value != null) {
      result
        ..add('Useful')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.file;
    if (value != null) {
      result
        ..add('file')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.therePhoto;
    if (value != null) {
      result
        ..add('therePhoto')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.therePDF;
    if (value != null) {
      result
        ..add('therePDF')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isUseful;
    if (value != null) {
      result
        ..add('isUseful')
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
  PostsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'FullName':
          result.fullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Picture':
          result.picture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postUser':
          result.postUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'postOwner':
          result.postOwner = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'numComments':
          result.numComments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Useful':
          result.useful.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'file':
          result.file = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'therePhoto':
          result.therePhoto = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'therePDF':
          result.therePDF = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isUseful':
          result.isUseful = serializers.deserialize(value,
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

class _$PostsRecord extends PostsRecord {
  @override
  final String? fullName;
  @override
  final String? photo;
  @override
  final String? description;
  @override
  final DateTime? date;
  @override
  final String? picture;
  @override
  final String? video;
  @override
  final DocumentReference<Object?>? postUser;
  @override
  final bool? postOwner;
  @override
  final int? numComments;
  @override
  final BuiltList<DocumentReference<Object?>>? useful;
  @override
  final String? file;
  @override
  final bool? therePhoto;
  @override
  final bool? therePDF;
  @override
  final bool? isUseful;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PostsRecord([void Function(PostsRecordBuilder)? updates]) =>
      (new PostsRecordBuilder()..update(updates))._build();

  _$PostsRecord._(
      {this.fullName,
      this.photo,
      this.description,
      this.date,
      this.picture,
      this.video,
      this.postUser,
      this.postOwner,
      this.numComments,
      this.useful,
      this.file,
      this.therePhoto,
      this.therePDF,
      this.isUseful,
      this.ffRef})
      : super._();

  @override
  PostsRecord rebuild(void Function(PostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsRecordBuilder toBuilder() => new PostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsRecord &&
        fullName == other.fullName &&
        photo == other.photo &&
        description == other.description &&
        date == other.date &&
        picture == other.picture &&
        video == other.video &&
        postUser == other.postUser &&
        postOwner == other.postOwner &&
        numComments == other.numComments &&
        useful == other.useful &&
        file == other.file &&
        therePhoto == other.therePhoto &&
        therePDF == other.therePDF &&
        isUseful == other.isUseful &&
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
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                fullName
                                                                    .hashCode),
                                                            photo.hashCode),
                                                        description.hashCode),
                                                    date.hashCode),
                                                picture.hashCode),
                                            video.hashCode),
                                        postUser.hashCode),
                                    postOwner.hashCode),
                                numComments.hashCode),
                            useful.hashCode),
                        file.hashCode),
                    therePhoto.hashCode),
                therePDF.hashCode),
            isUseful.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostsRecord')
          ..add('fullName', fullName)
          ..add('photo', photo)
          ..add('description', description)
          ..add('date', date)
          ..add('picture', picture)
          ..add('video', video)
          ..add('postUser', postUser)
          ..add('postOwner', postOwner)
          ..add('numComments', numComments)
          ..add('useful', useful)
          ..add('file', file)
          ..add('therePhoto', therePhoto)
          ..add('therePDF', therePDF)
          ..add('isUseful', isUseful)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PostsRecordBuilder implements Builder<PostsRecord, PostsRecordBuilder> {
  _$PostsRecord? _$v;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _photo;
  String? get photo => _$this._photo;
  set photo(String? photo) => _$this._photo = photo;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _picture;
  String? get picture => _$this._picture;
  set picture(String? picture) => _$this._picture = picture;

  String? _video;
  String? get video => _$this._video;
  set video(String? video) => _$this._video = video;

  DocumentReference<Object?>? _postUser;
  DocumentReference<Object?>? get postUser => _$this._postUser;
  set postUser(DocumentReference<Object?>? postUser) =>
      _$this._postUser = postUser;

  bool? _postOwner;
  bool? get postOwner => _$this._postOwner;
  set postOwner(bool? postOwner) => _$this._postOwner = postOwner;

  int? _numComments;
  int? get numComments => _$this._numComments;
  set numComments(int? numComments) => _$this._numComments = numComments;

  ListBuilder<DocumentReference<Object?>>? _useful;
  ListBuilder<DocumentReference<Object?>> get useful =>
      _$this._useful ??= new ListBuilder<DocumentReference<Object?>>();
  set useful(ListBuilder<DocumentReference<Object?>>? useful) =>
      _$this._useful = useful;

  String? _file;
  String? get file => _$this._file;
  set file(String? file) => _$this._file = file;

  bool? _therePhoto;
  bool? get therePhoto => _$this._therePhoto;
  set therePhoto(bool? therePhoto) => _$this._therePhoto = therePhoto;

  bool? _therePDF;
  bool? get therePDF => _$this._therePDF;
  set therePDF(bool? therePDF) => _$this._therePDF = therePDF;

  bool? _isUseful;
  bool? get isUseful => _$this._isUseful;
  set isUseful(bool? isUseful) => _$this._isUseful = isUseful;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PostsRecordBuilder() {
    PostsRecord._initializeBuilder(this);
  }

  PostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _photo = $v.photo;
      _description = $v.description;
      _date = $v.date;
      _picture = $v.picture;
      _video = $v.video;
      _postUser = $v.postUser;
      _postOwner = $v.postOwner;
      _numComments = $v.numComments;
      _useful = $v.useful?.toBuilder();
      _file = $v.file;
      _therePhoto = $v.therePhoto;
      _therePDF = $v.therePDF;
      _isUseful = $v.isUseful;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostsRecord;
  }

  @override
  void update(void Function(PostsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostsRecord build() => _build();

  _$PostsRecord _build() {
    _$PostsRecord _$result;
    try {
      _$result = _$v ??
          new _$PostsRecord._(
              fullName: fullName,
              photo: photo,
              description: description,
              date: date,
              picture: picture,
              video: video,
              postUser: postUser,
              postOwner: postOwner,
              numComments: numComments,
              useful: _useful?.build(),
              file: file,
              therePhoto: therePhoto,
              therePDF: therePDF,
              isUseful: isUseful,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'useful';
        _useful?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
