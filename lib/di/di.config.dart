// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../modules/biegunowa/cubit/biegunowa_cubit.dart' as _i16;
import '../modules/biegunowa/cubit/history_biegunowa_cubit.dart' as _i18;
import '../modules/biegunowa/data/data_source/obliczenia_biegunowa.dart' as _i3;
import '../modules/biegunowa/data/data_source/save_biegunowa_service.dart'
    as _i8;
import '../modules/ortogonalna/cubit/history_ortogonalna_cubit.dart' as _i19;
import '../modules/ortogonalna/cubit/ortogonalna_cubit.dart' as _i7;
import '../modules/ortogonalna/data/data_source/obliczenia_ortogonalna.dart'
    as _i5;
import '../modules/ortogonalna/data/data_source/save_ortogonalna_service.dart'
    as _i9;
import '../modules/wciecie_katowe/cubit/save_wcecie_katowe_cubit.dart' as _i20;
import '../modules/wciecie_katowe/cubit/wciecie_katowe_cubit.dart' as _i21;
import '../modules/wciecie_katowe/data/data_source/obliczenia_wciecie_katowe.dart'
    as _i6;
import '../modules/wciecie_katowe/data/data_source/save_wciecie_katowe.dart'
    as _i10;
import '../modules/wciecie_katowe/data/repository/repo.dart' as _i14;
import '../modules/wciecie_katowe/data/repository/save_repo.dart' as _i15;
import '../modules/wciecie_liniowe/cubit/crud_wciecie_liniowe_cubit.dart'
    as _i17;
import '../modules/wciecie_liniowe/cubit/wciecie_liniowe_cubit.dart' as _i22;
import '../modules/wciecie_liniowe/data/data_source/obliczenia_liniowe.dart'
    as _i4;
import '../modules/wciecie_liniowe/data/data_source/wciecie_liniowe_service.dart'
    as _i11;
import '../modules/wciecie_liniowe/data/repository/baza_repo.dart' as _i13;
import '../modules/wciecie_liniowe/data/repository/obliczenia_repo.dart'
    as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ObliczeniaBiegunowa>(() => _i3.ObliczeniaBiegunowa());
    gh.lazySingleton<_i4.ObliczeniaLiniowe>(() => _i4.ObliczeniaLiniowe());
    gh.lazySingleton<_i5.ObliczeniaOrtogonalna>(
        () => _i5.ObliczeniaOrtogonalna());
    gh.lazySingleton<_i6.ObliczeniaWcieceKatowe>(
        () => _i6.ObliczeniaWcieceKatowe());
    gh.factory<_i7.OrtogonalnaCubit>(() =>
        _i7.OrtogonalnaCubit(obliczenia: gh<_i5.ObliczeniaOrtogonalna>()));
    gh.lazySingleton<_i8.SaveBiegunowaService>(
        () => _i8.SaveBiegunowaService());
    gh.lazySingleton<_i9.SaveOrtogonalnaService>(
        () => _i9.SaveOrtogonalnaService());
    gh.lazySingleton<_i10.SaveWciecieKatoweService>(
        () => _i10.SaveWciecieKatoweService());
    gh.lazySingleton<_i11.SaveWciecieLinioweService>(
        () => _i11.SaveWciecieLinioweService());
    gh.lazySingleton<_i12.WciecieLinioweRepository>(
        () => _i12.WciecieLinioweRepository(gh<_i4.ObliczeniaLiniowe>()));
    gh.lazySingleton<_i13.WciecieLinioweRepositorySave>(() =>
        _i13.WciecieLinioweRepositorySave(
            gh<_i11.SaveWciecieLinioweService>()));
    gh.lazySingleton<_i14.WciecieRepository>(
        () => _i14.WciecieRepository(gh<_i6.ObliczeniaWcieceKatowe>()));
    gh.lazySingleton<_i15.WciecieRepositorySave>(
        () => _i15.WciecieRepositorySave(gh<_i10.SaveWciecieKatoweService>()));
    gh.factory<_i16.BiegunowaCubit>(
        () => _i16.BiegunowaCubit(obliczenia: gh<_i3.ObliczeniaBiegunowa>()));
    gh.factory<_i17.CrudWciecieLinioweCubit>(() =>
        _i17.CrudWciecieLinioweCubit(gh<_i13.WciecieLinioweRepositorySave>()));
    gh.factory<_i18.HistoryBiegunowaCubit>(
        () => _i18.HistoryBiegunowaCubit(gh<_i8.SaveBiegunowaService>()));
    gh.factory<_i19.HistoryOrtogonalnaCubit>(
        () => _i19.HistoryOrtogonalnaCubit(gh<_i9.SaveOrtogonalnaService>()));
    gh.factory<_i20.HistoryWciecieKatoweCubit>(
        () => _i20.HistoryWciecieKatoweCubit(gh<_i15.WciecieRepositorySave>()));
    gh.factory<_i21.WciecieKatoweCubit>(
        () => _i21.WciecieKatoweCubit(gh<_i14.WciecieRepository>()));
    gh.factory<_i22.WciecieLinioweCubit>(
        () => _i22.WciecieLinioweCubit(gh<_i12.WciecieLinioweRepository>()));
    return this;
  }
}
