import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'follower_record.g.dart';

abstract class FollowerRecord
    implements Built<FollowerRecord, FollowerRecordBuilder> {
  static Serializer<FollowerRecord> get serializer =>
      _$followerRecordSerializer;

  @BuiltValueField(wireName: 'Follower')
  DocumentReference? get follower;

  @BuiltValueField(wireName: 'Followee')
  DocumentReference? get followee;

  int? get numFollowers;

  int? get numFollowings;

  bool? get isFollowed;

  bool? get isFollowing;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FollowerRecordBuilder builder) => builder
    ..numFollowers = 0
    ..numFollowings = 0
    ..isFollowed = false
    ..isFollowing = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Follower');

  static Stream<FollowerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FollowerRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static FollowerRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      FollowerRecord(
        (c) => c
          ..follower = safeGet(() => toRef(snapshot.data['Follower']))
          ..followee = safeGet(() => toRef(snapshot.data['Followee']))
          ..numFollowers = snapshot.data['numFollowers']?.round()
          ..numFollowings = snapshot.data['numFollowings']?.round()
          ..isFollowed = snapshot.data['isFollowed']
          ..isFollowing = snapshot.data['isFollowing']
          ..ffRef = FollowerRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<FollowerRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Follower',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  FollowerRecord._();
  factory FollowerRecord([void Function(FollowerRecordBuilder) updates]) =
      _$FollowerRecord;

  static FollowerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFollowerRecordData({
  DocumentReference? follower,
  DocumentReference? followee,
  int? numFollowers,
  int? numFollowings,
  bool? isFollowed,
  bool? isFollowing,
}) {
  final firestoreData = serializers.toFirestore(
    FollowerRecord.serializer,
    FollowerRecord(
      (f) => f
        ..follower = follower
        ..followee = followee
        ..numFollowers = numFollowers
        ..numFollowings = numFollowings
        ..isFollowed = isFollowed
        ..isFollowing = isFollowing,
    ),
  );

  return firestoreData;
}
