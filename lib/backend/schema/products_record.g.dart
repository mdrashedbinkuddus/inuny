// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductsRecord> _$productsRecordSerializer =
    new _$ProductsRecordSerializer();

class _$ProductsRecordSerializer
    implements StructuredSerializer<ProductsRecord> {
  @override
  final Iterable<Type> types = const [ProductsRecord, _$ProductsRecord];
  @override
  final String wireName = 'ProductsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('Name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.university;
    if (value != null) {
      result
        ..add('University')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subject;
    if (value != null) {
      result
        ..add('Subject')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isDownloadable;
    if (value != null) {
      result
        ..add('IsDownloadable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.photos;
    if (value != null) {
      result
        ..add('Photos')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.seller;
    if (value != null) {
      result
        ..add('Seller')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ratingSummary;
    if (value != null) {
      result
        ..add('ratingSummary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.isLive;
    if (value != null) {
      result
        ..add('isLive')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isDraft;
    if (value != null) {
      result
        ..add('isDraft')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shippingMethod;
    if (value != null) {
      result
        ..add('shippingMethod')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pdf;
    if (value != null) {
      result
        ..add('pdf')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isUploaded;
    if (value != null) {
      result
        ..add('isUploaded')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.postDate;
    if (value != null) {
      result
        ..add('postDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.therePhoto;
    if (value != null) {
      result
        ..add('therePhoto')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.priceP;
    if (value != null) {
      result
        ..add('priceP')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.fees;
    if (value != null) {
      result
        ..add('fees')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  ProductsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'University':
          result.university = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Subject':
          result.subject = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'IsDownloadable':
          result.isDownloadable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Photos':
          result.photos = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Seller':
          result.seller = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'ratingSummary':
          result.ratingSummary = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'isLive':
          result.isLive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isDraft':
          result.isDraft = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'shippingMethod':
          result.shippingMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pdf':
          result.pdf = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isUploaded':
          result.isUploaded = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'postDate':
          result.postDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'therePhoto':
          result.therePhoto = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'priceP':
          result.priceP = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'fees':
          result.fees = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$ProductsRecord extends ProductsRecord {
  @override
  final String? name;
  @override
  final String? university;
  @override
  final String? subject;
  @override
  final bool? isDownloadable;
  @override
  final String? photos;
  @override
  final String? seller;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final double? ratingSummary;
  @override
  final bool? isLive;
  @override
  final bool? isDraft;
  @override
  final String? description;
  @override
  final String? shippingMethod;
  @override
  final String? location;
  @override
  final String? pdf;
  @override
  final bool? isUploaded;
  @override
  final DateTime? postDate;
  @override
  final bool? therePhoto;
  @override
  final double? priceP;
  @override
  final double? fees;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProductsRecord([void Function(ProductsRecordBuilder)? updates]) =>
      (new ProductsRecordBuilder()..update(updates))._build();

  _$ProductsRecord._(
      {this.name,
      this.university,
      this.subject,
      this.isDownloadable,
      this.photos,
      this.seller,
      this.userRef,
      this.ratingSummary,
      this.isLive,
      this.isDraft,
      this.description,
      this.shippingMethod,
      this.location,
      this.pdf,
      this.isUploaded,
      this.postDate,
      this.therePhoto,
      this.priceP,
      this.fees,
      this.ffRef})
      : super._();

  @override
  ProductsRecord rebuild(void Function(ProductsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsRecordBuilder toBuilder() =>
      new ProductsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductsRecord &&
        name == other.name &&
        university == other.university &&
        subject == other.subject &&
        isDownloadable == other.isDownloadable &&
        photos == other.photos &&
        seller == other.seller &&
        userRef == other.userRef &&
        ratingSummary == other.ratingSummary &&
        isLive == other.isLive &&
        isDraft == other.isDraft &&
        description == other.description &&
        shippingMethod == other.shippingMethod &&
        location == other.location &&
        pdf == other.pdf &&
        isUploaded == other.isUploaded &&
        postDate == other.postDate &&
        therePhoto == other.therePhoto &&
        priceP == other.priceP &&
        fees == other.fees &&
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
                                                                            $jc($jc(0, name.hashCode),
                                                                                university.hashCode),
                                                                            subject.hashCode),
                                                                        isDownloadable.hashCode),
                                                                    photos.hashCode),
                                                                seller.hashCode),
                                                            userRef.hashCode),
                                                        ratingSummary.hashCode),
                                                    isLive.hashCode),
                                                isDraft.hashCode),
                                            description.hashCode),
                                        shippingMethod.hashCode),
                                    location.hashCode),
                                pdf.hashCode),
                            isUploaded.hashCode),
                        postDate.hashCode),
                    therePhoto.hashCode),
                priceP.hashCode),
            fees.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductsRecord')
          ..add('name', name)
          ..add('university', university)
          ..add('subject', subject)
          ..add('isDownloadable', isDownloadable)
          ..add('photos', photos)
          ..add('seller', seller)
          ..add('userRef', userRef)
          ..add('ratingSummary', ratingSummary)
          ..add('isLive', isLive)
          ..add('isDraft', isDraft)
          ..add('description', description)
          ..add('shippingMethod', shippingMethod)
          ..add('location', location)
          ..add('pdf', pdf)
          ..add('isUploaded', isUploaded)
          ..add('postDate', postDate)
          ..add('therePhoto', therePhoto)
          ..add('priceP', priceP)
          ..add('fees', fees)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProductsRecordBuilder
    implements Builder<ProductsRecord, ProductsRecordBuilder> {
  _$ProductsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _university;
  String? get university => _$this._university;
  set university(String? university) => _$this._university = university;

  String? _subject;
  String? get subject => _$this._subject;
  set subject(String? subject) => _$this._subject = subject;

  bool? _isDownloadable;
  bool? get isDownloadable => _$this._isDownloadable;
  set isDownloadable(bool? isDownloadable) =>
      _$this._isDownloadable = isDownloadable;

  String? _photos;
  String? get photos => _$this._photos;
  set photos(String? photos) => _$this._photos = photos;

  String? _seller;
  String? get seller => _$this._seller;
  set seller(String? seller) => _$this._seller = seller;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  double? _ratingSummary;
  double? get ratingSummary => _$this._ratingSummary;
  set ratingSummary(double? ratingSummary) =>
      _$this._ratingSummary = ratingSummary;

  bool? _isLive;
  bool? get isLive => _$this._isLive;
  set isLive(bool? isLive) => _$this._isLive = isLive;

  bool? _isDraft;
  bool? get isDraft => _$this._isDraft;
  set isDraft(bool? isDraft) => _$this._isDraft = isDraft;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _shippingMethod;
  String? get shippingMethod => _$this._shippingMethod;
  set shippingMethod(String? shippingMethod) =>
      _$this._shippingMethod = shippingMethod;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _pdf;
  String? get pdf => _$this._pdf;
  set pdf(String? pdf) => _$this._pdf = pdf;

  bool? _isUploaded;
  bool? get isUploaded => _$this._isUploaded;
  set isUploaded(bool? isUploaded) => _$this._isUploaded = isUploaded;

  DateTime? _postDate;
  DateTime? get postDate => _$this._postDate;
  set postDate(DateTime? postDate) => _$this._postDate = postDate;

  bool? _therePhoto;
  bool? get therePhoto => _$this._therePhoto;
  set therePhoto(bool? therePhoto) => _$this._therePhoto = therePhoto;

  double? _priceP;
  double? get priceP => _$this._priceP;
  set priceP(double? priceP) => _$this._priceP = priceP;

  double? _fees;
  double? get fees => _$this._fees;
  set fees(double? fees) => _$this._fees = fees;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProductsRecordBuilder() {
    ProductsRecord._initializeBuilder(this);
  }

  ProductsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _university = $v.university;
      _subject = $v.subject;
      _isDownloadable = $v.isDownloadable;
      _photos = $v.photos;
      _seller = $v.seller;
      _userRef = $v.userRef;
      _ratingSummary = $v.ratingSummary;
      _isLive = $v.isLive;
      _isDraft = $v.isDraft;
      _description = $v.description;
      _shippingMethod = $v.shippingMethod;
      _location = $v.location;
      _pdf = $v.pdf;
      _isUploaded = $v.isUploaded;
      _postDate = $v.postDate;
      _therePhoto = $v.therePhoto;
      _priceP = $v.priceP;
      _fees = $v.fees;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductsRecord;
  }

  @override
  void update(void Function(ProductsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductsRecord build() => _build();

  _$ProductsRecord _build() {
    final _$result = _$v ??
        new _$ProductsRecord._(
            name: name,
            university: university,
            subject: subject,
            isDownloadable: isDownloadable,
            photos: photos,
            seller: seller,
            userRef: userRef,
            ratingSummary: ratingSummary,
            isLive: isLive,
            isDraft: isDraft,
            description: description,
            shippingMethod: shippingMethod,
            location: location,
            pdf: pdf,
            isUploaded: isUploaded,
            postDate: postDate,
            therePhoto: therePhoto,
            priceP: priceP,
            fees: fees,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
