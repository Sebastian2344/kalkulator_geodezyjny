part of 'wciecie_liniowe_cubit.dart';

sealed class WciecieLinioweState extends Equatable {
  const WciecieLinioweState();

  @override
  List<Object> get props => [];
}

final class WciecieLinioweInitial extends WciecieLinioweState {}

final class WciecieLinioweSuccessful extends WciecieLinioweState {
  final WciecieLinioweModel wciecieLinioweModel;
  const WciecieLinioweSuccessful(this.wciecieLinioweModel);
  @override
  List<Object> get props => [wciecieLinioweModel];
}

final class WciecieLinioweError extends WciecieLinioweState {
 final String error;
 const WciecieLinioweError(this.error);
 @override
 List<Object> get props => [error];
}