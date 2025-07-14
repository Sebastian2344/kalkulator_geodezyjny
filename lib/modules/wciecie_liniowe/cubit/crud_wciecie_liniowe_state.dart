part of 'crud_wciecie_liniowe_cubit.dart';

sealed class CrudWciecieLinioweState extends Equatable {
  const CrudWciecieLinioweState();

  @override
  List<Object> get props => [];
}

final class CrudWciecieLinioweInitial extends CrudWciecieLinioweState {}

final class CrudWciecieLinioweGetSuccessful extends CrudWciecieLinioweState {
  
  final List<WciecieLinioweSave> wciecieLinioweSaveList;
  const CrudWciecieLinioweGetSuccessful(this.wciecieLinioweSaveList);

  @override
  List<Object> get props => [wciecieLinioweSaveList];
}
final class CrudWciecieLinioweGetError extends CrudWciecieLinioweState {
  
  final String error;
  const CrudWciecieLinioweGetError(this.error);

  @override
  List<Object> get props => [error];
}