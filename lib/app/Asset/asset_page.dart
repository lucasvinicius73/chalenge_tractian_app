import 'package:chalenge_tractian_app/app/widgets/custom_app_bar.dart';
import 'package:chalenge_tractian_app/shared/models/compane_model.dart';
import 'package:flutter/material.dart';

class AssetView extends StatefulWidget {
  final CompanyModel companyModel;
  const AssetView({super.key, required this.companyModel});

  @override
  State<AssetView> createState() => _AssetViewState();
}

class _AssetViewState extends State<AssetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "${widget.companyModel.name} Assets",
      ),
    );
  }
}
