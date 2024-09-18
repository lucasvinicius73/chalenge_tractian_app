import 'package:challenge_tractian_app/app/asset/asset_controller.dart';
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
  String icon = '';
  Icon? status;

  @override
  void initState() {
    super.initState();
    _setIconAndStatus(widget.nodeModel);
  }

  @override
  void didUpdateWidget(NodeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.nodeModel != widget.nodeModel) {
      _setIconAndStatus(widget.nodeModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.nodeModel.changeIsExpanded();
        if (controller.searchNode != null) {
          controller.updateTreeSearch();
        } else {
          controller.updateTree();
        }
      },
      child: SizedBox(
        height: 25,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.nodeModel.children.isNotEmpty
                ? Icon(widget.nodeModel.isExpanded == true
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
                widget.nodeModel.name,
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

  void _setIconAndStatus(NodeModel node) {
    if (node is LocationModel) {
      icon = 'assets/icons/GoLocation.png';
      status = null;
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
        } else if (node.status == "alert") {
          status = const Icon(
            Icons.circle,
            color: Colors.red,
            size: 13,
          );
        } else {
          status = null;
        }
      } else {
        status = null;
      }
    }
  }
}
