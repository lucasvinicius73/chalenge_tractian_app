import 'package:chalenge_tractian_app/app/Home/home_controller.dart';
import 'package:chalenge_tractian_app/app/widgets/custom_app_bar.dart';
import 'package:chalenge_tractian_app/app/widgets/menu_button.dart';
import 'package:chalenge_tractian_app/shared/states.dart';
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
              body = buildLoading();
            case Error _:
              body = buildErrorWarning(state);
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

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorWarning(Error error) {
    return Center(
      child: Text("Não foi possivel carregar as empresas: \n$error"),
    );
  }
}
