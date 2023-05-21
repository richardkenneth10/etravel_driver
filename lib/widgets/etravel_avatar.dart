import 'package:etravel_driver/config/app_colors.dart';
import 'package:flutter/material.dart';

class ETravelAvatar extends StatelessWidget {
  const ETravelAvatar({Key? key, this.image}) : super(key: key);

  final String? image;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: AppColors.inputField,
        child: image == null || image!.trim().isEmpty
            ? Center(
                child: Icon(
                  Icons.person_rounded,
                  color: AppColors.grey,
                ),
              )
            : Image.asset(
                image!,
                fit: BoxFit.cover,
                // placeholder: (context, url) => const Center(
                //   child: CupertinoActivityIndicator(),
                // ),
                // errorWidget: (context, url, error) => Icon(
                //   Icons.error,
                //   color: Colors.red.withOpacity(0.6),
                // ),
              ),
      ),
    );
  }
}
