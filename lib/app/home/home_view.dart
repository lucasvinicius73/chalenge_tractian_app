import 'package:challenge_tractian_app/app/home/home_controller.dart';
import 'package:challenge_tractian_app/providers.dart';
import 'package:challenge_tractian_app/shared/utils/widgets/custom_app_bar.dart';
import 'package:challenge_tractian_app/shared/utils/widgets/error_widget.dart';
import 'package:challenge_tractian_app/shared/utils/widgets/loading_widget.dart';
import 'package:challenge_tractian_app/shared/utils/widgets/menu_button.dart';
import 'package:challenge_tractian_app/shared/states/states.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var controller = getIt<HomeController>();

  @override
  void initState() {
    controller.getCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          final StateModel state = controller.getState();
          Widget body = Container();
          switch (state) {
            case Loading _:
              body = const LoadingWidget();
            case Error _:
              body = WidgetError(
                error: state,
                title: "Não foi possivel carregar as empresas",
                restard: () => controller.getCompanies(),
              );
            default:
              body = buildBodyView();
          }
          return body;
        },
      ),
    );
  }

  Widget buildBodyView() {
    return Center(
        child: ListView.builder(
      itemCount: controller.companies.length,
      itemBuilder: (context, index) =>
          MenuButton(companyModel: controller.companies[index]),
    ));
  }
}
