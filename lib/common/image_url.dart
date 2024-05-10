import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageUrlCarouselCustom extends ConsumerWidget {
  const ImageUrlCarouselCustom(
      {super.key, required this.urlImage, required this.index});
  final String urlImage;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Image.network(
      urlImage,
      fit: BoxFit.cover,
      
    );
  }
}
