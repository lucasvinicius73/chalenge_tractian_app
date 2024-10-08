import 'package:challenge_tractian_app/app/asset/asset_controller.dart';
import 'package:challenge_tractian_app/shared/utils/widgets/custom_app_bar.dart';
import 'package:challenge_tractian_app/shared/utils/widgets/error_widget.dart';
import 'package:challenge_tractian_app/shared/utils/widgets/header_assets_widget.dart';
import 'package:challenge_tractian_app/shared/utils/widgets/loading_widget.dart';
import 'package:challenge_tractian_app/shared/utils/widgets/node_widget.dart';
import 'package:challenge_tractian_app/providers.dart';
import 'package:challenge_tractian_app/shared/models/compane_model.dart';
import 'package:challenge_tractian_app/shared/states/states.dart';
import 'package:challenge_tractian_app/shared/utils/widgets/sliverHeader.dart';
import 'package:flutter/material.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class AssetView extends StatefulWidget {
  final CompanyModel companyModel;
  const AssetView({super.key, required this.companyModel});

  @override
  State<AssetView> createState() => _AssetViewState();
}

class _AssetViewState extends State<AssetView> {
  var controller = getIt<AssetController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    controller.fetchAll(widget.companyModel);
    _scrollController.addListener(_handleScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        final StateModel state = controller.getState();
        Widget widgetList = Container();
        switch (state) {
          case Loading _:
            widgetList = buildLoading();
          case Error _:
            widgetList = buildErrorWarning(state);
          case Empty _:
            widgetList = buildEmptyWarning();
          default:
            widgetList = buildTree();
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
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                child: const Icon(Icons.arrow_upward),
              ),
            ),
            body: CustomScrollView(
              //cacheExtent: 500,
              controller: _scrollController,
              slivers: [
                const SliverPersistentHeader(
                  pinned: true,
                  delegate: PersistentHeader(WidgetHeader()),
                ),
                widgetList
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
          return RepaintBoundary(
            child: NodeWidget(
              nodeModel: node,
              depth: depth,
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return const SliverFillRemaining(
        hasScrollBody: false, child: LoadingWidget());
  }

  Widget buildErrorWarning(Error error) {
    return SliverFillRemaining(
      child: WidgetError(
        error: error,
        title: "Não foi possivel montar a arvore",
        restard: () => controller.fetchAll(widget.companyModel),
      ),
    );
  }

  Widget buildEmptyWarning() {
    return const SliverFillRemaining(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search_off,
          size: 50,
        ),
        Text("Não foram encontrados itens na Lista"),
      ],
    )));
  }

  void _handleScroll() {
    bool shouldShowFab = _scrollController.position.pixels > 1000;
    if (shouldShowFab != controller.showFab) {
      controller.setShowFab(shouldShowFab);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    super.dispose();
  }
}
