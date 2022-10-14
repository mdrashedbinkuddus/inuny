import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'products_record.g.dart';

abstract class ProductsRecord
    implements Built<ProductsRecord, ProductsRecordBuilder> {
  static Serializer<ProductsRecord> get serializer =>
      _$productsRecordSerializer;

  @BuiltValueField(wireName: 'Name')
  String? get name;

  @BuiltValueField(wireName: 'University')
  String? get university;

  @BuiltValueField(wireName: 'Subject')
  String? get subject;

  @BuiltValueField(wireName: 'IsDownloadable')
  bool? get isDownloadable;

  @BuiltValueField(wireName: 'Photos')
  String? get photos;

  @BuiltValueField(wireName: 'Seller')
  String? get seller;

  DocumentReference? get userRef;

  double? get ratingSummary;

  bool? get isLive;

  bool? get isDraft;

  String? get description;

  String? get shippingMethod;

  String? get location;

  String? get pdf;

  bool? get isUploaded;

  DateTime? get postDate;

  bool? get therePhoto;

  double? get priceP;

  double? get fees;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..name = ''
    ..university = ''
    ..subject = ''
    ..isDownloadable = false
    ..photos = ''
    ..seller = ''
    ..ratingSummary = 0.0
    ..isLive = false
    ..isDraft = false
    ..description = ''
    ..shippingMethod = ''
    ..location = ''
    ..pdf = ''
    ..isUploaded = false
    ..therePhoto = false
    ..priceP = 0.0
    ..fees = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ProductsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProductsRecord(
        (c) => c
          ..name = snapshot.data['Name']
          ..university = snapshot.data['University']
          ..subject = snapshot.data['Subject']
          ..isDownloadable = snapshot.data['IsDownloadable']
          ..photos = snapshot.data['Photos']
          ..seller = snapshot.data['Seller']
          ..userRef = safeGet(() => toRef(snapshot.data['userRef']))
          ..ratingSummary = snapshot.data['ratingSummary']?.toDouble()
          ..isLive = snapshot.data['isLive']
          ..isDraft = snapshot.data['isDraft']
          ..description = snapshot.data['description']
          ..shippingMethod = snapshot.data['shippingMethod']
          ..location = snapshot.data['location']
          ..pdf = snapshot.data['pdf']
          ..isUploaded = snapshot.data['isUploaded']
          ..postDate = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['postDate']))
          ..therePhoto = snapshot.data['therePhoto']
          ..priceP = snapshot.data['priceP']?.toDouble()
          ..fees = snapshot.data['fees']?.toDouble()
          ..ffRef = ProductsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProductsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Products',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ProductsRecord._();
  factory ProductsRecord([void Function(ProductsRecordBuilder) updates]) =
      _$ProductsRecord;

  static ProductsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProductsRecordData({
  String? name,
  String? university,
  String? subject,
  bool? isDownloadable,
  String? photos,
  String? seller,
  DocumentReference? userRef,
  double? ratingSummary,
  bool? isLive,
  bool? isDraft,
  String? description,
  String? shippingMethod,
  String? location,
  String? pdf,
  bool? isUploaded,
  DateTime? postDate,
  bool? therePhoto,
  double? priceP,
  double? fees,
}) {
  final firestoreData = serializers.toFirestore(
    ProductsRecord.serializer,
    ProductsRecord(
      (p) => p
        ..name = name
        ..university = university
        ..subject = subject
        ..isDownloadable = isDownloadable
        ..photos = photos
        ..seller = seller
        ..userRef = userRef
        ..ratingSummary = ratingSummary
        ..isLive = isLive
        ..isDraft = isDraft
        ..description = description
        ..shippingMethod = shippingMethod
        ..location = location
        ..pdf = pdf
        ..isUploaded = isUploaded
        ..postDate = postDate
        ..therePhoto = therePhoto
        ..priceP = priceP
        ..fees = fees,
    ),
  );

  return firestoreData;
}
