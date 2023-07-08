import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const ProfileItem({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    title,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                    maxLines: 4,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.keyboard_arrow_right),
              ],
            ),
            Divider(
              thickness: 1,
              color: lightGreenColor,
            ),
          ],
        ),
      ),
    );
  }
}
