import 'package:chalenge_tractian_app/app/Asset/asset_controller.dart';
import 'package:chalenge_tractian_app/app/Asset/custom_header_assets.dart';
import 'package:chalenge_tractian_app/app/widgets/custom_app_bar.dart';
import 'package:chalenge_tractian_app/app/widgets/node_widget.dart';
import 'package:chalenge_tractian_app/shared/models/compane_model.dart';
import 'package:chalenge_tractian_app/shared/states.dart';
import 'package:flutter/material.dart';

class AssetView extends StatefulWidget {
  final CompanyModel companyModel;
  const AssetView({super.key, required this.companyModel});

  @override
  State<AssetView> createState() => _AssetViewState();
}

class _AssetViewState extends State<AssetView> {
  var controller = AssetController();

  @override
  void initState() {
    controller.fetchAll(widget.companyModel.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "${widget.companyModel.name} Assets",
        ),
        body: ListenableBuilder(
          listenable: controller,
          builder: (context, child) {
            final state = controller.getBuildTreeState();
            Widget list = Container();
            switch (state) {
              case Loading _:
                list = buildLoading();
              case Error _:
                list = buildErrorWarning(state);
              default:
                list = buildTree();
            }
            return CustomScrollView(
              slivers: [
                const SliverPersistentHeader(
                    // floating: true,
                    // pinned: true,
                    delegate:
                        CustomHeaderAssets(minExtent: 120, maxExtent: 120)),
                list
              ],
            );
          },
        ));
  }

  Widget buildTree() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: controller.mapNodes.length,
        (context, index) {
          final node = controller.mapNodes.keys.toList()[index];
          int depth = controller.mapNodes[node]!;

          return Padding(
              padding: EdgeInsets.only(left: 20.0 * depth),
              child: NodeWidget(nodeModel: node));
        },
      ),
    );
  }

  Widget buildLoading() {
    return const SliverToBoxAdapter(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildErrorWarning(Error error) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text("Não foi possivel carregar as empresas: \n$error"),
      ),
    );
  }
}
