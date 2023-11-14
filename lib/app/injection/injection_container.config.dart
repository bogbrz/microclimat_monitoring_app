// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:microclimat_monitoring_app/cubits/sensor_five_cubit/cubit/sensor_five_cubit.dart'
    as _i13;
import 'package:microclimat_monitoring_app/cubits/sensor_four_cubit/cubit/sensor_four_cubit.dart'
    as _i14;
import 'package:microclimat_monitoring_app/cubits/sensor_one_cubit/cubit/sensor_one_cubit.dart'
    as _i15;
import 'package:microclimat_monitoring_app/cubits/sensor_three_cubit/cubit/sensor_three_cubit.dart'
    as _i16;
import 'package:microclimat_monitoring_app/cubits/sensor_two_cubit/cubit/sensor_two_cubit.dart'
    as _i17;
import 'package:microclimat_monitoring_app/data_source/sensor_five_data_source.dart'
    as _i3;
import 'package:microclimat_monitoring_app/data_source/sensor_four_data_source.dart'
    as _i5;
import 'package:microclimat_monitoring_app/data_source/sensor_one_data_source.dart'
    as _i7;
import 'package:microclimat_monitoring_app/data_source/sensor_three_data_source.dart'
    as _i9;
import 'package:microclimat_monitoring_app/data_source/sensor_two_data_source.dart'
    as _i11;
import 'package:microclimat_monitoring_app/domain/repositories/sensor_five_repository.dart'
    as _i4;
import 'package:microclimat_monitoring_app/domain/repositories/sensor_four_repository.dart'
    as _i6;
import 'package:microclimat_monitoring_app/domain/repositories/sensor_one_repository.dart'
    as _i8;
import 'package:microclimat_monitoring_app/domain/repositories/sensor_three_repository.dart'
    as _i10;
import 'package:microclimat_monitoring_app/domain/repositories/sensor_two_repository.dart'
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
    gh.factory<_i3.SensorFiveDataSource>(() => _i3.SensorFiveDataSource());
    gh.factory<_i4.SensorFiveRepository>(() => _i4.SensorFiveRepository(
        sensorFiveDataSource: gh<_i3.SensorFiveDataSource>()));
    gh.factory<_i5.SensorFourDataSource>(() => _i5.SensorFourDataSource());
    gh.factory<_i6.SensorFourRepository>(() => _i6.SensorFourRepository(
        sensorFourDataSource: gh<_i5.SensorFourDataSource>()));
    gh.factory<_i7.SensorOneDataSource>(() => _i7.SensorOneDataSource());
    gh.factory<_i8.SensorOneRepository>(() => _i8.SensorOneRepository(
        sensorOneDataSource: gh<_i7.SensorOneDataSource>()));
    gh.factory<_i9.SensorThreeDataSource>(() => _i9.SensorThreeDataSource());
    gh.factory<_i10.SensorThreeRepository>(() => _i10.SensorThreeRepository(
        sensorThreeDataSource: gh<_i9.SensorThreeDataSource>()));
    gh.factory<_i11.SensorTwoDataSource>(() => _i11.SensorTwoDataSource());
    gh.factory<_i12.SensorTwoRepository>(() => _i12.SensorTwoRepository(
        sensorTwoDataSource: gh<_i11.SensorTwoDataSource>()));
    gh.factory<_i13.SensorFiveCubit>(() => _i13.SensorFiveCubit(
        sensorFiveRepository: gh<_i4.SensorFiveRepository>()));
    gh.factory<_i14.SensorFourCubit>(() => _i14.SensorFourCubit(
        sensorFourRepository: gh<_i6.SensorFourRepository>()));
    gh.factory<_i15.SensorOneCubit>(() => _i15.SensorOneCubit(
        sensorOneRepository: gh<_i8.SensorOneRepository>()));
    gh.factory<_i16.SensorThreeCubit>(() => _i16.SensorThreeCubit(
        sensorThreeRepository: gh<_i10.SensorThreeRepository>()));
    gh.factory<_i17.SensorTwoCubit>(() => _i17.SensorTwoCubit(
        sensorTwoRepository: gh<_i12.SensorTwoRepository>()));
    return this;
  }
}
