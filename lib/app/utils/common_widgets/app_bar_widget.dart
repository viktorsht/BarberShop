import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBackPressed; // Nova função

  const AppBarWidget({
    super.key,
    required this.title,
    this.onBackPressed, // Adicione a nova função
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w500
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      centerTitle: true,
      leading: onBackPressed != null
      ? IconButton(
          onPressed: onBackPressed, // Chame a função de navegação
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.primary,
          ),
        )
      : null,
      elevation: 1,
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}