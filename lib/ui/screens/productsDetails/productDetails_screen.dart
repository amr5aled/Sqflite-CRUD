import '../../../core/models/item_model.dart';
import '../../widgets/app_size_boxes.dart';
import '../../widgets/size_extension.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
        body: DetailsBackground(
      child: _buildBody(),
      items: widget.items,
    ));
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
        _buildDate(),
        10.heightBox,
        _buildStatus()
      ],
    );
  }

  _buildDescription() {
    return _buildKeyAndValue(
        key: AppStrings.description,
        value: widget.items!.description,
        maxLines: 4);
  }

  _buildTitleProduct() {
    return Center(
      child: AppText(
        text: widget.items!.title,
        style: AppTextStyles.h1
            .copyWith(fontSize: 28.sp, fontWeight: FontWeight.normal),
      ),
    );
  }

  _buildKeyAndValue({String? key, String? value, int? maxLines}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppText(
            text: key!,
            style: AppTextStyles.h2_20.copyWith(
                fontWeight: FontWeight.normal, color: AppPalette.errorColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: AppText(
            text: value,
            overflow: TextOverflow.clip,
            maxLines: maxLines ?? 1,
            style: AppTextStyles.h2_18.copyWith(fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }

  _buildDate() {
    return _buildKeyAndValue(
      key: AppStrings.date,
      value: widget.items!.createdAt,
    );
  }

  _buildStatus() {
    return _buildKeyAndValue(
      key: AppStrings.status,
      value: widget.items!.status,
    );
  }
}
