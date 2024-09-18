import 'package:challenge_tractian_app/shared/models/compane_model.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final CompanyModel companyModel;
  const MenuButton({super.key, required this.companyModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),
      child: SizedBox(
        width: 317,
        height: 76,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
              backgroundColor: const WidgetStatePropertyAll(Color(0xFF2188FF))),
          child: Row(
            children: [
              Image.asset('assets/icons/homeicon.png'),
              const SizedBox(
                width: 20,
              ),
              Text(
                companyModel.name,
                style: const TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Roboto'),
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/assets_view',
                arguments: {'companyModel': companyModel});
          },
        ),
      ),
    );
  }
}
