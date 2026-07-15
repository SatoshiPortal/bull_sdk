// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecipientView {

 String get address; BigInt get amountSat; bool get isMax;
/// Create a copy of RecipientView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipientViewCopyWith<RecipientView> get copyWith => _$RecipientViewCopyWithImpl<RecipientView>(this as RecipientView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipientView&&(identical(other.address, address) || other.address == address)&&(identical(other.amountSat, amountSat) || other.amountSat == amountSat)&&(identical(other.isMax, isMax) || other.isMax == isMax));
}


@override
int get hashCode => Object.hash(runtimeType,address,amountSat,isMax);

@override
String toString() {
  return 'RecipientView(address: $address, amountSat: $amountSat, isMax: $isMax)';
}


}

/// @nodoc
abstract mixin class $RecipientViewCopyWith<$Res>  {
  factory $RecipientViewCopyWith(RecipientView value, $Res Function(RecipientView) _then) = _$RecipientViewCopyWithImpl;
@useResult
$Res call({
 String address, BigInt amountSat, bool isMax
});




}
/// @nodoc
class _$RecipientViewCopyWithImpl<$Res>
    implements $RecipientViewCopyWith<$Res> {
  _$RecipientViewCopyWithImpl(this._self, this._then);

  final RecipientView _self;
  final $Res Function(RecipientView) _then;

/// Create a copy of RecipientView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? amountSat = null,Object? isMax = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,amountSat: null == amountSat ? _self.amountSat : amountSat // ignore: cast_nullable_to_non_nullable
as BigInt,isMax: null == isMax ? _self.isMax : isMax // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipientView].
extension RecipientViewPatterns on RecipientView {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RecipientView_Sp value)?  sp,TResult Function( RecipientView_Standard value)?  standard,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RecipientView_Sp() when sp != null:
return sp(_that);case RecipientView_Standard() when standard != null:
return standard(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RecipientView_Sp value)  sp,required TResult Function( RecipientView_Standard value)  standard,}){
final _that = this;
switch (_that) {
case RecipientView_Sp():
return sp(_that);case RecipientView_Standard():
return standard(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RecipientView_Sp value)?  sp,TResult? Function( RecipientView_Standard value)?  standard,}){
final _that = this;
switch (_that) {
case RecipientView_Sp() when sp != null:
return sp(_that);case RecipientView_Standard() when standard != null:
return standard(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String address,  BigInt amountSat,  int? label,  bool isMax)?  sp,TResult Function( String address,  BigInt amountSat,  bool isMax)?  standard,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RecipientView_Sp() when sp != null:
return sp(_that.address,_that.amountSat,_that.label,_that.isMax);case RecipientView_Standard() when standard != null:
return standard(_that.address,_that.amountSat,_that.isMax);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String address,  BigInt amountSat,  int? label,  bool isMax)  sp,required TResult Function( String address,  BigInt amountSat,  bool isMax)  standard,}) {final _that = this;
switch (_that) {
case RecipientView_Sp():
return sp(_that.address,_that.amountSat,_that.label,_that.isMax);case RecipientView_Standard():
return standard(_that.address,_that.amountSat,_that.isMax);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String address,  BigInt amountSat,  int? label,  bool isMax)?  sp,TResult? Function( String address,  BigInt amountSat,  bool isMax)?  standard,}) {final _that = this;
switch (_that) {
case RecipientView_Sp() when sp != null:
return sp(_that.address,_that.amountSat,_that.label,_that.isMax);case RecipientView_Standard() when standard != null:
return standard(_that.address,_that.amountSat,_that.isMax);case _:
  return null;

}
}

}

/// @nodoc


class RecipientView_Sp extends RecipientView {
  const RecipientView_Sp({required this.address, required this.amountSat, this.label, required this.isMax}): super._();
  

@override final  String address;
@override final  BigInt amountSat;
 final  int? label;
@override final  bool isMax;

/// Create a copy of RecipientView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipientView_SpCopyWith<RecipientView_Sp> get copyWith => _$RecipientView_SpCopyWithImpl<RecipientView_Sp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipientView_Sp&&(identical(other.address, address) || other.address == address)&&(identical(other.amountSat, amountSat) || other.amountSat == amountSat)&&(identical(other.label, label) || other.label == label)&&(identical(other.isMax, isMax) || other.isMax == isMax));
}


@override
int get hashCode => Object.hash(runtimeType,address,amountSat,label,isMax);

@override
String toString() {
  return 'RecipientView.sp(address: $address, amountSat: $amountSat, label: $label, isMax: $isMax)';
}


}

/// @nodoc
abstract mixin class $RecipientView_SpCopyWith<$Res> implements $RecipientViewCopyWith<$Res> {
  factory $RecipientView_SpCopyWith(RecipientView_Sp value, $Res Function(RecipientView_Sp) _then) = _$RecipientView_SpCopyWithImpl;
@override @useResult
$Res call({
 String address, BigInt amountSat, int? label, bool isMax
});




}
/// @nodoc
class _$RecipientView_SpCopyWithImpl<$Res>
    implements $RecipientView_SpCopyWith<$Res> {
  _$RecipientView_SpCopyWithImpl(this._self, this._then);

  final RecipientView_Sp _self;
  final $Res Function(RecipientView_Sp) _then;

/// Create a copy of RecipientView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? amountSat = null,Object? label = freezed,Object? isMax = null,}) {
  return _then(RecipientView_Sp(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,amountSat: null == amountSat ? _self.amountSat : amountSat // ignore: cast_nullable_to_non_nullable
as BigInt,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as int?,isMax: null == isMax ? _self.isMax : isMax // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class RecipientView_Standard extends RecipientView {
  const RecipientView_Standard({required this.address, required this.amountSat, required this.isMax}): super._();
  

@override final  String address;
@override final  BigInt amountSat;
@override final  bool isMax;

/// Create a copy of RecipientView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipientView_StandardCopyWith<RecipientView_Standard> get copyWith => _$RecipientView_StandardCopyWithImpl<RecipientView_Standard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipientView_Standard&&(identical(other.address, address) || other.address == address)&&(identical(other.amountSat, amountSat) || other.amountSat == amountSat)&&(identical(other.isMax, isMax) || other.isMax == isMax));
}


@override
int get hashCode => Object.hash(runtimeType,address,amountSat,isMax);

@override
String toString() {
  return 'RecipientView.standard(address: $address, amountSat: $amountSat, isMax: $isMax)';
}


}

/// @nodoc
abstract mixin class $RecipientView_StandardCopyWith<$Res> implements $RecipientViewCopyWith<$Res> {
  factory $RecipientView_StandardCopyWith(RecipientView_Standard value, $Res Function(RecipientView_Standard) _then) = _$RecipientView_StandardCopyWithImpl;
@override @useResult
$Res call({
 String address, BigInt amountSat, bool isMax
});




}
/// @nodoc
class _$RecipientView_StandardCopyWithImpl<$Res>
    implements $RecipientView_StandardCopyWith<$Res> {
  _$RecipientView_StandardCopyWithImpl(this._self, this._then);

  final RecipientView_Standard _self;
  final $Res Function(RecipientView_Standard) _then;

/// Create a copy of RecipientView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? amountSat = null,Object? isMax = null,}) {
  return _then(RecipientView_Standard(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,amountSat: null == amountSat ? _self.amountSat : amountSat // ignore: cast_nullable_to_non_nullable
as BigInt,isMax: null == isMax ? _self.isMax : isMax // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SpNotification {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpNotification()';
}


}

/// @nodoc
class $SpNotificationCopyWith<$Res>  {
$SpNotificationCopyWith(SpNotification _, $Res Function(SpNotification) __);
}


/// Adds pattern-matching-related methods to [SpNotification].
extension SpNotificationPatterns on SpNotification {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SpNotification_ScanStarted value)?  scanStarted,TResult Function( SpNotification_ScanReceiveProgress value)?  scanReceiveProgress,TResult Function( SpNotification_ScanCompleted value)?  scanCompleted,TResult Function( SpNotification_ScanStopped value)?  scanStopped,TResult Function( SpNotification_ScanFailed value)?  scanFailed,TResult Function( SpNotification_NewOutput value)?  newOutput,TResult Function( SpNotification_OutputSpent value)?  outputSpent,TResult Function( SpNotification_Broadcasted value)?  broadcasted,TResult Function( SpNotification_BroadcastFailed value)?  broadcastFailed,TResult Function( SpNotification_BackendOffline value)?  backendOffline,TResult Function( SpNotification_ElectrumTx value)?  electrumTx,TResult Function( SpNotification_ScanSpendProgress value)?  scanSpendProgress,TResult Function( SpNotification_HeaderProgressStarted value)?  headerProgressStarted,TResult Function( SpNotification_HeaderProgress value)?  headerProgress,TResult Function( SpNotification_HeaderProgressCompleted value)?  headerProgressCompleted,TResult Function( SpNotification_HeaderProgressFailed value)?  headerProgressFailed,TResult Function( SpNotification_PaymentHistoryUpdated value)?  paymentHistoryUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SpNotification_ScanStarted() when scanStarted != null:
return scanStarted(_that);case SpNotification_ScanReceiveProgress() when scanReceiveProgress != null:
return scanReceiveProgress(_that);case SpNotification_ScanCompleted() when scanCompleted != null:
return scanCompleted(_that);case SpNotification_ScanStopped() when scanStopped != null:
return scanStopped(_that);case SpNotification_ScanFailed() when scanFailed != null:
return scanFailed(_that);case SpNotification_NewOutput() when newOutput != null:
return newOutput(_that);case SpNotification_OutputSpent() when outputSpent != null:
return outputSpent(_that);case SpNotification_Broadcasted() when broadcasted != null:
return broadcasted(_that);case SpNotification_BroadcastFailed() when broadcastFailed != null:
return broadcastFailed(_that);case SpNotification_BackendOffline() when backendOffline != null:
return backendOffline(_that);case SpNotification_ElectrumTx() when electrumTx != null:
return electrumTx(_that);case SpNotification_ScanSpendProgress() when scanSpendProgress != null:
return scanSpendProgress(_that);case SpNotification_HeaderProgressStarted() when headerProgressStarted != null:
return headerProgressStarted(_that);case SpNotification_HeaderProgress() when headerProgress != null:
return headerProgress(_that);case SpNotification_HeaderProgressCompleted() when headerProgressCompleted != null:
return headerProgressCompleted(_that);case SpNotification_HeaderProgressFailed() when headerProgressFailed != null:
return headerProgressFailed(_that);case SpNotification_PaymentHistoryUpdated() when paymentHistoryUpdated != null:
return paymentHistoryUpdated(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SpNotification_ScanStarted value)  scanStarted,required TResult Function( SpNotification_ScanReceiveProgress value)  scanReceiveProgress,required TResult Function( SpNotification_ScanCompleted value)  scanCompleted,required TResult Function( SpNotification_ScanStopped value)  scanStopped,required TResult Function( SpNotification_ScanFailed value)  scanFailed,required TResult Function( SpNotification_NewOutput value)  newOutput,required TResult Function( SpNotification_OutputSpent value)  outputSpent,required TResult Function( SpNotification_Broadcasted value)  broadcasted,required TResult Function( SpNotification_BroadcastFailed value)  broadcastFailed,required TResult Function( SpNotification_BackendOffline value)  backendOffline,required TResult Function( SpNotification_ElectrumTx value)  electrumTx,required TResult Function( SpNotification_ScanSpendProgress value)  scanSpendProgress,required TResult Function( SpNotification_HeaderProgressStarted value)  headerProgressStarted,required TResult Function( SpNotification_HeaderProgress value)  headerProgress,required TResult Function( SpNotification_HeaderProgressCompleted value)  headerProgressCompleted,required TResult Function( SpNotification_HeaderProgressFailed value)  headerProgressFailed,required TResult Function( SpNotification_PaymentHistoryUpdated value)  paymentHistoryUpdated,}){
final _that = this;
switch (_that) {
case SpNotification_ScanStarted():
return scanStarted(_that);case SpNotification_ScanReceiveProgress():
return scanReceiveProgress(_that);case SpNotification_ScanCompleted():
return scanCompleted(_that);case SpNotification_ScanStopped():
return scanStopped(_that);case SpNotification_ScanFailed():
return scanFailed(_that);case SpNotification_NewOutput():
return newOutput(_that);case SpNotification_OutputSpent():
return outputSpent(_that);case SpNotification_Broadcasted():
return broadcasted(_that);case SpNotification_BroadcastFailed():
return broadcastFailed(_that);case SpNotification_BackendOffline():
return backendOffline(_that);case SpNotification_ElectrumTx():
return electrumTx(_that);case SpNotification_ScanSpendProgress():
return scanSpendProgress(_that);case SpNotification_HeaderProgressStarted():
return headerProgressStarted(_that);case SpNotification_HeaderProgress():
return headerProgress(_that);case SpNotification_HeaderProgressCompleted():
return headerProgressCompleted(_that);case SpNotification_HeaderProgressFailed():
return headerProgressFailed(_that);case SpNotification_PaymentHistoryUpdated():
return paymentHistoryUpdated(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SpNotification_ScanStarted value)?  scanStarted,TResult? Function( SpNotification_ScanReceiveProgress value)?  scanReceiveProgress,TResult? Function( SpNotification_ScanCompleted value)?  scanCompleted,TResult? Function( SpNotification_ScanStopped value)?  scanStopped,TResult? Function( SpNotification_ScanFailed value)?  scanFailed,TResult? Function( SpNotification_NewOutput value)?  newOutput,TResult? Function( SpNotification_OutputSpent value)?  outputSpent,TResult? Function( SpNotification_Broadcasted value)?  broadcasted,TResult? Function( SpNotification_BroadcastFailed value)?  broadcastFailed,TResult? Function( SpNotification_BackendOffline value)?  backendOffline,TResult? Function( SpNotification_ElectrumTx value)?  electrumTx,TResult? Function( SpNotification_ScanSpendProgress value)?  scanSpendProgress,TResult? Function( SpNotification_HeaderProgressStarted value)?  headerProgressStarted,TResult? Function( SpNotification_HeaderProgress value)?  headerProgress,TResult? Function( SpNotification_HeaderProgressCompleted value)?  headerProgressCompleted,TResult? Function( SpNotification_HeaderProgressFailed value)?  headerProgressFailed,TResult? Function( SpNotification_PaymentHistoryUpdated value)?  paymentHistoryUpdated,}){
final _that = this;
switch (_that) {
case SpNotification_ScanStarted() when scanStarted != null:
return scanStarted(_that);case SpNotification_ScanReceiveProgress() when scanReceiveProgress != null:
return scanReceiveProgress(_that);case SpNotification_ScanCompleted() when scanCompleted != null:
return scanCompleted(_that);case SpNotification_ScanStopped() when scanStopped != null:
return scanStopped(_that);case SpNotification_ScanFailed() when scanFailed != null:
return scanFailed(_that);case SpNotification_NewOutput() when newOutput != null:
return newOutput(_that);case SpNotification_OutputSpent() when outputSpent != null:
return outputSpent(_that);case SpNotification_Broadcasted() when broadcasted != null:
return broadcasted(_that);case SpNotification_BroadcastFailed() when broadcastFailed != null:
return broadcastFailed(_that);case SpNotification_BackendOffline() when backendOffline != null:
return backendOffline(_that);case SpNotification_ElectrumTx() when electrumTx != null:
return electrumTx(_that);case SpNotification_ScanSpendProgress() when scanSpendProgress != null:
return scanSpendProgress(_that);case SpNotification_HeaderProgressStarted() when headerProgressStarted != null:
return headerProgressStarted(_that);case SpNotification_HeaderProgress() when headerProgress != null:
return headerProgress(_that);case SpNotification_HeaderProgressCompleted() when headerProgressCompleted != null:
return headerProgressCompleted(_that);case SpNotification_HeaderProgressFailed() when headerProgressFailed != null:
return headerProgressFailed(_that);case SpNotification_PaymentHistoryUpdated() when paymentHistoryUpdated != null:
return paymentHistoryUpdated(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int from,  int to)?  scanStarted,TResult Function( int current,  int end)?  scanReceiveProgress,TResult Function()?  scanCompleted,TResult Function()?  scanStopped,TResult Function( String message)?  scanFailed,TResult Function( String outpoint,  BigInt amountSat)?  newOutput,TResult Function( String outpoint)?  outputSpent,TResult Function( String txid)?  broadcasted,TResult Function( String message)?  broadcastFailed,TResult Function()?  backendOffline,TResult Function( CoinSource kind,  String txid,  BigInt amountSat,  int? height)?  electrumTx,TResult Function( int current,  int end)?  scanSpendProgress,TResult Function( HeaderProgressPhase phase,  int start,  int end)?  headerProgressStarted,TResult Function( HeaderProgressPhase phase,  int current,  int end)?  headerProgress,TResult Function( HeaderProgressPhase phase)?  headerProgressCompleted,TResult Function( HeaderProgressPhase phase)?  headerProgressFailed,TResult Function()?  paymentHistoryUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SpNotification_ScanStarted() when scanStarted != null:
return scanStarted(_that.from,_that.to);case SpNotification_ScanReceiveProgress() when scanReceiveProgress != null:
return scanReceiveProgress(_that.current,_that.end);case SpNotification_ScanCompleted() when scanCompleted != null:
return scanCompleted();case SpNotification_ScanStopped() when scanStopped != null:
return scanStopped();case SpNotification_ScanFailed() when scanFailed != null:
return scanFailed(_that.message);case SpNotification_NewOutput() when newOutput != null:
return newOutput(_that.outpoint,_that.amountSat);case SpNotification_OutputSpent() when outputSpent != null:
return outputSpent(_that.outpoint);case SpNotification_Broadcasted() when broadcasted != null:
return broadcasted(_that.txid);case SpNotification_BroadcastFailed() when broadcastFailed != null:
return broadcastFailed(_that.message);case SpNotification_BackendOffline() when backendOffline != null:
return backendOffline();case SpNotification_ElectrumTx() when electrumTx != null:
return electrumTx(_that.kind,_that.txid,_that.amountSat,_that.height);case SpNotification_ScanSpendProgress() when scanSpendProgress != null:
return scanSpendProgress(_that.current,_that.end);case SpNotification_HeaderProgressStarted() when headerProgressStarted != null:
return headerProgressStarted(_that.phase,_that.start,_that.end);case SpNotification_HeaderProgress() when headerProgress != null:
return headerProgress(_that.phase,_that.current,_that.end);case SpNotification_HeaderProgressCompleted() when headerProgressCompleted != null:
return headerProgressCompleted(_that.phase);case SpNotification_HeaderProgressFailed() when headerProgressFailed != null:
return headerProgressFailed(_that.phase);case SpNotification_PaymentHistoryUpdated() when paymentHistoryUpdated != null:
return paymentHistoryUpdated();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int from,  int to)  scanStarted,required TResult Function( int current,  int end)  scanReceiveProgress,required TResult Function()  scanCompleted,required TResult Function()  scanStopped,required TResult Function( String message)  scanFailed,required TResult Function( String outpoint,  BigInt amountSat)  newOutput,required TResult Function( String outpoint)  outputSpent,required TResult Function( String txid)  broadcasted,required TResult Function( String message)  broadcastFailed,required TResult Function()  backendOffline,required TResult Function( CoinSource kind,  String txid,  BigInt amountSat,  int? height)  electrumTx,required TResult Function( int current,  int end)  scanSpendProgress,required TResult Function( HeaderProgressPhase phase,  int start,  int end)  headerProgressStarted,required TResult Function( HeaderProgressPhase phase,  int current,  int end)  headerProgress,required TResult Function( HeaderProgressPhase phase)  headerProgressCompleted,required TResult Function( HeaderProgressPhase phase)  headerProgressFailed,required TResult Function()  paymentHistoryUpdated,}) {final _that = this;
switch (_that) {
case SpNotification_ScanStarted():
return scanStarted(_that.from,_that.to);case SpNotification_ScanReceiveProgress():
return scanReceiveProgress(_that.current,_that.end);case SpNotification_ScanCompleted():
return scanCompleted();case SpNotification_ScanStopped():
return scanStopped();case SpNotification_ScanFailed():
return scanFailed(_that.message);case SpNotification_NewOutput():
return newOutput(_that.outpoint,_that.amountSat);case SpNotification_OutputSpent():
return outputSpent(_that.outpoint);case SpNotification_Broadcasted():
return broadcasted(_that.txid);case SpNotification_BroadcastFailed():
return broadcastFailed(_that.message);case SpNotification_BackendOffline():
return backendOffline();case SpNotification_ElectrumTx():
return electrumTx(_that.kind,_that.txid,_that.amountSat,_that.height);case SpNotification_ScanSpendProgress():
return scanSpendProgress(_that.current,_that.end);case SpNotification_HeaderProgressStarted():
return headerProgressStarted(_that.phase,_that.start,_that.end);case SpNotification_HeaderProgress():
return headerProgress(_that.phase,_that.current,_that.end);case SpNotification_HeaderProgressCompleted():
return headerProgressCompleted(_that.phase);case SpNotification_HeaderProgressFailed():
return headerProgressFailed(_that.phase);case SpNotification_PaymentHistoryUpdated():
return paymentHistoryUpdated();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int from,  int to)?  scanStarted,TResult? Function( int current,  int end)?  scanReceiveProgress,TResult? Function()?  scanCompleted,TResult? Function()?  scanStopped,TResult? Function( String message)?  scanFailed,TResult? Function( String outpoint,  BigInt amountSat)?  newOutput,TResult? Function( String outpoint)?  outputSpent,TResult? Function( String txid)?  broadcasted,TResult? Function( String message)?  broadcastFailed,TResult? Function()?  backendOffline,TResult? Function( CoinSource kind,  String txid,  BigInt amountSat,  int? height)?  electrumTx,TResult? Function( int current,  int end)?  scanSpendProgress,TResult? Function( HeaderProgressPhase phase,  int start,  int end)?  headerProgressStarted,TResult? Function( HeaderProgressPhase phase,  int current,  int end)?  headerProgress,TResult? Function( HeaderProgressPhase phase)?  headerProgressCompleted,TResult? Function( HeaderProgressPhase phase)?  headerProgressFailed,TResult? Function()?  paymentHistoryUpdated,}) {final _that = this;
switch (_that) {
case SpNotification_ScanStarted() when scanStarted != null:
return scanStarted(_that.from,_that.to);case SpNotification_ScanReceiveProgress() when scanReceiveProgress != null:
return scanReceiveProgress(_that.current,_that.end);case SpNotification_ScanCompleted() when scanCompleted != null:
return scanCompleted();case SpNotification_ScanStopped() when scanStopped != null:
return scanStopped();case SpNotification_ScanFailed() when scanFailed != null:
return scanFailed(_that.message);case SpNotification_NewOutput() when newOutput != null:
return newOutput(_that.outpoint,_that.amountSat);case SpNotification_OutputSpent() when outputSpent != null:
return outputSpent(_that.outpoint);case SpNotification_Broadcasted() when broadcasted != null:
return broadcasted(_that.txid);case SpNotification_BroadcastFailed() when broadcastFailed != null:
return broadcastFailed(_that.message);case SpNotification_BackendOffline() when backendOffline != null:
return backendOffline();case SpNotification_ElectrumTx() when electrumTx != null:
return electrumTx(_that.kind,_that.txid,_that.amountSat,_that.height);case SpNotification_ScanSpendProgress() when scanSpendProgress != null:
return scanSpendProgress(_that.current,_that.end);case SpNotification_HeaderProgressStarted() when headerProgressStarted != null:
return headerProgressStarted(_that.phase,_that.start,_that.end);case SpNotification_HeaderProgress() when headerProgress != null:
return headerProgress(_that.phase,_that.current,_that.end);case SpNotification_HeaderProgressCompleted() when headerProgressCompleted != null:
return headerProgressCompleted(_that.phase);case SpNotification_HeaderProgressFailed() when headerProgressFailed != null:
return headerProgressFailed(_that.phase);case SpNotification_PaymentHistoryUpdated() when paymentHistoryUpdated != null:
return paymentHistoryUpdated();case _:
  return null;

}
}

}

/// @nodoc


class SpNotification_ScanStarted extends SpNotification {
  const SpNotification_ScanStarted({required this.from, required this.to}): super._();
  

 final  int from;
 final  int to;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpNotification_ScanStartedCopyWith<SpNotification_ScanStarted> get copyWith => _$SpNotification_ScanStartedCopyWithImpl<SpNotification_ScanStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_ScanStarted&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}


@override
int get hashCode => Object.hash(runtimeType,from,to);

@override
String toString() {
  return 'SpNotification.scanStarted(from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class $SpNotification_ScanStartedCopyWith<$Res> implements $SpNotificationCopyWith<$Res> {
  factory $SpNotification_ScanStartedCopyWith(SpNotification_ScanStarted value, $Res Function(SpNotification_ScanStarted) _then) = _$SpNotification_ScanStartedCopyWithImpl;
@useResult
$Res call({
 int from, int to
});




}
/// @nodoc
class _$SpNotification_ScanStartedCopyWithImpl<$Res>
    implements $SpNotification_ScanStartedCopyWith<$Res> {
  _$SpNotification_ScanStartedCopyWithImpl(this._self, this._then);

  final SpNotification_ScanStarted _self;
  final $Res Function(SpNotification_ScanStarted) _then;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,}) {
  return _then(SpNotification_ScanStarted(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SpNotification_ScanReceiveProgress extends SpNotification {
  const SpNotification_ScanReceiveProgress({required this.current, required this.end}): super._();
  

 final  int current;
 final  int end;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpNotification_ScanReceiveProgressCopyWith<SpNotification_ScanReceiveProgress> get copyWith => _$SpNotification_ScanReceiveProgressCopyWithImpl<SpNotification_ScanReceiveProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_ScanReceiveProgress&&(identical(other.current, current) || other.current == current)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,current,end);

@override
String toString() {
  return 'SpNotification.scanReceiveProgress(current: $current, end: $end)';
}


}

/// @nodoc
abstract mixin class $SpNotification_ScanReceiveProgressCopyWith<$Res> implements $SpNotificationCopyWith<$Res> {
  factory $SpNotification_ScanReceiveProgressCopyWith(SpNotification_ScanReceiveProgress value, $Res Function(SpNotification_ScanReceiveProgress) _then) = _$SpNotification_ScanReceiveProgressCopyWithImpl;
@useResult
$Res call({
 int current, int end
});




}
/// @nodoc
class _$SpNotification_ScanReceiveProgressCopyWithImpl<$Res>
    implements $SpNotification_ScanReceiveProgressCopyWith<$Res> {
  _$SpNotification_ScanReceiveProgressCopyWithImpl(this._self, this._then);

  final SpNotification_ScanReceiveProgress _self;
  final $Res Function(SpNotification_ScanReceiveProgress) _then;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? current = null,Object? end = null,}) {
  return _then(SpNotification_ScanReceiveProgress(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SpNotification_ScanCompleted extends SpNotification {
  const SpNotification_ScanCompleted(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_ScanCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpNotification.scanCompleted()';
}


}




/// @nodoc


class SpNotification_ScanStopped extends SpNotification {
  const SpNotification_ScanStopped(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_ScanStopped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpNotification.scanStopped()';
}


}




/// @nodoc


class SpNotification_ScanFailed extends SpNotification {
  const SpNotification_ScanFailed({required this.message}): super._();
  

 final  String message;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpNotification_ScanFailedCopyWith<SpNotification_ScanFailed> get copyWith => _$SpNotification_ScanFailedCopyWithImpl<SpNotification_ScanFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_ScanFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SpNotification.scanFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $SpNotification_ScanFailedCopyWith<$Res> implements $SpNotificationCopyWith<$Res> {
  factory $SpNotification_ScanFailedCopyWith(SpNotification_ScanFailed value, $Res Function(SpNotification_ScanFailed) _then) = _$SpNotification_ScanFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SpNotification_ScanFailedCopyWithImpl<$Res>
    implements $SpNotification_ScanFailedCopyWith<$Res> {
  _$SpNotification_ScanFailedCopyWithImpl(this._self, this._then);

  final SpNotification_ScanFailed _self;
  final $Res Function(SpNotification_ScanFailed) _then;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SpNotification_ScanFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SpNotification_NewOutput extends SpNotification {
  const SpNotification_NewOutput({required this.outpoint, required this.amountSat}): super._();
  

 final  String outpoint;
 final  BigInt amountSat;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpNotification_NewOutputCopyWith<SpNotification_NewOutput> get copyWith => _$SpNotification_NewOutputCopyWithImpl<SpNotification_NewOutput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_NewOutput&&(identical(other.outpoint, outpoint) || other.outpoint == outpoint)&&(identical(other.amountSat, amountSat) || other.amountSat == amountSat));
}


@override
int get hashCode => Object.hash(runtimeType,outpoint,amountSat);

@override
String toString() {
  return 'SpNotification.newOutput(outpoint: $outpoint, amountSat: $amountSat)';
}


}

/// @nodoc
abstract mixin class $SpNotification_NewOutputCopyWith<$Res> implements $SpNotificationCopyWith<$Res> {
  factory $SpNotification_NewOutputCopyWith(SpNotification_NewOutput value, $Res Function(SpNotification_NewOutput) _then) = _$SpNotification_NewOutputCopyWithImpl;
@useResult
$Res call({
 String outpoint, BigInt amountSat
});




}
/// @nodoc
class _$SpNotification_NewOutputCopyWithImpl<$Res>
    implements $SpNotification_NewOutputCopyWith<$Res> {
  _$SpNotification_NewOutputCopyWithImpl(this._self, this._then);

  final SpNotification_NewOutput _self;
  final $Res Function(SpNotification_NewOutput) _then;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? outpoint = null,Object? amountSat = null,}) {
  return _then(SpNotification_NewOutput(
outpoint: null == outpoint ? _self.outpoint : outpoint // ignore: cast_nullable_to_non_nullable
as String,amountSat: null == amountSat ? _self.amountSat : amountSat // ignore: cast_nullable_to_non_nullable
as BigInt,
  ));
}


}

/// @nodoc


class SpNotification_OutputSpent extends SpNotification {
  const SpNotification_OutputSpent({required this.outpoint}): super._();
  

 final  String outpoint;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpNotification_OutputSpentCopyWith<SpNotification_OutputSpent> get copyWith => _$SpNotification_OutputSpentCopyWithImpl<SpNotification_OutputSpent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_OutputSpent&&(identical(other.outpoint, outpoint) || other.outpoint == outpoint));
}


@override
int get hashCode => Object.hash(runtimeType,outpoint);

@override
String toString() {
  return 'SpNotification.outputSpent(outpoint: $outpoint)';
}


}

/// @nodoc
abstract mixin class $SpNotification_OutputSpentCopyWith<$Res> implements $SpNotificationCopyWith<$Res> {
  factory $SpNotification_OutputSpentCopyWith(SpNotification_OutputSpent value, $Res Function(SpNotification_OutputSpent) _then) = _$SpNotification_OutputSpentCopyWithImpl;
@useResult
$Res call({
 String outpoint
});




}
/// @nodoc
class _$SpNotification_OutputSpentCopyWithImpl<$Res>
    implements $SpNotification_OutputSpentCopyWith<$Res> {
  _$SpNotification_OutputSpentCopyWithImpl(this._self, this._then);

  final SpNotification_OutputSpent _self;
  final $Res Function(SpNotification_OutputSpent) _then;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? outpoint = null,}) {
  return _then(SpNotification_OutputSpent(
outpoint: null == outpoint ? _self.outpoint : outpoint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SpNotification_Broadcasted extends SpNotification {
  const SpNotification_Broadcasted({required this.txid}): super._();
  

 final  String txid;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpNotification_BroadcastedCopyWith<SpNotification_Broadcasted> get copyWith => _$SpNotification_BroadcastedCopyWithImpl<SpNotification_Broadcasted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_Broadcasted&&(identical(other.txid, txid) || other.txid == txid));
}


@override
int get hashCode => Object.hash(runtimeType,txid);

@override
String toString() {
  return 'SpNotification.broadcasted(txid: $txid)';
}


}

/// @nodoc
abstract mixin class $SpNotification_BroadcastedCopyWith<$Res> implements $SpNotificationCopyWith<$Res> {
  factory $SpNotification_BroadcastedCopyWith(SpNotification_Broadcasted value, $Res Function(SpNotification_Broadcasted) _then) = _$SpNotification_BroadcastedCopyWithImpl;
@useResult
$Res call({
 String txid
});




}
/// @nodoc
class _$SpNotification_BroadcastedCopyWithImpl<$Res>
    implements $SpNotification_BroadcastedCopyWith<$Res> {
  _$SpNotification_BroadcastedCopyWithImpl(this._self, this._then);

  final SpNotification_Broadcasted _self;
  final $Res Function(SpNotification_Broadcasted) _then;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? txid = null,}) {
  return _then(SpNotification_Broadcasted(
txid: null == txid ? _self.txid : txid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SpNotification_BroadcastFailed extends SpNotification {
  const SpNotification_BroadcastFailed({required this.message}): super._();
  

 final  String message;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpNotification_BroadcastFailedCopyWith<SpNotification_BroadcastFailed> get copyWith => _$SpNotification_BroadcastFailedCopyWithImpl<SpNotification_BroadcastFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_BroadcastFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SpNotification.broadcastFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $SpNotification_BroadcastFailedCopyWith<$Res> implements $SpNotificationCopyWith<$Res> {
  factory $SpNotification_BroadcastFailedCopyWith(SpNotification_BroadcastFailed value, $Res Function(SpNotification_BroadcastFailed) _then) = _$SpNotification_BroadcastFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SpNotification_BroadcastFailedCopyWithImpl<$Res>
    implements $SpNotification_BroadcastFailedCopyWith<$Res> {
  _$SpNotification_BroadcastFailedCopyWithImpl(this._self, this._then);

  final SpNotification_BroadcastFailed _self;
  final $Res Function(SpNotification_BroadcastFailed) _then;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SpNotification_BroadcastFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SpNotification_BackendOffline extends SpNotification {
  const SpNotification_BackendOffline(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_BackendOffline);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpNotification.backendOffline()';
}


}




/// @nodoc


class SpNotification_ElectrumTx extends SpNotification {
  const SpNotification_ElectrumTx({required this.kind, required this.txid, required this.amountSat, this.height}): super._();
  

 final  CoinSource kind;
 final  String txid;
 final  BigInt amountSat;
 final  int? height;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpNotification_ElectrumTxCopyWith<SpNotification_ElectrumTx> get copyWith => _$SpNotification_ElectrumTxCopyWithImpl<SpNotification_ElectrumTx>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_ElectrumTx&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.txid, txid) || other.txid == txid)&&(identical(other.amountSat, amountSat) || other.amountSat == amountSat)&&(identical(other.height, height) || other.height == height));
}


@override
int get hashCode => Object.hash(runtimeType,kind,txid,amountSat,height);

@override
String toString() {
  return 'SpNotification.electrumTx(kind: $kind, txid: $txid, amountSat: $amountSat, height: $height)';
}


}

/// @nodoc
abstract mixin class $SpNotification_ElectrumTxCopyWith<$Res> implements $SpNotificationCopyWith<$Res> {
  factory $SpNotification_ElectrumTxCopyWith(SpNotification_ElectrumTx value, $Res Function(SpNotification_ElectrumTx) _then) = _$SpNotification_ElectrumTxCopyWithImpl;
@useResult
$Res call({
 CoinSource kind, String txid, BigInt amountSat, int? height
});




}
/// @nodoc
class _$SpNotification_ElectrumTxCopyWithImpl<$Res>
    implements $SpNotification_ElectrumTxCopyWith<$Res> {
  _$SpNotification_ElectrumTxCopyWithImpl(this._self, this._then);

  final SpNotification_ElectrumTx _self;
  final $Res Function(SpNotification_ElectrumTx) _then;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? txid = null,Object? amountSat = null,Object? height = freezed,}) {
  return _then(SpNotification_ElectrumTx(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CoinSource,txid: null == txid ? _self.txid : txid // ignore: cast_nullable_to_non_nullable
as String,amountSat: null == amountSat ? _self.amountSat : amountSat // ignore: cast_nullable_to_non_nullable
as BigInt,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class SpNotification_ScanSpendProgress extends SpNotification {
  const SpNotification_ScanSpendProgress({required this.current, required this.end}): super._();
  

 final  int current;
 final  int end;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpNotification_ScanSpendProgressCopyWith<SpNotification_ScanSpendProgress> get copyWith => _$SpNotification_ScanSpendProgressCopyWithImpl<SpNotification_ScanSpendProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_ScanSpendProgress&&(identical(other.current, current) || other.current == current)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,current,end);

@override
String toString() {
  return 'SpNotification.scanSpendProgress(current: $current, end: $end)';
}


}

/// @nodoc
abstract mixin class $SpNotification_ScanSpendProgressCopyWith<$Res> implements $SpNotificationCopyWith<$Res> {
  factory $SpNotification_ScanSpendProgressCopyWith(SpNotification_ScanSpendProgress value, $Res Function(SpNotification_ScanSpendProgress) _then) = _$SpNotification_ScanSpendProgressCopyWithImpl;
@useResult
$Res call({
 int current, int end
});




}
/// @nodoc
class _$SpNotification_ScanSpendProgressCopyWithImpl<$Res>
    implements $SpNotification_ScanSpendProgressCopyWith<$Res> {
  _$SpNotification_ScanSpendProgressCopyWithImpl(this._self, this._then);

  final SpNotification_ScanSpendProgress _self;
  final $Res Function(SpNotification_ScanSpendProgress) _then;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? current = null,Object? end = null,}) {
  return _then(SpNotification_ScanSpendProgress(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SpNotification_HeaderProgressStarted extends SpNotification {
  const SpNotification_HeaderProgressStarted({required this.phase, required this.start, required this.end}): super._();
  

 final  HeaderProgressPhase phase;
 final  int start;
 final  int end;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpNotification_HeaderProgressStartedCopyWith<SpNotification_HeaderProgressStarted> get copyWith => _$SpNotification_HeaderProgressStartedCopyWithImpl<SpNotification_HeaderProgressStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_HeaderProgressStarted&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,phase,start,end);

@override
String toString() {
  return 'SpNotification.headerProgressStarted(phase: $phase, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $SpNotification_HeaderProgressStartedCopyWith<$Res> implements $SpNotificationCopyWith<$Res> {
  factory $SpNotification_HeaderProgressStartedCopyWith(SpNotification_HeaderProgressStarted value, $Res Function(SpNotification_HeaderProgressStarted) _then) = _$SpNotification_HeaderProgressStartedCopyWithImpl;
@useResult
$Res call({
 HeaderProgressPhase phase, int start, int end
});




}
/// @nodoc
class _$SpNotification_HeaderProgressStartedCopyWithImpl<$Res>
    implements $SpNotification_HeaderProgressStartedCopyWith<$Res> {
  _$SpNotification_HeaderProgressStartedCopyWithImpl(this._self, this._then);

  final SpNotification_HeaderProgressStarted _self;
  final $Res Function(SpNotification_HeaderProgressStarted) _then;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? start = null,Object? end = null,}) {
  return _then(SpNotification_HeaderProgressStarted(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as HeaderProgressPhase,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as int,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SpNotification_HeaderProgress extends SpNotification {
  const SpNotification_HeaderProgress({required this.phase, required this.current, required this.end}): super._();
  

 final  HeaderProgressPhase phase;
 final  int current;
 final  int end;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpNotification_HeaderProgressCopyWith<SpNotification_HeaderProgress> get copyWith => _$SpNotification_HeaderProgressCopyWithImpl<SpNotification_HeaderProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_HeaderProgress&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.current, current) || other.current == current)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,phase,current,end);

@override
String toString() {
  return 'SpNotification.headerProgress(phase: $phase, current: $current, end: $end)';
}


}

/// @nodoc
abstract mixin class $SpNotification_HeaderProgressCopyWith<$Res> implements $SpNotificationCopyWith<$Res> {
  factory $SpNotification_HeaderProgressCopyWith(SpNotification_HeaderProgress value, $Res Function(SpNotification_HeaderProgress) _then) = _$SpNotification_HeaderProgressCopyWithImpl;
@useResult
$Res call({
 HeaderProgressPhase phase, int current, int end
});




}
/// @nodoc
class _$SpNotification_HeaderProgressCopyWithImpl<$Res>
    implements $SpNotification_HeaderProgressCopyWith<$Res> {
  _$SpNotification_HeaderProgressCopyWithImpl(this._self, this._then);

  final SpNotification_HeaderProgress _self;
  final $Res Function(SpNotification_HeaderProgress) _then;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? current = null,Object? end = null,}) {
  return _then(SpNotification_HeaderProgress(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as HeaderProgressPhase,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SpNotification_HeaderProgressCompleted extends SpNotification {
  const SpNotification_HeaderProgressCompleted({required this.phase}): super._();
  

 final  HeaderProgressPhase phase;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpNotification_HeaderProgressCompletedCopyWith<SpNotification_HeaderProgressCompleted> get copyWith => _$SpNotification_HeaderProgressCompletedCopyWithImpl<SpNotification_HeaderProgressCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_HeaderProgressCompleted&&(identical(other.phase, phase) || other.phase == phase));
}


@override
int get hashCode => Object.hash(runtimeType,phase);

@override
String toString() {
  return 'SpNotification.headerProgressCompleted(phase: $phase)';
}


}

/// @nodoc
abstract mixin class $SpNotification_HeaderProgressCompletedCopyWith<$Res> implements $SpNotificationCopyWith<$Res> {
  factory $SpNotification_HeaderProgressCompletedCopyWith(SpNotification_HeaderProgressCompleted value, $Res Function(SpNotification_HeaderProgressCompleted) _then) = _$SpNotification_HeaderProgressCompletedCopyWithImpl;
@useResult
$Res call({
 HeaderProgressPhase phase
});




}
/// @nodoc
class _$SpNotification_HeaderProgressCompletedCopyWithImpl<$Res>
    implements $SpNotification_HeaderProgressCompletedCopyWith<$Res> {
  _$SpNotification_HeaderProgressCompletedCopyWithImpl(this._self, this._then);

  final SpNotification_HeaderProgressCompleted _self;
  final $Res Function(SpNotification_HeaderProgressCompleted) _then;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phase = null,}) {
  return _then(SpNotification_HeaderProgressCompleted(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as HeaderProgressPhase,
  ));
}


}

/// @nodoc


class SpNotification_HeaderProgressFailed extends SpNotification {
  const SpNotification_HeaderProgressFailed({required this.phase}): super._();
  

 final  HeaderProgressPhase phase;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpNotification_HeaderProgressFailedCopyWith<SpNotification_HeaderProgressFailed> get copyWith => _$SpNotification_HeaderProgressFailedCopyWithImpl<SpNotification_HeaderProgressFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_HeaderProgressFailed&&(identical(other.phase, phase) || other.phase == phase));
}


@override
int get hashCode => Object.hash(runtimeType,phase);

@override
String toString() {
  return 'SpNotification.headerProgressFailed(phase: $phase)';
}


}

/// @nodoc
abstract mixin class $SpNotification_HeaderProgressFailedCopyWith<$Res> implements $SpNotificationCopyWith<$Res> {
  factory $SpNotification_HeaderProgressFailedCopyWith(SpNotification_HeaderProgressFailed value, $Res Function(SpNotification_HeaderProgressFailed) _then) = _$SpNotification_HeaderProgressFailedCopyWithImpl;
@useResult
$Res call({
 HeaderProgressPhase phase
});




}
/// @nodoc
class _$SpNotification_HeaderProgressFailedCopyWithImpl<$Res>
    implements $SpNotification_HeaderProgressFailedCopyWith<$Res> {
  _$SpNotification_HeaderProgressFailedCopyWithImpl(this._self, this._then);

  final SpNotification_HeaderProgressFailed _self;
  final $Res Function(SpNotification_HeaderProgressFailed) _then;

/// Create a copy of SpNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phase = null,}) {
  return _then(SpNotification_HeaderProgressFailed(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as HeaderProgressPhase,
  ));
}


}

/// @nodoc


class SpNotification_PaymentHistoryUpdated extends SpNotification {
  const SpNotification_PaymentHistoryUpdated(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpNotification_PaymentHistoryUpdated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpNotification.paymentHistoryUpdated()';
}


}




/// @nodoc
mixin _$TxFee {

 Object get field0;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TxFee&&const DeepCollectionEquality().equals(other.field0, field0));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(field0));

@override
String toString() {
  return 'TxFee(field0: $field0)';
}


}

/// @nodoc
class $TxFeeCopyWith<$Res>  {
$TxFeeCopyWith(TxFee _, $Res Function(TxFee) __);
}


/// Adds pattern-matching-related methods to [TxFee].
extension TxFeePatterns on TxFee {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TxFee_Absolute value)?  absolute,TResult Function( TxFee_Relative value)?  relative,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TxFee_Absolute() when absolute != null:
return absolute(_that);case TxFee_Relative() when relative != null:
return relative(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TxFee_Absolute value)  absolute,required TResult Function( TxFee_Relative value)  relative,}){
final _that = this;
switch (_that) {
case TxFee_Absolute():
return absolute(_that);case TxFee_Relative():
return relative(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TxFee_Absolute value)?  absolute,TResult? Function( TxFee_Relative value)?  relative,}){
final _that = this;
switch (_that) {
case TxFee_Absolute() when absolute != null:
return absolute(_that);case TxFee_Relative() when relative != null:
return relative(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( BigInt field0)?  absolute,TResult Function( double field0)?  relative,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TxFee_Absolute() when absolute != null:
return absolute(_that.field0);case TxFee_Relative() when relative != null:
return relative(_that.field0);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( BigInt field0)  absolute,required TResult Function( double field0)  relative,}) {final _that = this;
switch (_that) {
case TxFee_Absolute():
return absolute(_that.field0);case TxFee_Relative():
return relative(_that.field0);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( BigInt field0)?  absolute,TResult? Function( double field0)?  relative,}) {final _that = this;
switch (_that) {
case TxFee_Absolute() when absolute != null:
return absolute(_that.field0);case TxFee_Relative() when relative != null:
return relative(_that.field0);case _:
  return null;

}
}

}

/// @nodoc


class TxFee_Absolute extends TxFee {
  const TxFee_Absolute(this.field0): super._();
  

@override final  BigInt field0;

/// Create a copy of TxFee
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TxFee_AbsoluteCopyWith<TxFee_Absolute> get copyWith => _$TxFee_AbsoluteCopyWithImpl<TxFee_Absolute>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TxFee_Absolute&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'TxFee.absolute(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $TxFee_AbsoluteCopyWith<$Res> implements $TxFeeCopyWith<$Res> {
  factory $TxFee_AbsoluteCopyWith(TxFee_Absolute value, $Res Function(TxFee_Absolute) _then) = _$TxFee_AbsoluteCopyWithImpl;
@useResult
$Res call({
 BigInt field0
});




}
/// @nodoc
class _$TxFee_AbsoluteCopyWithImpl<$Res>
    implements $TxFee_AbsoluteCopyWith<$Res> {
  _$TxFee_AbsoluteCopyWithImpl(this._self, this._then);

  final TxFee_Absolute _self;
  final $Res Function(TxFee_Absolute) _then;

/// Create a copy of TxFee
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(TxFee_Absolute(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as BigInt,
  ));
}


}

/// @nodoc


class TxFee_Relative extends TxFee {
  const TxFee_Relative(this.field0): super._();
  

@override final  double field0;

/// Create a copy of TxFee
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TxFee_RelativeCopyWith<TxFee_Relative> get copyWith => _$TxFee_RelativeCopyWithImpl<TxFee_Relative>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TxFee_Relative&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'TxFee.relative(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $TxFee_RelativeCopyWith<$Res> implements $TxFeeCopyWith<$Res> {
  factory $TxFee_RelativeCopyWith(TxFee_Relative value, $Res Function(TxFee_Relative) _then) = _$TxFee_RelativeCopyWithImpl;
@useResult
$Res call({
 double field0
});




}
/// @nodoc
class _$TxFee_RelativeCopyWithImpl<$Res>
    implements $TxFee_RelativeCopyWith<$Res> {
  _$TxFee_RelativeCopyWithImpl(this._self, this._then);

  final TxFee_Relative _self;
  final $Res Function(TxFee_Relative) _then;

/// Create a copy of TxFee
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(TxFee_Relative(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
