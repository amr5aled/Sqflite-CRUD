import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String imagePath;
  final BoxFit? boxFit;
  final bool? circle;
  final double borderRaduis;

  AppNetworkImage(
      {this.width,
      this.borderRaduis = 0,
      this.boxFit,
      this.height,
      this.circle = false,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return circle == true
        ? ClipOval(
            child: _buildCachedImage(),
          )
        : _buildCachedImage();
  }

  _buildCachedImage() {
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder: (context, provider) => ClipRRect(
        borderRadius: BorderRadius.circular(borderRaduis),
        child: Image(
          width: width,
          height: height,
          fit: boxFit ?? BoxFit.cover,
          image: provider,
        ),
      ),
      placeholder: (context, url) => _buildSizedWidget(
          child: Container(
              width: width,
              height: height,
              child: Center(child: CircularProgressIndicator()))),
      errorWidget: (context, url, error) =>
          _buildSizedWidget(child: Icon(Icons.error)),
    );
  }

  _buildSizedWidget({required Widget child}) {
    return Container(
      width: width,
      height: height,
      child: Center(child: child),
    );
  }
}
