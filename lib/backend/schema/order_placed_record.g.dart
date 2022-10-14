// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_placed_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderPlacedRecord> _$orderPlacedRecordSerializer =
    new _$OrderPlacedRecordSerializer();

class _$OrderPlacedRecordSerializer
    implements StructuredSerializer<OrderPlacedRecord> {
  @override
  final Iterable<Type> types = const [OrderPlacedRecord, _$OrderPlacedRecord];
  @override
  final String wireName = 'OrderPlacedRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrderPlacedRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.seller;
    if (value != null) {
      result
        ..add('seller')
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
    value = object.prodRef;
    if (value != null) {
      result
        ..add('ProdRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.numOrder;
    if (value != null) {
      result
        ..add('numOrder')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rated;
    if (value != null) {
      result
        ..add('rated')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.dateCreated;
    if (value != null) {
      result
        ..add('dateCreated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isNew;
    if (value != null) {
      result
        ..add('isNew')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isComplete;
    if (value != null) {
      result
        ..add('isComplete')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isRated;
    if (value != null) {
      result
        ..add('isRated')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.cancelOrder;
    if (value != null) {
      result
        ..add('cancelOrder')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.priceOrder;
    if (value != null) {
      result
        ..add('priceOrder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.cancelReason;
    if (value != null) {
      result
        ..add('cancelReason')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  OrderPlacedRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderPlacedRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'seller':
          result.seller = serializers.deserialize(value,
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
        case 'ProdRef':
          result.prodRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'numOrder':
          result.numOrder = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'rated':
          result.rated = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'dateCreated':
          result.dateCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isNew':
          result.isNew = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isComplete':
          result.isComplete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isRated':
          result.isRated = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'cancelOrder':
          result.cancelOrder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'priceOrder':
          result.priceOrder = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'cancelReason':
          result.cancelReason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$OrderPlacedRecord extends OrderPlacedRecord {
  @override
  final DocumentReference<Object?>? seller;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? prodRef;
  @override
  final int? numOrder;
  @override
  final bool? rated;
  @override
  final DateTime? dateCreated;
  @override
  final bool? isNew;
  @override
  final bool? isComplete;
  @override
  final bool? isRated;
  @override
  final bool? cancelOrder;
  @override
  final double? priceOrder;
  @override
  final String? cancelReason;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrderPlacedRecord(
          [void Function(OrderPlacedRecordBuilder)? updates]) =>
      (new OrderPlacedRecordBuilder()..update(updates))._build();

  _$OrderPlacedRecord._(
      {this.seller,
      this.userRef,
      this.prodRef,
      this.numOrder,
      this.rated,
      this.dateCreated,
      this.isNew,
      this.isComplete,
      this.isRated,
      this.cancelOrder,
      this.priceOrder,
      this.cancelReason,
      this.ffRef})
      : super._();

  @override
  OrderPlacedRecord rebuild(void Function(OrderPlacedRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderPlacedRecordBuilder toBuilder() =>
      new OrderPlacedRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderPlacedRecord &&
        seller == other.seller &&
        userRef == other.userRef &&
        prodRef == other.prodRef &&
        numOrder == other.numOrder &&
        rated == other.rated &&
        dateCreated == other.dateCreated &&
        isNew == other.isNew &&
        isComplete == other.isComplete &&
        isRated == other.isRated &&
        cancelOrder == other.cancelOrder &&
        priceOrder == other.priceOrder &&
        cancelReason == other.cancelReason &&
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
                                                $jc($jc(0, seller.hashCode),
                                                    userRef.hashCode),
                                                prodRef.hashCode),
                                            numOrder.hashCode),
                                        rated.hashCode),
                                    dateCreated.hashCode),
                                isNew.hashCode),
                            isComplete.hashCode),
                        isRated.hashCode),
                    cancelOrder.hashCode),
                priceOrder.hashCode),
            cancelReason.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderPlacedRecord')
          ..add('seller', seller)
          ..add('userRef', userRef)
          ..add('prodRef', prodRef)
          ..add('numOrder', numOrder)
          ..add('rated', rated)
          ..add('dateCreated', dateCreated)
          ..add('isNew', isNew)
          ..add('isComplete', isComplete)
          ..add('isRated', isRated)
          ..add('cancelOrder', cancelOrder)
          ..add('priceOrder', priceOrder)
          ..add('cancelReason', cancelReason)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrderPlacedRecordBuilder
    implements Builder<OrderPlacedRecord, OrderPlacedRecordBuilder> {
  _$OrderPlacedRecord? _$v;

  DocumentReference<Object?>? _seller;
  DocumentReference<Object?>? get seller => _$this._seller;
  set seller(DocumentReference<Object?>? seller) => _$this._seller = seller;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _prodRef;
  DocumentReference<Object?>? get prodRef => _$this._prodRef;
  set prodRef(DocumentReference<Object?>? prodRef) => _$this._prodRef = prodRef;

  int? _numOrder;
  int? get numOrder => _$this._numOrder;
  set numOrder(int? numOrder) => _$this._numOrder = numOrder;

  bool? _rated;
  bool? get rated => _$this._rated;
  set rated(bool? rated) => _$this._rated = rated;

  DateTime? _dateCreated;
  DateTime? get dateCreated => _$this._dateCreated;
  set dateCreated(DateTime? dateCreated) => _$this._dateCreated = dateCreated;

  bool? _isNew;
  bool? get isNew => _$this._isNew;
  set isNew(bool? isNew) => _$this._isNew = isNew;

  bool? _isComplete;
  bool? get isComplete => _$this._isComplete;
  set isComplete(bool? isComplete) => _$this._isComplete = isComplete;

  bool? _isRated;
  bool? get isRated => _$this._isRated;
  set isRated(bool? isRated) => _$this._isRated = isRated;

  bool? _cancelOrder;
  bool? get cancelOrder => _$this._cancelOrder;
  set cancelOrder(bool? cancelOrder) => _$this._cancelOrder = cancelOrder;

  double? _priceOrder;
  double? get priceOrder => _$this._priceOrder;
  set priceOrder(double? priceOrder) => _$this._priceOrder = priceOrder;

  String? _cancelReason;
  String? get cancelReason => _$this._cancelReason;
  set cancelReason(String? cancelReason) => _$this._cancelReason = cancelReason;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrderPlacedRecordBuilder() {
    OrderPlacedRecord._initializeBuilder(this);
  }

  OrderPlacedRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _seller = $v.seller;
      _userRef = $v.userRef;
      _prodRef = $v.prodRef;
      _numOrder = $v.numOrder;
      _rated = $v.rated;
      _dateCreated = $v.dateCreated;
      _isNew = $v.isNew;
      _isComplete = $v.isComplete;
      _isRated = $v.isRated;
      _cancelOrder = $v.cancelOrder;
      _priceOrder = $v.priceOrder;
      _cancelReason = $v.cancelReason;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderPlacedRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderPlacedRecord;
  }

  @override
  void update(void Function(OrderPlacedRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderPlacedRecord build() => _build();

  _$OrderPlacedRecord _build() {
    final _$result = _$v ??
        new _$OrderPlacedRecord._(
            seller: seller,
            userRef: userRef,
            prodRef: prodRef,
            numOrder: numOrder,
            rated: rated,
            dateCreated: dateCreated,
            isNew: isNew,
            isComplete: isComplete,
            isRated: isRated,
            cancelOrder: cancelOrder,
            priceOrder: priceOrder,
            cancelReason: cancelReason,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
