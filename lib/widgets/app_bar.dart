import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String titleText;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({
    Key? key,
    required this.titleText,
    required this.scaffoldKey,
  }) : super(key: key);

  Widget _getRectangeShape(double width) {
    return Container(
      height: 2,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color.fromRGBO(45, 45, 51, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Text(
          titleText,
          style: const TextStyle(
            color: Color.fromRGBO(45, 45, 51, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      leading: Center(
        child: IconButton(
          icon: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getRectangeShape(12),
              const SizedBox(
                height: 5.5,
              ),
              _getRectangeShape(18),
            ],
          ),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
