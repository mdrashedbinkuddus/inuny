import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get university;

  String? get courseofstudy;

  String? get biography;

  String? get state;

  @BuiltValueField(wireName: 'UserType')
  String? get userType;

  String? get password;

  bool? get isSeller;

  bool? get isUniversity;

  int? get numArticles;

  String? get website;

  String? get contactEmail;

  bool? get isFollowed;

  bool? get isFollowing;

  @BuiltValueField(wireName: 'Followings')
  DocumentReference? get followings;

  @BuiltValueField(wireName: 'Followers')
  BuiltList<DocumentReference>? get followers;

  DocumentReference? get followersUserReference;

  int? get numFollowers;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..university = ''
    ..courseofstudy = ''
    ..biography = ''
    ..state = ''
    ..userType = ''
    ..password = ''
    ..isSeller = false
    ..isUniversity = false
    ..numArticles = 0
    ..website = ''
    ..contactEmail = ''
    ..isFollowed = false
    ..isFollowing = false
    ..followers = ListBuilder()
    ..numFollowers = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => UsersRecord(
        (c) => c
          ..email = snapshot.data['email']
          ..displayName = snapshot.data['display_name']
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..university = snapshot.data['university']
          ..courseofstudy = snapshot.data['courseofstudy']
          ..biography = snapshot.data['biography']
          ..state = snapshot.data['state']
          ..userType = snapshot.data['UserType']
          ..password = snapshot.data['password']
          ..isSeller = snapshot.data['isSeller']
          ..isUniversity = snapshot.data['isUniversity']
          ..numArticles = snapshot.data['numArticles']?.round()
          ..website = snapshot.data['website']
          ..contactEmail = snapshot.data['contactEmail']
          ..isFollowed = snapshot.data['isFollowed']
          ..isFollowing = snapshot.data['isFollowing']
          ..followings = safeGet(() => toRef(snapshot.data['Followings']))
          ..followers = safeGet(() =>
              ListBuilder(snapshot.data['Followers'].map((s) => toRef(s))))
          ..followersUserReference =
              safeGet(() => toRef(snapshot.data['followersUserReference']))
          ..numFollowers = snapshot.data['numFollowers']?.round()
          ..ffRef = UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? university,
  String? courseofstudy,
  String? biography,
  String? state,
  String? userType,
  String? password,
  bool? isSeller,
  bool? isUniversity,
  int? numArticles,
  String? website,
  String? contactEmail,
  bool? isFollowed,
  bool? isFollowing,
  DocumentReference? followings,
  DocumentReference? followersUserReference,
  int? numFollowers,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..university = university
        ..courseofstudy = courseofstudy
        ..biography = biography
        ..state = state
        ..userType = userType
        ..password = password
        ..isSeller = isSeller
        ..isUniversity = isUniversity
        ..numArticles = numArticles
        ..website = website
        ..contactEmail = contactEmail
        ..isFollowed = isFollowed
        ..isFollowing = isFollowing
        ..followings = followings
        ..followers = null
        ..followersUserReference = followersUserReference
        ..numFollowers = numFollowers,
    ),
  );

  return firestoreData;
}
