import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';
import 'package:shimmer/shimmer.dart';

class AntiShimmer extends StatelessWidget {
  const AntiShimmer(
      {Key? key,
      this.height,
      required this.width,
      this.borderRadius,
      this.margin,
      this.type = ShimmerType.bodySmall,
      this.line = 1,
      this.lineHeight = 1})
      : super(key: key);
  final double width;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final ShimmerType? type;
  final int? line;
  final double lineHeight;

  double getType() {
    switch (type) {
      case ShimmerType.bodySmall:
        return 16.0;
      case ShimmerType.bodyMedium:
        return 20.0;
      case ShimmerType.bodyLarge:
        return 24.0;
      case ShimmerType.labelSmall:
        return 16.0;
      case ShimmerType.labelMedium:
        return 16.0;
      case ShimmerType.labelLarge:
        return 20.0;
      case ShimmerType.titleSmall:
        return 20.0;
      case ShimmerType.titleMedium:
        return 24.0;
      case ShimmerType.titleLarge:
        return 28.0;
      case ShimmerType.headlineSmall:
        return 32.0;
      case ShimmerType.headlineMedium:
        return 36.0;
      case ShimmerType.headlineLarge:
        return 40.0;
      case ShimmerType.displaySmall:
        return 44.0;
      case ShimmerType.displayMedium:
        return 52.0;
      case ShimmerType.displayLarge:
        return 26.0;
      case ShimmerType.h1:
        return 28.0;
      case ShimmerType.h2:
        return 24.0;
      case ShimmerType.h3:
        return 20.0;
      case ShimmerType.h4:
        return 18.0;
      case ShimmerType.h5:
        return 16.0;
      case ShimmerType.h6:
        return 14.0;
      case ShimmerType.body:
        return 16.0;
      case ShimmerType.bodySm:
        return 14.0;
      case ShimmerType.caption:
        return 12.0;
      case ShimmerType.captionSm:
        return 10.0;
      case ShimmerType.captionXs:
        return 8.0;
      case ShimmerType.title:
        return 16.0;
      case ShimmerType.subtitle:
        return 12.0;
      default:
        return 0.0;
    }
  }

  Widget _buildLineShimmer() {
    List<Widget> listShimmer = [];
    for (int i = 1; i <= line!; i++) {
      listShimmer.add(_buildShimmer());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listShimmer,
    );
  }

  Widget _buildShimmer() {
    return Shimmer(
      gradient: LinearGradient(
        colors: [
          Color(0xFFEBEBF4),
          Color(0xFFF4F4F4),
          Color(0xFFEBEBF4),
        ],
        stops: [
          0.1,
          0.3,
          0.4,
        ],
        begin: Alignment(-1.0, -0.3),
        end: Alignment(1.0, 0.3),
        tileMode: TileMode.clamp,
      ),
      period: Duration(milliseconds: 1000), // durasi animasi
      direction: ShimmerDirection.ltr, // arah animasi
      child: Container(
        width: width,
        height: height ?? getType() * lineHeight,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLineShimmer();
  }
}
