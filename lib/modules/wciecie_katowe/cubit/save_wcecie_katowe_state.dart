part of 'save_wcecie_katowe_cubit.dart';

sealed class HistoryWciecieKatoweState extends Equatable {
  const HistoryWciecieKatoweState();

  @override
  List<Object> get props => [];
}

final class HistoryWciecieKatoweInitial extends HistoryWciecieKatoweState {
  @override
  List<Object> get props => [];
}

final class HistoryWciecieKatoweGetSuccesful extends HistoryWciecieKatoweState {
  final List<WciecieKatoweSave> saveList;
  const HistoryWciecieKatoweGetSuccesful(this.saveList);
  @override
  List<Object> get props => [saveList];
}

final class HistoryWciecieKatoweGetError extends HistoryWciecieKatoweState {
  final String error;

  const HistoryWciecieKatoweGetError(this.error);
  @override
  List<Object> get props => [error];
}
