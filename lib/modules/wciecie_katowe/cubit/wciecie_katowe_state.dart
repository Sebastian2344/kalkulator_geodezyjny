part of 'wciecie_katowe_cubit.dart';

sealed class WciecieKatoweState extends Equatable{}

final class WciecieKatoweInitial extends WciecieKatoweState {
  @override
  List<Object?> get props => [];
}
final class WciecieKatoweSuccesful extends WciecieKatoweState {
  final WciecieKatoweModel wciecieKatoweModel;
  WciecieKatoweSuccesful(this.wciecieKatoweModel);
  @override
  List<Object?> get props => [wciecieKatoweModel];
}
final class WciecieKatoweError extends WciecieKatoweState {
  final String error;
  WciecieKatoweError(this.error);
  @override
  List<Object?> get props => [error];
}
