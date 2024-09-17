import 'package:challenge_tractian_app/app/home/home_controller.dart';
import 'package:challenge_tractian_app/shared/widgets/custom_app_bar.dart';
import 'package:challenge_tractian_app/shared/widgets/error_widget.dart';
import 'package:challenge_tractian_app/shared/widgets/loading_widget.dart';
import 'package:challenge_tractian_app/shared/widgets/menu_button.dart';
import 'package:challenge_tractian_app/shared/states.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var controller = HomeController();

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
              body = WidgetError(error: state, title: "Não foi possivel carregar as empresas",);
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
