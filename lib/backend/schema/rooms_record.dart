import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'rooms_record.g.dart';

abstract class RoomsRecord implements Built<RoomsRecord, RoomsRecordBuilder> {
  static Serializer<RoomsRecord> get serializer => _$roomsRecordSerializer;

  @BuiltValueField(wireName: 'RoomName')
  String? get roomName;

  String? get description;

  String? get picRoom;

  bool? get isPublic;

  bool? get isLive;

  bool? get therePhoto;

  BuiltList<DocumentReference>? get member;

  String? get shortDescription;

  bool? get organizer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RoomsRecordBuilder builder) => builder
    ..roomName = ''
    ..description = ''
    ..picRoom = ''
    ..isPublic = false
    ..isLive = false
    ..therePhoto = false
    ..member = ListBuilder()
    ..shortDescription = ''
    ..organizer = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Rooms');

  static Stream<RoomsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RoomsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RoomsRecord._();
  factory RoomsRecord([void Function(RoomsRecordBuilder) updates]) =
      _$RoomsRecord;

  static RoomsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRoomsRecordData({
  String? roomName,
  String? description,
  String? picRoom,
  bool? isPublic,
  bool? isLive,
  bool? therePhoto,
  String? shortDescription,
  bool? organizer,
}) {
  final firestoreData = serializers.toFirestore(
    RoomsRecord.serializer,
    RoomsRecord(
      (r) => r
        ..roomName = roomName
        ..description = description
        ..picRoom = picRoom
        ..isPublic = isPublic
        ..isLive = isLive
        ..therePhoto = therePhoto
        ..member = null
        ..shortDescription = shortDescription
        ..organizer = organizer,
    ),
  );

  return firestoreData;
}
