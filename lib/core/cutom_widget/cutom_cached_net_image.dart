import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String? url;
  final BuildContext context;
  final BoxFit? boxFit;
  final double? width;
  final double? height;
  final double? borderRadius;
  const CustomCachedNetworkImage({
    Key? key,
    this.url,
    required this.context,
    this.boxFit,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
      child: (Uri.parse(url!).isAbsolute)
          ? CachedNetworkImage(
              imageUrl: url!,
              fit: (boxFit) ?? BoxFit.cover,
              width: width ?? null,
              height: height ?? null,
              placeholder: (context, url) => Center(
                child: SpinKitWave(
                  color: kPrimaryColor,
                  size: 20,
                ),

                //  CircularProgressIndicator(
                // backgroundColor: kPrimaryColor,
                // valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                // ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )
          : Icon(
              Icons.image,
              color: kPrimaryColor,
            ),
    );
  }
}
