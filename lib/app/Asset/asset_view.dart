import 'package:challenge_tractian_app/app/Asset/asset_controller.dart';
import 'package:challenge_tractian_app/app/Asset/custom_header_assets.dart';
import 'package:challenge_tractian_app/app/widgets/custom_app_bar.dart';
import 'package:challenge_tractian_app/app/widgets/node_widget.dart';
import 'package:challenge_tractian_app/shared/models/compane_model.dart';
import 'package:challenge_tractian_app/shared/states.dart';
import 'package:flutter/material.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class AssetView extends StatefulWidget {
  final CompanyModel companyModel;
  const AssetView({super.key, required this.companyModel});

  @override
  State<AssetView> createState() => _AssetViewState();
}

class _AssetViewState extends State<AssetView> {
  var controller = AssetController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    controller.fetchAll(widget.companyModel.id);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 1000) {
        if (controller.showFab == false) {
          controller.setShowFab(true);
        }
      } else if (controller.showFab == true) {
        controller.setShowFab(false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
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
        return Scaffold(
            appBar: CustomAppBar(
              title: "${widget.companyModel.name} Assets",
            ),
            floatingActionButton: AnimatedOpacity(
              opacity: controller.showFab ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 250),
              child: FloatingActionButton(
                onPressed: () {
                  _scrollController.animateTo(
                    0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                },
                child: const Icon(Icons.arrow_upward),
              ),
            ),
            body: CustomScrollView(
              controller: _scrollController,
              slivers: [
                const SliverPersistentHeader(
                    // floating: true,
                    // pinned: true,
                    delegate:
                        CustomHeaderAssets(minExtent: 120, maxExtent: 120)),
                list
              ],
            ));
      },
    );
  }

  Widget buildTree() {
    return SuperSliverList(
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
