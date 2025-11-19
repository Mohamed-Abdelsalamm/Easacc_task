import 'package:flutter/material.dart';
import 'package:easacc_flutter_task/core/components/custom_arrow_back.dart';

class CustomArrowBackAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomArrowBackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: CustomArrowBack(),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(61.0);
}
