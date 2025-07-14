part of 'history_biegunowa_cubit.dart';

//@immutable
sealed class HistoryBiegunowaState extends Equatable{}

final class HistoryBiegunowaInitial extends HistoryBiegunowaState {
  @override
  List<Object?> get props => [];
}

final class IGotIt extends HistoryBiegunowaState {
  final List<SaveBiegunowa> lista;
  IGotIt(this.lista);
  
  @override
  List<Object?> get props => [lista];
}

final class HistoryBiegunowaError extends HistoryBiegunowaState {
  final String error;
  HistoryBiegunowaError(this.error);
  
  @override
  List<Object?> get props => [error];
}