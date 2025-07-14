part of 'biegunowa_cubit.dart';

//@immutable
sealed class BiegunowaState extends Equatable{}

final class BiegunowaInitial extends BiegunowaState {
  @override
  List<Object?> get props => [];
}
final class BiegunowaError extends BiegunowaState {
  BiegunowaError(this.error);
  final String error;
  
  @override
  List<Object?> get props => [error];
}
final class BiegunowaSuccesful extends BiegunowaState {
  BiegunowaSuccesful(this.wynik,this.przyrosty, this.dane, this.azymut);
  final List<double> wynik;
  final List<double> przyrosty;
  final List<double> dane;
  final double azymut;
  
  @override
  List<Object?> get props => [wynik,przyrosty,dane,azymut];
}
