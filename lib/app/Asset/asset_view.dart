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
                SliverToBoxAdapter(
                  child: buildheader(),
                ),
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

  Widget buildheader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 350,
            height: 40,
            child: TextFormField(
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  controller.fetchSearch(value);
                }
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  controller.fetchSearch(value);
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  top: 8,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                ),
                hintText: 'Buscar Ativo ou Local',
                isDense: true,
                fillColor: const Color(0xFFEAEFF3),
                filled: true,
                prefixIconConstraints: const BoxConstraints(
                  minHeight: 48,
                  minWidth: 38,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide:
                      const BorderSide(color: Color(0xFFF1F5F4), width: 3),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide:
                      const BorderSide(color: Color(0xFFF1F5F4), width: 3),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 180,
                height: 32,
                child: OutlinedButton.icon(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    side: WidgetStatePropertyAll(BorderSide(
                      color: controller.operating == true
                          ? Colors.blue
                          : const Color(0xFF77818C),
                    )),
                  ),
                  icon: Image.asset(
                    "assets/icons/energyIcon.png",
                    color: controller.operating == true
                        ? Colors.blue
                        : const Color(0xFF77818C),
                  ),
                  label: Text(
                    "Sensor de Energia",
                    maxLines: 1,
                    style: TextStyle(
                      color: controller.operating == true
                          ? Colors.blue
                          : const Color(0xFF77818C),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    controller.changeFilterState("operating");
                  },
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 106,
                height: 32,
                child: OutlinedButton.icon(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3))),
                    side: WidgetStatePropertyAll(BorderSide(
                      color: controller.critic == true
                          ? Colors.blue
                          : const Color(0xFF77818C),
                    )),
                  ),
                  icon: Image.asset(
                    "assets/icons/criticalIcon.png",
                    color: controller.critic == true
                        ? Colors.blue
                        : const Color(0xFF77818C),
                  ),
                  label: Text(
                    "Critico",
                    style: TextStyle(
                        color: controller.critic == true
                            ? Colors.blue
                            : const Color(0xFF77818C),
                        fontFamily: 'Roboto'),
                  ),
                  onPressed: () {
                    controller.changeFilterState("alert");
                  },
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => controller.disposeSearch(),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF77818C), width: 1),
                        borderRadius: BorderRadius.circular(3)),
                    height: 32,
                    width: 32,
                    child: const Center(
                      child: Icon(Icons.refresh),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildLoading() {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildErrorWarning(Error error) {
    return SliverFillRemaining(
      child: Center(
        child: Text("Não foi possivel carregar as empresas: \n${error.error}"),
      ),
    );
  }
}
