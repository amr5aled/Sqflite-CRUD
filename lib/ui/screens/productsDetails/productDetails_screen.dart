import 'package:crudsqlite/core/models/item_model.dart';
import 'package:crudsqlite/ui/widgets/app_size_boxes.dart';
import 'package:crudsqlite/ui/widgets/size_extension.dart';
import 'package:flutter/material.dart';
import '../../helper/navigator.dart';
import '../../resources/index.dart';
import '../../widgets/app_text_display.dart';

import 'widget/background_product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Items? items;

  const ProductDetailScreen({Key? key, this.items}) : super(key: key);
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DetailsBackground(child: _buildBody()));
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildProduct(),
        ]),
      ),
    );
  }

  _buildProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleProduct(),
        const Divider(),
        _buildDescription(),
        10.heightBox,
      ],
    );
  }

  _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppText(
            text: AppStrings.description,
            style: AppTextStyles.h2_20.copyWith(fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: AppText(
            text:
                'Nam libero tempore, cum soluta nobis est eligendi \n optio cumque nihil impedit quo minus id quod maxime placeat\n facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. ',
            overflow: TextOverflow.clip,
            maxLines: 4,
            style: AppTextStyles.h2_18.copyWith(fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }

  _buildTitleProduct() {
    return AppText(
      text: 'Olivia  Shayn  Military  TV \n  Cabinet',
      style: AppTextStyles.h1
          .copyWith(fontSize: 28.sp, fontWeight: FontWeight.normal),
    );
  }
}
