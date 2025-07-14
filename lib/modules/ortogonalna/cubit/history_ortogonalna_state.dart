part of 'history_ortogonalna_cubit.dart';

//@immutable
sealed class HistoryOrtogonalnaState extends Equatable{}

final class HistoryOrtogonalnaInitial extends HistoryOrtogonalnaState {
  @override
  List<Object?> get props => [];
}

final class IGotIt extends HistoryOrtogonalnaState {
  final List<SaveOrtogonalna> lista;
  IGotIt(this.lista);
  
  @override
  List<Object?> get props => [lista];
}

final class HistoryOrtogonalnaError extends HistoryOrtogonalnaState {
  final String error;
  HistoryOrtogonalnaError(this.error);
  
  @override
  List<Object?> get props => [error];
}