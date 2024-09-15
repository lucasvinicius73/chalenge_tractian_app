import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

class CustomHeaderAssets implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;

  const CustomHeaderAssets({
    required this.minExtent,
    required this.maxExtent,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
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
                //controller.searchItemNode(value);
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
                        // color: controller.operating == true
                        //     ? Colors.blue
                        //     : const Color(0xFF77818C),
                        )),
                  ),
                  icon: Image.asset(
                    "assets/icons/energyIcon.png",
                    // color: controller.operating == true
                    //     ? Colors.blue
                    //     : const Color(0xFF77818C),
                  ),
                  label: Text(
                    "Sensor de Energia",
                    maxLines: 1,
                    style: TextStyle(
                      // color: controller.operating == true
                      //     ? Colors.blue
                      //     : const Color(0xFF77818C),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    //controller.changeFilterState("operating");
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
                        // color: controller.critic == true
                        //     ? Colors.blue
                        //     : const Color(0xFF77818C),
                        )),
                  ),
                  icon: Image.asset(
                    "assets/icons/criticalIcon.png",
                    // color: controller.critic == true
                    //     ? Colors.blue
                    //     : const Color(0xFF77818C),
                  ),
                  label: Text(
                    "Critico",
                    style: TextStyle(
                        // color: controller.critic == true
                        //     ? Colors.blue
                        //     : const Color(0xFF77818C),
                        fontFamily: 'Roboto'),
                  ),
                  onPressed: () {
                    //controller.changeFilterState("alert");
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider? get vsync => null;
}
