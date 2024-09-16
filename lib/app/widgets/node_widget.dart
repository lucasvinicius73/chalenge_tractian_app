import 'package:challenge_tractian_app/app/Asset/asset_controller.dart';
import 'package:challenge_tractian_app/providers.dart';
import 'package:challenge_tractian_app/shared/models/asset_model.dart';
import 'package:challenge_tractian_app/shared/models/location_model.dart';
import 'package:challenge_tractian_app/shared/models/node_model.dart';
import 'package:flutter/material.dart';

class NodeWidget extends StatefulWidget {
  final NodeModel nodeModel;
  const NodeWidget({super.key, required this.nodeModel});

  @override
  State<NodeWidget> createState() => _NodeWidgetState();
}

class _NodeWidgetState extends State<NodeWidget> {
  var controller = getIt<AssetController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String icon = '';
    Icon? status;
    NodeModel node = widget.nodeModel;
    if (node is LocationModel) {
      icon = 'assets/icons/GoLocation.png';
    } else if (node is AssetModel) {
      icon = 'assets/icons/asset.png';
      if (node.sensorType != null) {
        icon = "assets/icons/component.png";
        if (node.status == "operating") {
          status = const Icon(
            Icons.bolt,
            color: Colors.green,
            size: 20,
          );
        }
        if (node.status == "alert") {
          status = const Icon(
            Icons.circle,
            color: Colors.red,
            size: 13,
          );
        }
      }
    }
    return InkWell(
      onTap: node.children.isNotEmpty
          ? () {
              if (controller.searchNode != null) {
                node.changeIsExpanded();
                controller.updateTreeSearch();
              } else {
                node.changeIsExpanded();
                controller.updateTree();
              }
            }
          : null,
      child: SizedBox(
        height: 25,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            node.children.isNotEmpty
                ? Icon(node.isExpanded == true
                    ? Icons.arrow_drop_down
                    : Icons.arrow_drop_up)
                : const SizedBox(
                    width: 23,
                  ),
            icon.isNotEmpty
                ? Image.asset(
                    icon,
                    scale: 1.7,
                  )
                : const SizedBox(),
            SizedBox(
              width: 170,
              child: Text(
                node.name,
                overflow: TextOverflow.ellipsis,
                // maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: status ?? const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
