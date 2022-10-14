// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReviewsRecord> _$reviewsRecordSerializer =
    new _$ReviewsRecordSerializer();

class _$ReviewsRecordSerializer implements StructuredSerializer<ReviewsRecord> {
  @override
  final Iterable<Type> types = const [ReviewsRecord, _$ReviewsRecord];
  @override
  final String wireName = 'ReviewsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReviewsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.productsRef;
    if (value != null) {
      result
        ..add('ProductsRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('Rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ratingDescription;
    if (value != null) {
      result
        ..add('RatingDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ratingCreated;
    if (value != null) {
      result
        ..add('RatingCreated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  ReviewsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReviewsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ProductsRef':
          result.productsRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'RatingDescription':
          result.ratingDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'RatingCreated':
          result.ratingCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$ReviewsRecord extends ReviewsRecord {
  @override
  final DocumentReference<Object?>? productsRef;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final double? rating;
  @override
  final String? ratingDescription;
  @override
  final DateTime? ratingCreated;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReviewsRecord([void Function(ReviewsRecordBuilder)? updates]) =>
      (new ReviewsRecordBuilder()..update(updates))._build();

  _$ReviewsRecord._(
      {this.productsRef,
      this.userRef,
      this.rating,
      this.ratingDescription,
      this.ratingCreated,
      this.ffRef})
      : super._();

  @override
  ReviewsRecord rebuild(void Function(ReviewsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewsRecordBuilder toBuilder() => new ReviewsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewsRecord &&
        productsRef == other.productsRef &&
        userRef == other.userRef &&
        rating == other.rating &&
        ratingDescription == other.ratingDescription &&
        ratingCreated == other.ratingCreated &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, productsRef.hashCode), userRef.hashCode),
                    rating.hashCode),
                ratingDescription.hashCode),
            ratingCreated.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewsRecord')
          ..add('productsRef', productsRef)
          ..add('userRef', userRef)
          ..add('rating', rating)
          ..add('ratingDescription', ratingDescription)
          ..add('ratingCreated', ratingCreated)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReviewsRecordBuilder
    implements Builder<ReviewsRecord, ReviewsRecordBuilder> {
  _$ReviewsRecord? _$v;

  DocumentReference<Object?>? _productsRef;
  DocumentReference<Object?>? get productsRef => _$this._productsRef;
  set productsRef(DocumentReference<Object?>? productsRef) =>
      _$this._productsRef = productsRef;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  double? _rating;
  double? get rating => _$this._rating;
  set rating(double? rating) => _$this._rating = rating;

  String? _ratingDescription;
  String? get ratingDescription => _$this._ratingDescription;
  set ratingDescription(String? ratingDescription) =>
      _$this._ratingDescription = ratingDescription;

  DateTime? _ratingCreated;
  DateTime? get ratingCreated => _$this._ratingCreated;
  set ratingCreated(DateTime? ratingCreated) =>
      _$this._ratingCreated = ratingCreated;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReviewsRecordBuilder() {
    ReviewsRecord._initializeBuilder(this);
  }

  ReviewsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _productsRef = $v.productsRef;
      _userRef = $v.userRef;
      _rating = $v.rating;
      _ratingDescription = $v.ratingDescription;
      _ratingCreated = $v.ratingCreated;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReviewsRecord;
  }

  @override
  void update(void Function(ReviewsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewsRecord build() => _build();

  _$ReviewsRecord _build() {
    final _$result = _$v ??
        new _$ReviewsRecord._(
            productsRef: productsRef,
            userRef: userRef,
            rating: rating,
            ratingDescription: ratingDescription,
            ratingCreated: ratingCreated,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
