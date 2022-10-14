// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.university;
    if (value != null) {
      result
        ..add('university')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.courseofstudy;
    if (value != null) {
      result
        ..add('courseofstudy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.biography;
    if (value != null) {
      result
        ..add('biography')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userType;
    if (value != null) {
      result
        ..add('UserType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isSeller;
    if (value != null) {
      result
        ..add('isSeller')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isUniversity;
    if (value != null) {
      result
        ..add('isUniversity')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.numArticles;
    if (value != null) {
      result
        ..add('numArticles')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.website;
    if (value != null) {
      result
        ..add('website')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contactEmail;
    if (value != null) {
      result
        ..add('contactEmail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.followings;
    if (value != null) {
      result
        ..add('Followings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.followers;
    if (value != null) {
      result
        ..add('Followers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.followersUserReference;
    if (value != null) {
      result
        ..add('followersUserReference')
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'university':
          result.university = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'courseofstudy':
          result.courseofstudy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'biography':
          result.biography = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'UserType':
          result.userType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isSeller':
          result.isSeller = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isUniversity':
          result.isUniversity = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'numArticles':
          result.numArticles = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'contactEmail':
          result.contactEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isFollowed':
          result.isFollowed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isFollowing':
          result.isFollowing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Followings':
          result.followings = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Followers':
          result.followers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'followersUserReference':
          result.followersUserReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'numFollowers':
          result.numFollowers = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? university;
  @override
  final String? courseofstudy;
  @override
  final String? biography;
  @override
  final String? state;
  @override
  final String? userType;
  @override
  final String? password;
  @override
  final bool? isSeller;
  @override
  final bool? isUniversity;
  @override
  final int? numArticles;
  @override
  final String? website;
  @override
  final String? contactEmail;
  @override
  final bool? isFollowed;
  @override
  final bool? isFollowing;
  @override
  final DocumentReference<Object?>? followings;
  @override
  final BuiltList<DocumentReference<Object?>>? followers;
  @override
  final DocumentReference<Object?>? followersUserReference;
  @override
  final int? numFollowers;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.university,
      this.courseofstudy,
      this.biography,
      this.state,
      this.userType,
      this.password,
      this.isSeller,
      this.isUniversity,
      this.numArticles,
      this.website,
      this.contactEmail,
      this.isFollowed,
      this.isFollowing,
      this.followings,
      this.followers,
      this.followersUserReference,
      this.numFollowers,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        university == other.university &&
        courseofstudy == other.courseofstudy &&
        biography == other.biography &&
        state == other.state &&
        userType == other.userType &&
        password == other.password &&
        isSeller == other.isSeller &&
        isUniversity == other.isUniversity &&
        numArticles == other.numArticles &&
        website == other.website &&
        contactEmail == other.contactEmail &&
        isFollowed == other.isFollowed &&
        isFollowing == other.isFollowing &&
        followings == other.followings &&
        followers == other.followers &&
        followersUserReference == other.followersUserReference &&
        numFollowers == other.numFollowers &&
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
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc(0, email.hashCode), displayName.hashCode), photoUrl.hashCode), uid.hashCode), createdTime.hashCode),
                                                                                phoneNumber.hashCode),
                                                                            university.hashCode),
                                                                        courseofstudy.hashCode),
                                                                    biography.hashCode),
                                                                state.hashCode),
                                                            userType.hashCode),
                                                        password.hashCode),
                                                    isSeller.hashCode),
                                                isUniversity.hashCode),
                                            numArticles.hashCode),
                                        website.hashCode),
                                    contactEmail.hashCode),
                                isFollowed.hashCode),
                            isFollowing.hashCode),
                        followings.hashCode),
                    followers.hashCode),
                followersUserReference.hashCode),
            numFollowers.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('university', university)
          ..add('courseofstudy', courseofstudy)
          ..add('biography', biography)
          ..add('state', state)
          ..add('userType', userType)
          ..add('password', password)
          ..add('isSeller', isSeller)
          ..add('isUniversity', isUniversity)
          ..add('numArticles', numArticles)
          ..add('website', website)
          ..add('contactEmail', contactEmail)
          ..add('isFollowed', isFollowed)
          ..add('isFollowing', isFollowing)
          ..add('followings', followings)
          ..add('followers', followers)
          ..add('followersUserReference', followersUserReference)
          ..add('numFollowers', numFollowers)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _university;
  String? get university => _$this._university;
  set university(String? university) => _$this._university = university;

  String? _courseofstudy;
  String? get courseofstudy => _$this._courseofstudy;
  set courseofstudy(String? courseofstudy) =>
      _$this._courseofstudy = courseofstudy;

  String? _biography;
  String? get biography => _$this._biography;
  set biography(String? biography) => _$this._biography = biography;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _userType;
  String? get userType => _$this._userType;
  set userType(String? userType) => _$this._userType = userType;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  bool? _isSeller;
  bool? get isSeller => _$this._isSeller;
  set isSeller(bool? isSeller) => _$this._isSeller = isSeller;

  bool? _isUniversity;
  bool? get isUniversity => _$this._isUniversity;
  set isUniversity(bool? isUniversity) => _$this._isUniversity = isUniversity;

  int? _numArticles;
  int? get numArticles => _$this._numArticles;
  set numArticles(int? numArticles) => _$this._numArticles = numArticles;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  String? _contactEmail;
  String? get contactEmail => _$this._contactEmail;
  set contactEmail(String? contactEmail) => _$this._contactEmail = contactEmail;

  bool? _isFollowed;
  bool? get isFollowed => _$this._isFollowed;
  set isFollowed(bool? isFollowed) => _$this._isFollowed = isFollowed;

  bool? _isFollowing;
  bool? get isFollowing => _$this._isFollowing;
  set isFollowing(bool? isFollowing) => _$this._isFollowing = isFollowing;

  DocumentReference<Object?>? _followings;
  DocumentReference<Object?>? get followings => _$this._followings;
  set followings(DocumentReference<Object?>? followings) =>
      _$this._followings = followings;

  ListBuilder<DocumentReference<Object?>>? _followers;
  ListBuilder<DocumentReference<Object?>> get followers =>
      _$this._followers ??= new ListBuilder<DocumentReference<Object?>>();
  set followers(ListBuilder<DocumentReference<Object?>>? followers) =>
      _$this._followers = followers;

  DocumentReference<Object?>? _followersUserReference;
  DocumentReference<Object?>? get followersUserReference =>
      _$this._followersUserReference;
  set followersUserReference(
          DocumentReference<Object?>? followersUserReference) =>
      _$this._followersUserReference = followersUserReference;

  int? _numFollowers;
  int? get numFollowers => _$this._numFollowers;
  set numFollowers(int? numFollowers) => _$this._numFollowers = numFollowers;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _university = $v.university;
      _courseofstudy = $v.courseofstudy;
      _biography = $v.biography;
      _state = $v.state;
      _userType = $v.userType;
      _password = $v.password;
      _isSeller = $v.isSeller;
      _isUniversity = $v.isUniversity;
      _numArticles = $v.numArticles;
      _website = $v.website;
      _contactEmail = $v.contactEmail;
      _isFollowed = $v.isFollowed;
      _isFollowing = $v.isFollowing;
      _followings = $v.followings;
      _followers = $v.followers?.toBuilder();
      _followersUserReference = $v.followersUserReference;
      _numFollowers = $v.numFollowers;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              university: university,
              courseofstudy: courseofstudy,
              biography: biography,
              state: state,
              userType: userType,
              password: password,
              isSeller: isSeller,
              isUniversity: isUniversity,
              numArticles: numArticles,
              website: website,
              contactEmail: contactEmail,
              isFollowed: isFollowed,
              isFollowing: isFollowing,
              followings: followings,
              followers: _followers?.build(),
              followersUserReference: followersUserReference,
              numFollowers: numFollowers,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'followers';
        _followers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
