import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easacc_flutter_task/generated/assets.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.fit,
    this.borderRadius = 0,
  });
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => SpinKitCircle(
          color: Colors.grey.shade300,
          size: width < height ? width / 2 : height / 2,
        ),
        errorWidget: (context, url, error) => Image.asset(
          Assets.assetsImagesEasaccLogo,
          width: width,
          height: height,
          fit: fit,
        ),
      ),
    );
  }
}
