import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @BuiltValueField(wireName: 'FullName')
  String? get fullName;

  @BuiltValueField(wireName: 'Photo')
  String? get photo;

  String? get description;

  DateTime? get date;

  @BuiltValueField(wireName: 'Picture')
  String? get picture;

  @BuiltValueField(wireName: 'Video')
  String? get video;

  DocumentReference? get postUser;

  bool? get postOwner;

  int? get numComments;

  @BuiltValueField(wireName: 'Useful')
  BuiltList<DocumentReference>? get useful;

  String? get file;

  bool? get therePhoto;

  bool? get therePDF;

  bool? get isUseful;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..fullName = ''
    ..photo = ''
    ..description = ''
    ..picture = ''
    ..video = ''
    ..postOwner = false
    ..numComments = 0
    ..useful = ListBuilder()
    ..file = ''
    ..therePhoto = false
    ..therePDF = false
    ..isUseful = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static PostsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => PostsRecord(
        (c) => c
          ..fullName = snapshot.data['FullName']
          ..photo = snapshot.data['Photo']
          ..description = snapshot.data['description']
          ..date = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['date']))
          ..picture = snapshot.data['Picture']
          ..video = snapshot.data['Video']
          ..postUser = safeGet(() => toRef(snapshot.data['postUser']))
          ..postOwner = snapshot.data['postOwner']
          ..numComments = snapshot.data['numComments']?.round()
          ..useful = safeGet(
              () => ListBuilder(snapshot.data['Useful'].map((s) => toRef(s))))
          ..file = snapshot.data['file']
          ..therePhoto = snapshot.data['therePhoto']
          ..therePDF = snapshot.data['therePDF']
          ..isUseful = snapshot.data['isUseful']
          ..ffRef = PostsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PostsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'posts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPostsRecordData({
  String? fullName,
  String? photo,
  String? description,
  DateTime? date,
  String? picture,
  String? video,
  DocumentReference? postUser,
  bool? postOwner,
  int? numComments,
  String? file,
  bool? therePhoto,
  bool? therePDF,
  bool? isUseful,
}) {
  final firestoreData = serializers.toFirestore(
    PostsRecord.serializer,
    PostsRecord(
      (p) => p
        ..fullName = fullName
        ..photo = photo
        ..description = description
        ..date = date
        ..picture = picture
        ..video = video
        ..postUser = postUser
        ..postOwner = postOwner
        ..numComments = numComments
        ..useful = null
        ..file = file
        ..therePhoto = therePhoto
        ..therePDF = therePDF
        ..isUseful = isUseful,
    ),
  );

  return firestoreData;
}
