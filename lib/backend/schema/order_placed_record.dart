import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_placed_record.g.dart';

abstract class OrderPlacedRecord
    implements Built<OrderPlacedRecord, OrderPlacedRecordBuilder> {
  static Serializer<OrderPlacedRecord> get serializer =>
      _$orderPlacedRecordSerializer;

  DocumentReference? get seller;

  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'ProdRef')
  DocumentReference? get prodRef;

  int? get numOrder;

  bool? get rated;

  DateTime? get dateCreated;

  bool? get isNew;

  bool? get isComplete;

  bool? get isRated;

  bool? get cancelOrder;

  double? get priceOrder;

  String? get cancelReason;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OrderPlacedRecordBuilder builder) => builder
    ..numOrder = 0
    ..rated = false
    ..isNew = false
    ..isComplete = false
    ..isRated = false
    ..cancelOrder = false
    ..priceOrder = 0.0
    ..cancelReason = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orderPlaced');

  static Stream<OrderPlacedRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrderPlacedRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrderPlacedRecord._();
  factory OrderPlacedRecord([void Function(OrderPlacedRecordBuilder) updates]) =
      _$OrderPlacedRecord;

  static OrderPlacedRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrderPlacedRecordData({
  DocumentReference? seller,
  DocumentReference? userRef,
  DocumentReference? prodRef,
  int? numOrder,
  bool? rated,
  DateTime? dateCreated,
  bool? isNew,
  bool? isComplete,
  bool? isRated,
  bool? cancelOrder,
  double? priceOrder,
  String? cancelReason,
}) {
  final firestoreData = serializers.toFirestore(
    OrderPlacedRecord.serializer,
    OrderPlacedRecord(
      (o) => o
        ..seller = seller
        ..userRef = userRef
        ..prodRef = prodRef
        ..numOrder = numOrder
        ..rated = rated
        ..dateCreated = dateCreated
        ..isNew = isNew
        ..isComplete = isComplete
        ..isRated = isRated
        ..cancelOrder = cancelOrder
        ..priceOrder = priceOrder
        ..cancelReason = cancelReason,
    ),
  );

  return firestoreData;
}
