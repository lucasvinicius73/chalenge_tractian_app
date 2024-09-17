import 'package:challenge_tractian_app/app/asset/asset_controller.dart';
import 'package:challenge_tractian_app/providers.dart';
import 'package:challenge_tractian_app/shared/widgets/custom_button_header.dart';
import 'package:flutter/material.dart';

class WidgetHeader extends StatelessWidget {
  const WidgetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = getIt<AssetController>();

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) => Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 5),
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
                        borderSide: const BorderSide(
                            color: Color(0xFFF1F5F4), width: 3),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                            color: Color(0xFFF1F5F4), width: 3),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomButtonHeader(
                      label: "Sensor de Energia",
                      iconPath: "assets/icons/energyIcon.png",
                      isActive: controller.operating,
                      onPressed: () =>
                          controller.changeFilterState("operating"),
                    ),
                    const SizedBox(width: 8),
                    CustomButtonHeader(
                      label: "Crítico",
                      iconPath: "assets/icons/criticalIcon.png",
                      isActive: controller.critic,
                      onPressed: () => controller.changeFilterState("alert"),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () => controller.disposeSearch(),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFF77818C), width: 1),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        height: 32,
                        width: 32,
                        child: const Center(
                          child: Icon(Icons.refresh),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
