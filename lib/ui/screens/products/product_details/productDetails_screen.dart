// import 'package:flutter/material.dart';
// import '../../../helper/navigator.dart';
// import '../../../resources/index.dart';
// import '../../../widgets/app_text_display.dart';
// import '../../../widgets/index.dart';

// import 'background_product.dart';

// class ProductDetailScreen extends StatefulWidget {
//   @override
//   _ProductDetailScreenState createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: DetailsBackground(child: _buildBody()));
//   }

//   Widget _buildBody() {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: SingleChildScrollView(
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           _buildProduct(),
//         ]),
//       ),
//     );
//   }

//   _buildProduct() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildTitleProduct(),
//         _buildPriceAndQuantity(),
//         Divider(),
//         _buildDescription(),
//         10.heightBox,
//         _buildSelection(),
//         _buildshippingAndReturn(),
//         _buildAddCart(),
//       ],
//     );
//   }

//   _buildPriceAndQuantity() {
//     return Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: AppText(
//             text: '\$1,499.00',
//             style: AppTextStyles.h2.copyWith(
//                 fontWeight: FontWeight.normal, color: AppPalette.skeletonColor),
//           ),
//         ),
//         70.widthBox,
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CircleAvatar(
//                   radius: 14.0,
//                   backgroundColor: AppPalette.borderLightColor,
//                   child: Icon(
//                     Icons.remove,
//                     size: 16,
//                     color: AppPalette.textColor,
//                   ),
//                 ),
//                 CircleAvatar(
//                   radius: 20.0,
//                   backgroundColor: AppPalette.borderLighterColor,
//                   child: AppText(
//                     text: '2',
//                     style: TextStyle(color: AppPalette.textWhiteColor),
//                   ),
//                 ),
//                 CircleAvatar(
//                   radius: 14.0,
//                   foregroundColor: AppPalette.borderLightColor,
//                   backgroundColor: AppPalette.borderLightColor,
//                   child: Icon(
//                     Icons.add,
//                     size: 16,
//                     color: AppPalette.textColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   _buildSelection() {
//     return Column(
//       children: [
//         _buildKeyValue(AppStrings.sku, '545'),
//         _buildKeyValue(AppStrings.categories, 'Furniture, Accessories'),
//         _buildKeyValue(AppStrings.tags, '#furniture, #table'),
//         _buildKeyValue(AppStrings.dimensions, '185 x 40 x 62 cm (L x W x H)'),
//       ],
//     );
//   }

//   Padding _buildKeyValue(String key, String value) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: AppText(
//               translation: key,
//               style: AppTextStyles.title1
//                   .copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
//             ),
//           ),
//           Expanded(
//             child: AppText(
//                 text: value,
//                 style: AppTextStyles.title1.copyWith(
//                   fontWeight: FontWeight.normal,
//                 )),
//           ),
//         ],
//       ),
//     );
//   }

//   _buildAddCart() {
//     return AppPadding(
//       child: AppButton(
//         translation: AppStrings.addCart,
//         onTap: () {
//           pushName(context, AppRoute.checkout);
//         },
//       ),
//     );
//   }

//   _buildshippingAndReturn() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5.0),
//       child: Row(
//         children: [
//           Container(
//             child: Icon(Icons.arrow_right),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(3.0),
//             child: AppText(
//                 translation: AppStrings.shippingAndReturn,
//                 style: AppTextStyles.title1.copyWith(
//                   fontWeight: FontWeight.normal,
//                 )),
//           ),
//         ],
//       ),
//     );
//   }

//   _buildDescription() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: AppText(
//             translation: AppStrings.description,
//             style: AppTextStyles.h2_20.copyWith(fontWeight: FontWeight.normal),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: AppText(
//             text:
//                 'Nam libero tempore, cum soluta nobis est eligendi \n optio cumque nihil impedit quo minus id quod maxime placeat\n facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. ',
//             overflow: TextOverflow.clip,
//             maxLines: 4,
//             style: AppTextStyles.h2_18.copyWith(fontWeight: FontWeight.normal),
//           ),
//         ),
//       ],
//     );
//   }

//   _buildTitleProduct() {
//     return AppText(
//       text: 'Olivia  Shayn  Military  TV \n  Cabinet',
//       style: AppTextStyles.h1
//           .copyWith(fontSize: 28.sp, fontWeight: FontWeight.normal),
//     );
//   }
// }
