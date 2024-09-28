import 'package:challenge_tractian_app/app/asset/asset_controller.dart';
import 'package:challenge_tractian_app/app/home/home_controller.dart';
import 'package:challenge_tractian_app/shared/repository/http_api_repository.dart';
import 'package:challenge_tractian_app/shared/service/search_node_service.dart';
import 'package:challenge_tractian_app/shared/service/tree_build_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getIt = GetIt.instance;
Client client = Client();

setupProviders() {
  getIt.registerLazySingleton<HttpApiRepository>(
      () => HttpApiRepository(client: client));
  getIt.registerLazySingleton<TreeBuildService>(() => TreeBuildService());
  getIt.registerLazySingleton<SearchNodeService>(() => SearchNodeService());
  getIt.registerLazySingleton<HomeController>(
      () => HomeController(repository: getIt<HttpApiRepository>()));

  getIt.registerLazySingleton<AssetController>(() => AssetController(
      repository: getIt<HttpApiRepository>(),
      searchNodeService: getIt<SearchNodeService>(),
      treeBuildService: getIt<TreeBuildService>()));
}
