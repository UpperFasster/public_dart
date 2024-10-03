import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoader extends StatelessWidget {
  final String url;
  final BorderRadius borderRadius;
  final BoxFit fit;
  const ImageLoader(
    this.url, {
    super.key,
    this.borderRadius = BorderRadius.zero,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        url,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          // return Center(
          //   child: CircularProgressIndicator.adaptive(
          //     value: loadingProgress.expectedTotalBytes != null
          //         ? loadingProgress.cumulativeBytesLoaded /
          //             loadingProgress.expectedTotalBytes!
          //         : null,
          //   ),
          // );

          // const f = Color.fromRGBO(245, 245, 245, 1);
          // const s = Color.fromRGBO(220, 220, 220, 1);
          Color f = Colors.grey.shade300;
          Color s = Colors.grey.shade200;

          return Shimmer.fromColors(
            baseColor: f,
            highlightColor: s,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.white,
            ),
          );
        },
        errorBuilder: (context, child, stackTrace) {
          return Container(
            color: Colors.white38,
            child: LayoutBuilder(
              builder: (context, constr) {
                return const Center(
                  child: Icon(Icons.error_outline_outlined),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
