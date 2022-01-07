// ignore_for_file: sized_box_for_whitespace

import 'package:crudsqlite/ui/widgets/app_size_boxes.dart';
import 'package:crudsqlite/ui/widgets/size_extension.dart';
import 'package:flutter/material.dart';

import '../../../resources/index.dart';

class DetailsBackground extends StatelessWidget {
  const DetailsBackground({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackgorund(),
        _buildLeftButton(context),
        _buildRightButton(),
        _buildBody(),
      ],
    );
  }

  Widget _buildBackgorund() {
    return Image.network(
      "https://www.unodc.org/res/frontpage/2020/November/unodc-celebrates-world-childrens-day_html/Standard_Post_6.png",
      fit: BoxFit.cover,
      height: 345,
    );
  }

  Widget _buildLeftButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: SafeArea(
          child: Align(
        alignment: AlignmentDirectional.topStart,
        child: Container(
          height: 60.h,
          width: 60.w,
          // ignore: prefer_const_constructors
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.arrow_back),
          ),
        ),
      )),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: 305.h),
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(70.r)),
        ),
        child: child,
      ),
    );
  }

  _buildRightButton() {
    return SafeArea(
      child: Row(
        children: [
          290.widthBox,
          // ignore: sized_box_for_whitespace
          Container(height: 60.h, width: 60.w, child: const Icon(Icons.edit)),

          Container(height: 60.h, width: 60.w, child: const Icon(Icons.delete)),
        ],
      ),
    );
  }
}
