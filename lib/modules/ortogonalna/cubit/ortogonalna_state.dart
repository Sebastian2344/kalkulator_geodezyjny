part of 'ortogonalna_cubit.dart';

sealed class OrtogonalnaState extends Equatable{}

final class OrtogonalnaInitial extends OrtogonalnaState {
  @override
  List<Object?> get props => [];
}
final class OrtogonalnaSuccesful extends OrtogonalnaState {
  OrtogonalnaSuccesful(this.wynik,this.przyrosty, this.dane, this.azymut);
  final List<double> przyrosty;
  final List<double> wynik;
  final List<double> dane;
  final double azymut;
  
  @override
  List<Object?> get props => [przyrosty,wynik,dane,azymut];
}
final class OrtogonalnaError extends OrtogonalnaState {
  OrtogonalnaError(this.error);
  final String error;
  
  @override
  List<Object?> get props => [error];
}