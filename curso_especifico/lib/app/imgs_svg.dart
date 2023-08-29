import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SvgImageWidget extends StatelessWidget {
  final String svgAssetPath;
  final double width;
  final double height;

  const SvgImageWidget({
    Key? key,
    required this.svgAssetPath,
    this.width = 35,
    this.height = 35,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgAssetPath,
      width: width,
      height: height,
    );
  }
}
