// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'satoshifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Satoshifier {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Satoshifier);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Satoshifier()';
}


}

/// @nodoc
class $SatoshifierCopyWith<$Res>  {
$SatoshifierCopyWith(Satoshifier _, $Res Function(Satoshifier) __);
}


/// Adds pattern-matching-related methods to [Satoshifier].
extension SatoshifierPatterns on Satoshifier {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BitcoinAddress value)?  bitcoinAddress,TResult Function( LiquidAddress value)?  liquidAddress,TResult Function( LightningInvoice value)?  lightningInvoice,TResult Function( Bolt11 value)?  bolt11,TResult Function( WatchOnly value)?  watchOnly,TResult Function( Bip21 value)?  bip21,TResult Function( Psbt value)?  psbt,TResult Function( WatchOnlyXpub value)?  watchOnlyXpub,TResult Function( WatchOnlyDescriptor value)?  watchOnlyDescriptor,TResult Function( Lnurl value)?  lnurl,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BitcoinAddress() when bitcoinAddress != null:
return bitcoinAddress(_that);case LiquidAddress() when liquidAddress != null:
return liquidAddress(_that);case LightningInvoice() when lightningInvoice != null:
return lightningInvoice(_that);case Bolt11() when bolt11 != null:
return bolt11(_that);case WatchOnly() when watchOnly != null:
return watchOnly(_that);case Bip21() when bip21 != null:
return bip21(_that);case Psbt() when psbt != null:
return psbt(_that);case WatchOnlyXpub() when watchOnlyXpub != null:
return watchOnlyXpub(_that);case WatchOnlyDescriptor() when watchOnlyDescriptor != null:
return watchOnlyDescriptor(_that);case Lnurl() when lnurl != null:
return lnurl(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BitcoinAddress value)  bitcoinAddress,required TResult Function( LiquidAddress value)  liquidAddress,required TResult Function( LightningInvoice value)  lightningInvoice,required TResult Function( Bolt11 value)  bolt11,required TResult Function( WatchOnly value)  watchOnly,required TResult Function( Bip21 value)  bip21,required TResult Function( Psbt value)  psbt,required TResult Function( WatchOnlyXpub value)  watchOnlyXpub,required TResult Function( WatchOnlyDescriptor value)  watchOnlyDescriptor,required TResult Function( Lnurl value)  lnurl,}){
final _that = this;
switch (_that) {
case BitcoinAddress():
return bitcoinAddress(_that);case LiquidAddress():
return liquidAddress(_that);case LightningInvoice():
return lightningInvoice(_that);case Bolt11():
return bolt11(_that);case WatchOnly():
return watchOnly(_that);case Bip21():
return bip21(_that);case Psbt():
return psbt(_that);case WatchOnlyXpub():
return watchOnlyXpub(_that);case WatchOnlyDescriptor():
return watchOnlyDescriptor(_that);case Lnurl():
return lnurl(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BitcoinAddress value)?  bitcoinAddress,TResult? Function( LiquidAddress value)?  liquidAddress,TResult? Function( LightningInvoice value)?  lightningInvoice,TResult? Function( Bolt11 value)?  bolt11,TResult? Function( WatchOnly value)?  watchOnly,TResult? Function( Bip21 value)?  bip21,TResult? Function( Psbt value)?  psbt,TResult? Function( WatchOnlyXpub value)?  watchOnlyXpub,TResult? Function( WatchOnlyDescriptor value)?  watchOnlyDescriptor,TResult? Function( Lnurl value)?  lnurl,}){
final _that = this;
switch (_that) {
case BitcoinAddress() when bitcoinAddress != null:
return bitcoinAddress(_that);case LiquidAddress() when liquidAddress != null:
return liquidAddress(_that);case LightningInvoice() when lightningInvoice != null:
return lightningInvoice(_that);case Bolt11() when bolt11 != null:
return bolt11(_that);case WatchOnly() when watchOnly != null:
return watchOnly(_that);case Bip21() when bip21 != null:
return bip21(_that);case Psbt() when psbt != null:
return psbt(_that);case WatchOnlyXpub() when watchOnlyXpub != null:
return watchOnlyXpub(_that);case WatchOnlyDescriptor() when watchOnlyDescriptor != null:
return watchOnlyDescriptor(_that);case Lnurl() when lnurl != null:
return lnurl(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String address,  Network network)?  bitcoinAddress,TResult Function( String address,  Network network)?  liquidAddress,TResult Function( String invoice)?  lightningInvoice,TResult Function( String invoice,  int sats,  String paymentHash,  String description,  int expiresAt,  bool isTestnet)?  bolt11,TResult Function( Descriptor descriptor)?  watchOnly,TResult Function( String scheme,  String uri,  String address,  Network network,  int sats,  String label,  String message,  String lightning,  String pj,  String pjos)?  bip21,TResult Function( String psbt)?  psbt,TResult Function( ExtendedPubkey extendedPubkey)?  watchOnlyXpub,TResult Function( Descriptor descriptor)?  watchOnlyDescriptor,TResult Function( String address)?  lnurl,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BitcoinAddress() when bitcoinAddress != null:
return bitcoinAddress(_that.address,_that.network);case LiquidAddress() when liquidAddress != null:
return liquidAddress(_that.address,_that.network);case LightningInvoice() when lightningInvoice != null:
return lightningInvoice(_that.invoice);case Bolt11() when bolt11 != null:
return bolt11(_that.invoice,_that.sats,_that.paymentHash,_that.description,_that.expiresAt,_that.isTestnet);case WatchOnly() when watchOnly != null:
return watchOnly(_that.descriptor);case Bip21() when bip21 != null:
return bip21(_that.scheme,_that.uri,_that.address,_that.network,_that.sats,_that.label,_that.message,_that.lightning,_that.pj,_that.pjos);case Psbt() when psbt != null:
return psbt(_that.psbt);case WatchOnlyXpub() when watchOnlyXpub != null:
return watchOnlyXpub(_that.extendedPubkey);case WatchOnlyDescriptor() when watchOnlyDescriptor != null:
return watchOnlyDescriptor(_that.descriptor);case Lnurl() when lnurl != null:
return lnurl(_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String address,  Network network)  bitcoinAddress,required TResult Function( String address,  Network network)  liquidAddress,required TResult Function( String invoice)  lightningInvoice,required TResult Function( String invoice,  int sats,  String paymentHash,  String description,  int expiresAt,  bool isTestnet)  bolt11,required TResult Function( Descriptor descriptor)  watchOnly,required TResult Function( String scheme,  String uri,  String address,  Network network,  int sats,  String label,  String message,  String lightning,  String pj,  String pjos)  bip21,required TResult Function( String psbt)  psbt,required TResult Function( ExtendedPubkey extendedPubkey)  watchOnlyXpub,required TResult Function( Descriptor descriptor)  watchOnlyDescriptor,required TResult Function( String address)  lnurl,}) {final _that = this;
switch (_that) {
case BitcoinAddress():
return bitcoinAddress(_that.address,_that.network);case LiquidAddress():
return liquidAddress(_that.address,_that.network);case LightningInvoice():
return lightningInvoice(_that.invoice);case Bolt11():
return bolt11(_that.invoice,_that.sats,_that.paymentHash,_that.description,_that.expiresAt,_that.isTestnet);case WatchOnly():
return watchOnly(_that.descriptor);case Bip21():
return bip21(_that.scheme,_that.uri,_that.address,_that.network,_that.sats,_that.label,_that.message,_that.lightning,_that.pj,_that.pjos);case Psbt():
return psbt(_that.psbt);case WatchOnlyXpub():
return watchOnlyXpub(_that.extendedPubkey);case WatchOnlyDescriptor():
return watchOnlyDescriptor(_that.descriptor);case Lnurl():
return lnurl(_that.address);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String address,  Network network)?  bitcoinAddress,TResult? Function( String address,  Network network)?  liquidAddress,TResult? Function( String invoice)?  lightningInvoice,TResult? Function( String invoice,  int sats,  String paymentHash,  String description,  int expiresAt,  bool isTestnet)?  bolt11,TResult? Function( Descriptor descriptor)?  watchOnly,TResult? Function( String scheme,  String uri,  String address,  Network network,  int sats,  String label,  String message,  String lightning,  String pj,  String pjos)?  bip21,TResult? Function( String psbt)?  psbt,TResult? Function( ExtendedPubkey extendedPubkey)?  watchOnlyXpub,TResult? Function( Descriptor descriptor)?  watchOnlyDescriptor,TResult? Function( String address)?  lnurl,}) {final _that = this;
switch (_that) {
case BitcoinAddress() when bitcoinAddress != null:
return bitcoinAddress(_that.address,_that.network);case LiquidAddress() when liquidAddress != null:
return liquidAddress(_that.address,_that.network);case LightningInvoice() when lightningInvoice != null:
return lightningInvoice(_that.invoice);case Bolt11() when bolt11 != null:
return bolt11(_that.invoice,_that.sats,_that.paymentHash,_that.description,_that.expiresAt,_that.isTestnet);case WatchOnly() when watchOnly != null:
return watchOnly(_that.descriptor);case Bip21() when bip21 != null:
return bip21(_that.scheme,_that.uri,_that.address,_that.network,_that.sats,_that.label,_that.message,_that.lightning,_that.pj,_that.pjos);case Psbt() when psbt != null:
return psbt(_that.psbt);case WatchOnlyXpub() when watchOnlyXpub != null:
return watchOnlyXpub(_that.extendedPubkey);case WatchOnlyDescriptor() when watchOnlyDescriptor != null:
return watchOnlyDescriptor(_that.descriptor);case Lnurl() when lnurl != null:
return lnurl(_that.address);case _:
  return null;

}
}

}

/// @nodoc


class BitcoinAddress extends Satoshifier {
  const BitcoinAddress({required this.address, required this.network}): super._();
  

 final  String address;
 final  Network network;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BitcoinAddressCopyWith<BitcoinAddress> get copyWith => _$BitcoinAddressCopyWithImpl<BitcoinAddress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BitcoinAddress&&(identical(other.address, address) || other.address == address)&&(identical(other.network, network) || other.network == network));
}


@override
int get hashCode => Object.hash(runtimeType,address,network);

@override
String toString() {
  return 'Satoshifier.bitcoinAddress(address: $address, network: $network)';
}


}

/// @nodoc
abstract mixin class $BitcoinAddressCopyWith<$Res> implements $SatoshifierCopyWith<$Res> {
  factory $BitcoinAddressCopyWith(BitcoinAddress value, $Res Function(BitcoinAddress) _then) = _$BitcoinAddressCopyWithImpl;
@useResult
$Res call({
 String address, Network network
});




}
/// @nodoc
class _$BitcoinAddressCopyWithImpl<$Res>
    implements $BitcoinAddressCopyWith<$Res> {
  _$BitcoinAddressCopyWithImpl(this._self, this._then);

  final BitcoinAddress _self;
  final $Res Function(BitcoinAddress) _then;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,Object? network = null,}) {
  return _then(BitcoinAddress(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as Network,
  ));
}


}

/// @nodoc


class LiquidAddress extends Satoshifier {
  const LiquidAddress({required this.address, required this.network}): super._();
  

 final  String address;
 final  Network network;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiquidAddressCopyWith<LiquidAddress> get copyWith => _$LiquidAddressCopyWithImpl<LiquidAddress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiquidAddress&&(identical(other.address, address) || other.address == address)&&(identical(other.network, network) || other.network == network));
}


@override
int get hashCode => Object.hash(runtimeType,address,network);

@override
String toString() {
  return 'Satoshifier.liquidAddress(address: $address, network: $network)';
}


}

/// @nodoc
abstract mixin class $LiquidAddressCopyWith<$Res> implements $SatoshifierCopyWith<$Res> {
  factory $LiquidAddressCopyWith(LiquidAddress value, $Res Function(LiquidAddress) _then) = _$LiquidAddressCopyWithImpl;
@useResult
$Res call({
 String address, Network network
});




}
/// @nodoc
class _$LiquidAddressCopyWithImpl<$Res>
    implements $LiquidAddressCopyWith<$Res> {
  _$LiquidAddressCopyWithImpl(this._self, this._then);

  final LiquidAddress _self;
  final $Res Function(LiquidAddress) _then;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,Object? network = null,}) {
  return _then(LiquidAddress(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as Network,
  ));
}


}

/// @nodoc


class LightningInvoice extends Satoshifier {
  const LightningInvoice({required this.invoice}): super._();
  

 final  String invoice;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LightningInvoiceCopyWith<LightningInvoice> get copyWith => _$LightningInvoiceCopyWithImpl<LightningInvoice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LightningInvoice&&(identical(other.invoice, invoice) || other.invoice == invoice));
}


@override
int get hashCode => Object.hash(runtimeType,invoice);

@override
String toString() {
  return 'Satoshifier.lightningInvoice(invoice: $invoice)';
}


}

/// @nodoc
abstract mixin class $LightningInvoiceCopyWith<$Res> implements $SatoshifierCopyWith<$Res> {
  factory $LightningInvoiceCopyWith(LightningInvoice value, $Res Function(LightningInvoice) _then) = _$LightningInvoiceCopyWithImpl;
@useResult
$Res call({
 String invoice
});




}
/// @nodoc
class _$LightningInvoiceCopyWithImpl<$Res>
    implements $LightningInvoiceCopyWith<$Res> {
  _$LightningInvoiceCopyWithImpl(this._self, this._then);

  final LightningInvoice _self;
  final $Res Function(LightningInvoice) _then;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? invoice = null,}) {
  return _then(LightningInvoice(
invoice: null == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Bolt11 extends Satoshifier {
  const Bolt11({required this.invoice, required this.sats, required this.paymentHash, this.description = '', required this.expiresAt, required this.isTestnet}): super._();
  

 final  String invoice;
 final  int sats;
 final  String paymentHash;
@JsonKey() final  String description;
 final  int expiresAt;
 final  bool isTestnet;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Bolt11CopyWith<Bolt11> get copyWith => _$Bolt11CopyWithImpl<Bolt11>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bolt11&&(identical(other.invoice, invoice) || other.invoice == invoice)&&(identical(other.sats, sats) || other.sats == sats)&&(identical(other.paymentHash, paymentHash) || other.paymentHash == paymentHash)&&(identical(other.description, description) || other.description == description)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isTestnet, isTestnet) || other.isTestnet == isTestnet));
}


@override
int get hashCode => Object.hash(runtimeType,invoice,sats,paymentHash,description,expiresAt,isTestnet);

@override
String toString() {
  return 'Satoshifier.bolt11(invoice: $invoice, sats: $sats, paymentHash: $paymentHash, description: $description, expiresAt: $expiresAt, isTestnet: $isTestnet)';
}


}

/// @nodoc
abstract mixin class $Bolt11CopyWith<$Res> implements $SatoshifierCopyWith<$Res> {
  factory $Bolt11CopyWith(Bolt11 value, $Res Function(Bolt11) _then) = _$Bolt11CopyWithImpl;
@useResult
$Res call({
 String invoice, int sats, String paymentHash, String description, int expiresAt, bool isTestnet
});




}
/// @nodoc
class _$Bolt11CopyWithImpl<$Res>
    implements $Bolt11CopyWith<$Res> {
  _$Bolt11CopyWithImpl(this._self, this._then);

  final Bolt11 _self;
  final $Res Function(Bolt11) _then;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? invoice = null,Object? sats = null,Object? paymentHash = null,Object? description = null,Object? expiresAt = null,Object? isTestnet = null,}) {
  return _then(Bolt11(
invoice: null == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as String,sats: null == sats ? _self.sats : sats // ignore: cast_nullable_to_non_nullable
as int,paymentHash: null == paymentHash ? _self.paymentHash : paymentHash // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as int,isTestnet: null == isTestnet ? _self.isTestnet : isTestnet // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class WatchOnly extends Satoshifier {
  const WatchOnly({required this.descriptor}): super._();
  

 final  Descriptor descriptor;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchOnlyCopyWith<WatchOnly> get copyWith => _$WatchOnlyCopyWithImpl<WatchOnly>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchOnly&&(identical(other.descriptor, descriptor) || other.descriptor == descriptor));
}


@override
int get hashCode => Object.hash(runtimeType,descriptor);

@override
String toString() {
  return 'Satoshifier.watchOnly(descriptor: $descriptor)';
}


}

/// @nodoc
abstract mixin class $WatchOnlyCopyWith<$Res> implements $SatoshifierCopyWith<$Res> {
  factory $WatchOnlyCopyWith(WatchOnly value, $Res Function(WatchOnly) _then) = _$WatchOnlyCopyWithImpl;
@useResult
$Res call({
 Descriptor descriptor
});




}
/// @nodoc
class _$WatchOnlyCopyWithImpl<$Res>
    implements $WatchOnlyCopyWith<$Res> {
  _$WatchOnlyCopyWithImpl(this._self, this._then);

  final WatchOnly _self;
  final $Res Function(WatchOnly) _then;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? descriptor = null,}) {
  return _then(WatchOnly(
descriptor: null == descriptor ? _self.descriptor : descriptor // ignore: cast_nullable_to_non_nullable
as Descriptor,
  ));
}


}

/// @nodoc


class Bip21 extends Satoshifier {
  const Bip21({required this.scheme, required this.uri, required this.address, required this.network, this.sats = 0, this.label = '', this.message = '', this.lightning = '', this.pj = '', this.pjos = ''}): super._();
  

 final  String scheme;
 final  String uri;
 final  String address;
 final  Network network;
@JsonKey() final  int sats;
@JsonKey() final  String label;
@JsonKey() final  String message;
@JsonKey() final  String lightning;
@JsonKey() final  String pj;
@JsonKey() final  String pjos;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Bip21CopyWith<Bip21> get copyWith => _$Bip21CopyWithImpl<Bip21>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bip21&&(identical(other.scheme, scheme) || other.scheme == scheme)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.address, address) || other.address == address)&&(identical(other.network, network) || other.network == network)&&(identical(other.sats, sats) || other.sats == sats)&&(identical(other.label, label) || other.label == label)&&(identical(other.message, message) || other.message == message)&&(identical(other.lightning, lightning) || other.lightning == lightning)&&(identical(other.pj, pj) || other.pj == pj)&&(identical(other.pjos, pjos) || other.pjos == pjos));
}


@override
int get hashCode => Object.hash(runtimeType,scheme,uri,address,network,sats,label,message,lightning,pj,pjos);

@override
String toString() {
  return 'Satoshifier.bip21(scheme: $scheme, uri: $uri, address: $address, network: $network, sats: $sats, label: $label, message: $message, lightning: $lightning, pj: $pj, pjos: $pjos)';
}


}

/// @nodoc
abstract mixin class $Bip21CopyWith<$Res> implements $SatoshifierCopyWith<$Res> {
  factory $Bip21CopyWith(Bip21 value, $Res Function(Bip21) _then) = _$Bip21CopyWithImpl;
@useResult
$Res call({
 String scheme, String uri, String address, Network network, int sats, String label, String message, String lightning, String pj, String pjos
});




}
/// @nodoc
class _$Bip21CopyWithImpl<$Res>
    implements $Bip21CopyWith<$Res> {
  _$Bip21CopyWithImpl(this._self, this._then);

  final Bip21 _self;
  final $Res Function(Bip21) _then;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scheme = null,Object? uri = null,Object? address = null,Object? network = null,Object? sats = null,Object? label = null,Object? message = null,Object? lightning = null,Object? pj = null,Object? pjos = null,}) {
  return _then(Bip21(
scheme: null == scheme ? _self.scheme : scheme // ignore: cast_nullable_to_non_nullable
as String,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as Network,sats: null == sats ? _self.sats : sats // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,lightning: null == lightning ? _self.lightning : lightning // ignore: cast_nullable_to_non_nullable
as String,pj: null == pj ? _self.pj : pj // ignore: cast_nullable_to_non_nullable
as String,pjos: null == pjos ? _self.pjos : pjos // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Psbt extends Satoshifier {
  const Psbt({required this.psbt}): super._();
  

 final  String psbt;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PsbtCopyWith<Psbt> get copyWith => _$PsbtCopyWithImpl<Psbt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Psbt&&(identical(other.psbt, psbt) || other.psbt == psbt));
}


@override
int get hashCode => Object.hash(runtimeType,psbt);

@override
String toString() {
  return 'Satoshifier.psbt(psbt: $psbt)';
}


}

/// @nodoc
abstract mixin class $PsbtCopyWith<$Res> implements $SatoshifierCopyWith<$Res> {
  factory $PsbtCopyWith(Psbt value, $Res Function(Psbt) _then) = _$PsbtCopyWithImpl;
@useResult
$Res call({
 String psbt
});




}
/// @nodoc
class _$PsbtCopyWithImpl<$Res>
    implements $PsbtCopyWith<$Res> {
  _$PsbtCopyWithImpl(this._self, this._then);

  final Psbt _self;
  final $Res Function(Psbt) _then;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? psbt = null,}) {
  return _then(Psbt(
psbt: null == psbt ? _self.psbt : psbt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WatchOnlyXpub extends Satoshifier {
  const WatchOnlyXpub({required this.extendedPubkey}): super._();
  

 final  ExtendedPubkey extendedPubkey;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchOnlyXpubCopyWith<WatchOnlyXpub> get copyWith => _$WatchOnlyXpubCopyWithImpl<WatchOnlyXpub>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchOnlyXpub&&(identical(other.extendedPubkey, extendedPubkey) || other.extendedPubkey == extendedPubkey));
}


@override
int get hashCode => Object.hash(runtimeType,extendedPubkey);

@override
String toString() {
  return 'Satoshifier.watchOnlyXpub(extendedPubkey: $extendedPubkey)';
}


}

/// @nodoc
abstract mixin class $WatchOnlyXpubCopyWith<$Res> implements $SatoshifierCopyWith<$Res> {
  factory $WatchOnlyXpubCopyWith(WatchOnlyXpub value, $Res Function(WatchOnlyXpub) _then) = _$WatchOnlyXpubCopyWithImpl;
@useResult
$Res call({
 ExtendedPubkey extendedPubkey
});




}
/// @nodoc
class _$WatchOnlyXpubCopyWithImpl<$Res>
    implements $WatchOnlyXpubCopyWith<$Res> {
  _$WatchOnlyXpubCopyWithImpl(this._self, this._then);

  final WatchOnlyXpub _self;
  final $Res Function(WatchOnlyXpub) _then;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? extendedPubkey = null,}) {
  return _then(WatchOnlyXpub(
extendedPubkey: null == extendedPubkey ? _self.extendedPubkey : extendedPubkey // ignore: cast_nullable_to_non_nullable
as ExtendedPubkey,
  ));
}


}

/// @nodoc


class WatchOnlyDescriptor extends Satoshifier {
  const WatchOnlyDescriptor({required this.descriptor}): super._();
  

 final  Descriptor descriptor;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchOnlyDescriptorCopyWith<WatchOnlyDescriptor> get copyWith => _$WatchOnlyDescriptorCopyWithImpl<WatchOnlyDescriptor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchOnlyDescriptor&&(identical(other.descriptor, descriptor) || other.descriptor == descriptor));
}


@override
int get hashCode => Object.hash(runtimeType,descriptor);

@override
String toString() {
  return 'Satoshifier.watchOnlyDescriptor(descriptor: $descriptor)';
}


}

/// @nodoc
abstract mixin class $WatchOnlyDescriptorCopyWith<$Res> implements $SatoshifierCopyWith<$Res> {
  factory $WatchOnlyDescriptorCopyWith(WatchOnlyDescriptor value, $Res Function(WatchOnlyDescriptor) _then) = _$WatchOnlyDescriptorCopyWithImpl;
@useResult
$Res call({
 Descriptor descriptor
});




}
/// @nodoc
class _$WatchOnlyDescriptorCopyWithImpl<$Res>
    implements $WatchOnlyDescriptorCopyWith<$Res> {
  _$WatchOnlyDescriptorCopyWithImpl(this._self, this._then);

  final WatchOnlyDescriptor _self;
  final $Res Function(WatchOnlyDescriptor) _then;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? descriptor = null,}) {
  return _then(WatchOnlyDescriptor(
descriptor: null == descriptor ? _self.descriptor : descriptor // ignore: cast_nullable_to_non_nullable
as Descriptor,
  ));
}


}

/// @nodoc


class Lnurl extends Satoshifier {
  const Lnurl({required this.address}): super._();
  

 final  String address;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LnurlCopyWith<Lnurl> get copyWith => _$LnurlCopyWithImpl<Lnurl>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lnurl&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,address);

@override
String toString() {
  return 'Satoshifier.lnurl(address: $address)';
}


}

/// @nodoc
abstract mixin class $LnurlCopyWith<$Res> implements $SatoshifierCopyWith<$Res> {
  factory $LnurlCopyWith(Lnurl value, $Res Function(Lnurl) _then) = _$LnurlCopyWithImpl;
@useResult
$Res call({
 String address
});




}
/// @nodoc
class _$LnurlCopyWithImpl<$Res>
    implements $LnurlCopyWith<$Res> {
  _$LnurlCopyWithImpl(this._self, this._then);

  final Lnurl _self;
  final $Res Function(Lnurl) _then;

/// Create a copy of Satoshifier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,}) {
  return _then(Lnurl(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
