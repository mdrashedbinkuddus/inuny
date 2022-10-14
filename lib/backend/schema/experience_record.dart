import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'experience_record.g.dart';

abstract class ExperienceRecord
    implements Built<ExperienceRecord, ExperienceRecordBuilder> {
  static Serializer<ExperienceRecord> get serializer =>
      _$experienceRecordSerializer;

  DocumentReference? get userAssociation;

  @BuiltValueField(wireName: 'School')
  String? get school;

  @BuiltValueField(wireName: 'Course')
  String? get course;

  @BuiltValueField(wireName: 'StartDate')
  DateTime? get startDate;

  @BuiltValueField(wireName: 'EndDate')
  DateTime? get endDate;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ExperienceRecordBuilder builder) => builder
    ..school = ''
    ..course = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('experience');

  static Stream<ExperienceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ExperienceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ExperienceRecord._();
  factory ExperienceRecord([void Function(ExperienceRecordBuilder) updates]) =
      _$ExperienceRecord;

  static ExperienceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createExperienceRecordData({
  DocumentReference? userAssociation,
  String? school,
  String? course,
  DateTime? startDate,
  DateTime? endDate,
}) {
  final firestoreData = serializers.toFirestore(
    ExperienceRecord.serializer,
    ExperienceRecord(
      (e) => e
        ..userAssociation = userAssociation
        ..school = school
        ..course = course
        ..startDate = startDate
        ..endDate = endDate,
    ),
  );

  return firestoreData;
}
