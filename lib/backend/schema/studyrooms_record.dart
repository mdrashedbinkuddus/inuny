import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'studyrooms_record.g.dart';

abstract class StudyroomsRecord
    implements Built<StudyroomsRecord, StudyroomsRecordBuilder> {
  static Serializer<StudyroomsRecord> get serializer =>
      _$studyroomsRecordSerializer;

  String? get creator;

  String? get header;

  @BuiltValueField(wireName: 'RoomName')
  String? get roomName;

  String? get description;

  @BuiltValueField(wireName: 'is_live')
  bool? get isLive;

  String? get playbackname;

  @BuiltValueField(wireName: 'playback_url')
  String? get playbackUrl;

  DateTime? get timestamp;

  String? get uid;

  bool? get isPublic;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StudyroomsRecordBuilder builder) => builder
    ..creator = ''
    ..header = ''
    ..roomName = ''
    ..description = ''
    ..isLive = false
    ..playbackname = ''
    ..playbackUrl = ''
    ..uid = ''
    ..isPublic = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('studyrooms');

  static Stream<StudyroomsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StudyroomsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static StudyroomsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      StudyroomsRecord(
        (c) => c
          ..creator = snapshot.data['creator']
          ..header = snapshot.data['header']
          ..roomName = snapshot.data['RoomName']
          ..description = snapshot.data['description']
          ..isLive = snapshot.data['is_live']
          ..playbackname = snapshot.data['playbackname']
          ..playbackUrl = snapshot.data['playback_url']
          ..timestamp = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['timestamp']))
          ..uid = snapshot.data['uid']
          ..isPublic = snapshot.data['isPublic']
          ..ffRef = StudyroomsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<StudyroomsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'studyrooms',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  StudyroomsRecord._();
  factory StudyroomsRecord([void Function(StudyroomsRecordBuilder) updates]) =
      _$StudyroomsRecord;

  static StudyroomsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStudyroomsRecordData({
  String? creator,
  String? header,
  String? roomName,
  String? description,
  bool? isLive,
  String? playbackname,
  String? playbackUrl,
  DateTime? timestamp,
  String? uid,
  bool? isPublic,
}) {
  final firestoreData = serializers.toFirestore(
    StudyroomsRecord.serializer,
    StudyroomsRecord(
      (s) => s
        ..creator = creator
        ..header = header
        ..roomName = roomName
        ..description = description
        ..isLive = isLive
        ..playbackname = playbackname
        ..playbackUrl = playbackUrl
        ..timestamp = timestamp
        ..uid = uid
        ..isPublic = isPublic,
    ),
  );

  return firestoreData;
}
