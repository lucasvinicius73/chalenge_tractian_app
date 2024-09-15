import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const CustomAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 48),
      child: AppBar(
        title: title != null
            ? Text(
                title!,
                style: const TextStyle(color: Colors.white),
              )
            : Image.asset('assets/LOGOTRACTIAN.png'),
        backgroundColor: const Color(0xFF17192D),
        centerTitle: true,
        leading: title != null
            ? const BackButton(
                color: Colors.white,
              )
            : null,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
