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

bool drop = false;

class _NodeWidgetState extends State<NodeWidget> {
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
      onTap: () {
        setState(() {
          drop = !drop;
        });
      },
      child: Row(
        children: [
          node.children.isNotEmpty
              ? Icon(drop == true ? Icons.arrow_drop_down : Icons.arrow_drop_up)
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
            width: 150,
            child: Text(
              node.name,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: status ?? const SizedBox(),
          )
        ],
      ),
    );
  }
}
