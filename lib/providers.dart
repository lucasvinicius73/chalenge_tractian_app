import 'package:chalenge_tractian_app/app/Asset/asset_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

  setupProviders(){
    getIt.registerLazySingleton<AssetController>(
      () => AssetController());
  }
