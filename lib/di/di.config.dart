// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../modules/biegunowa/cubit/biegunowa_cubit.dart' as _i184;
import '../modules/biegunowa/cubit/history_biegunowa_cubit.dart' as _i519;
import '../modules/biegunowa/data/data_source/obliczenia_biegunowa.dart'
    as _i395;
import '../modules/biegunowa/data/data_source/save_biegunowa_service.dart'
    as _i539;
import '../modules/ortogonalna/cubit/history_ortogonalna_cubit.dart' as _i1037;
import '../modules/ortogonalna/cubit/ortogonalna_cubit.dart' as _i1065;
import '../modules/ortogonalna/data/data_source/obliczenia_ortogonalna.dart'
    as _i630;
import '../modules/ortogonalna/data/data_source/save_ortogonalna_service.dart'
    as _i706;
import '../modules/wciecie_katowe/cubit/save_wcecie_katowe_cubit.dart' as _i597;
import '../modules/wciecie_katowe/cubit/wciecie_katowe_cubit.dart' as _i989;
import '../modules/wciecie_katowe/data/data_source/obliczenia_wciecie_katowe.dart'
    as _i306;
import '../modules/wciecie_katowe/data/data_source/save_wciecie_katowe.dart'
    as _i339;
import '../modules/wciecie_katowe/data/repository/repo.dart' as _i1033;
import '../modules/wciecie_katowe/data/repository/save_repo.dart' as _i162;
import '../modules/wciecie_liniowe/cubit/crud_wciecie_liniowe_cubit.dart'
    as _i595;
import '../modules/wciecie_liniowe/cubit/wciecie_liniowe_cubit.dart' as _i882;
import '../modules/wciecie_liniowe/data/data_source/obliczenia_liniowe.dart'
    as _i92;
import '../modules/wciecie_liniowe/data/data_source/wciecie_liniowe_service.dart'
    as _i583;
import '../modules/wciecie_liniowe/data/repository/baza_repo.dart' as _i729;
import '../modules/wciecie_liniowe/data/repository/obliczenia_repo.dart'
    as _i882;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i395.ObliczeniaBiegunowa>(
        () => _i395.ObliczeniaBiegunowa());
    gh.lazySingleton<_i539.SaveBiegunowaService>(
        () => _i539.SaveBiegunowaService());
    gh.lazySingleton<_i630.ObliczeniaOrtogonalna>(
        () => _i630.ObliczeniaOrtogonalna());
    gh.lazySingleton<_i706.SaveOrtogonalnaService>(
        () => _i706.SaveOrtogonalnaService());
    gh.lazySingleton<_i306.ObliczeniaWcieceKatowe>(
        () => _i306.ObliczeniaWcieceKatowe());
    gh.lazySingleton<_i339.SaveWciecieKatoweService>(
        () => _i339.SaveWciecieKatoweService());
    gh.lazySingleton<_i92.ObliczeniaLiniowe>(() => _i92.ObliczeniaLiniowe());
    gh.lazySingleton<_i583.SaveWciecieLinioweService>(
        () => _i583.SaveWciecieLinioweService());
    gh.factory<_i184.BiegunowaCubit>(() =>
        _i184.BiegunowaCubit(obliczenia: gh<_i395.ObliczeniaBiegunowa>()));
    gh.lazySingleton<_i882.WciecieLinioweRepository>(
        () => _i882.WciecieLinioweRepository(gh<_i92.ObliczeniaLiniowe>()));
    gh.factory<_i1037.HistoryOrtogonalnaCubit>(() =>
        _i1037.HistoryOrtogonalnaCubit(gh<_i706.SaveOrtogonalnaService>()));
    gh.lazySingleton<_i162.WciecieRepositorySave>(() =>
        _i162.WciecieRepositorySave(gh<_i339.SaveWciecieKatoweService>()));
    gh.factory<_i1065.OrtogonalnaCubit>(() =>
        _i1065.OrtogonalnaCubit(obliczenia: gh<_i630.ObliczeniaOrtogonalna>()));
    gh.factory<_i882.WciecieLinioweCubit>(
        () => _i882.WciecieLinioweCubit(gh<_i882.WciecieLinioweRepository>()));
    gh.factory<_i519.HistoryBiegunowaCubit>(
        () => _i519.HistoryBiegunowaCubit(gh<_i539.SaveBiegunowaService>()));
    gh.factory<_i597.HistoryWciecieKatoweCubit>(() =>
        _i597.HistoryWciecieKatoweCubit(gh<_i162.WciecieRepositorySave>()));
    gh.lazySingleton<_i1033.WciecieRepository>(
        () => _i1033.WciecieRepository(gh<_i306.ObliczeniaWcieceKatowe>()));
    gh.lazySingleton<_i729.WciecieLinioweRepositorySave>(() =>
        _i729.WciecieLinioweRepositorySave(
            gh<_i583.SaveWciecieLinioweService>()));
    gh.factory<_i595.CrudWciecieLinioweCubit>(() =>
        _i595.CrudWciecieLinioweCubit(
            gh<_i729.WciecieLinioweRepositorySave>()));
    gh.factory<_i989.WciecieKatoweCubit>(
        () => _i989.WciecieKatoweCubit(gh<_i1033.WciecieRepository>()));
    return this;
  }
}
