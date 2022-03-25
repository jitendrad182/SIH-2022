import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_college/services/db/db_2.dart';
import 'package:my_college/utils/app_sizes.dart';
import 'package:my_college/views/widgets/custom_app_bars/custom_app_bar_2.dart';

//TODO:
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const id = '/HomePage';
  final DbController2 _dbController2 = Get.find();

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      appBar: appBar2,
      // body: SafeArea(
      //   child: Obx(() {
      //     return _dbController4.isEmpty()
      //         ? const Center(child: CircularProgressIndicator())
      //         : Padding(
      //             padding: EdgeInsets.all(AppSizes.height10 * 1.5),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   children: [
      //                     Image.asset(
      //                       _dbController2.avatarImageConst(),
      //                       height: AppSizes.height10 * 5,
      //                     ),
      //                     SizedBox(width: AppSizes.width10),
      //                     Flexible(
      //                       child: RichText(
      //                         text: TextSpan(
      //                           children: [
      //                             TextSpan(
      //                               text: "welcome ",
      //                               style: TextStyle(
      //                                 fontSize: AppSizes.height10 * 2,
      //                                 fontWeight: FontWeight.bold,
      //                                 fontFamily: StringConst.nunitoSans,
      //                                 color: ColorConst.blackColor,
      //                               ),
      //                             ),
      //                             TextSpan(
      //                               text: _dbController2.userName(),
      //                               style: TextStyle(
      //                                 fontSize: AppSizes.height10 * 2,
      //                                 fontWeight: FontWeight.bold,
      //                                 fontFamily: StringConst.nunitoSans,
      //                                 color: ColorConst.primaryColor,
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //                 SizedBox(height: AppSizes.height10),
      //                 Row(
      //                   children: [
      //                     Flexible(
      //                       child: RichText(
      //                         text: TextSpan(
      //                           children: [
      //                             TextSpan(
      //                               text: 'Continue with your goals',
      //                               style: TextStyle(
      //                                 fontSize: AppSizes.height10 * 2,
      //                                 fontWeight: FontWeight.bold,
      //                                 fontFamily: StringConst.nunitoSans,
      //                                 color: ColorConst.primaryColor,
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(height: AppSizes.height10),
      //                 Expanded(
      //                   child: ListView.builder(
      //                     physics: const BouncingScrollPhysics(),
      //                     shrinkWrap: true,
      //                     itemCount: _dbController4.length(),
      //                     itemBuilder: (context, index) {
      //                       return Column(
      //                         children: [
      //                           Container(
      //                             width: double.infinity,
      //                             height: AppSizes.height10 * 15,
      //                             decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(
      //                                   AppSizes.height10 * 1.5),
      //                               color: _dbController4
      //                                   .goalCategoryColorConst(index),
      //                             ),
      //                             child: Padding(
      //                               padding:
      //                                   EdgeInsets.all(AppSizes.height10 * 0.7),
      //                               child: Row(
      //                                 children: [
      //                                   Expanded(
      //                                     child: Column(
      //                                       mainAxisAlignment:
      //                                           MainAxisAlignment.spaceEvenly,
      //                                       crossAxisAlignment:
      //                                           CrossAxisAlignment.start,
      //                                       children: [
      //                                         Text(
      //                                           _dbController4
      //                                               .goalCategoryName(index),
      //                                           style: TextStyle(
      //                                               fontSize:
      //                                                   AppSizes.height10 * 2.5,
      //                                               fontWeight: FontWeight.bold,
      //                                               fontFamily:
      //                                                   StringConst.nunitoSans),
      //                                         ),
      //                                         Column(
      //                                           children: [
      //                                             Text(
      //                                               _dbController4
      //                                                   .goalDescription(index),
      //                                               maxLines: 1,
      //                                               overflow:
      //                                                   TextOverflow.ellipsis,
      //                                               style: TextStyle(
      //                                                   fontSize:
      //                                                       AppSizes.height10 *
      //                                                           1.7,
      //                                                   fontWeight:
      //                                                       FontWeight.w500,
      //                                                   fontFamily: StringConst
      //                                                       .nunitoSans),
      //                                             ),
      //                                             Text(
      //                                               _dbController4
      //                                                   .successDayString(
      //                                                       index),
      //                                               maxLines: 1,
      //                                               textAlign: TextAlign.start,
      //                                               overflow:
      //                                                   TextOverflow.ellipsis,
      //                                               style: TextStyle(
      //                                                   fontSize:
      //                                                       AppSizes.height10 *
      //                                                           1.7,
      //                                                   fontWeight:
      //                                                       FontWeight.w500,
      //                                                   fontFamily: StringConst
      //                                                       .nunitoSans),
      //                                             ),
      //                                           ],
      //                                         )
      //                                       ],
      //                                     ),
      //                                   ),
      //                                   Expanded(
      //                                     child: Column(
      //                                       mainAxisAlignment:
      //                                           MainAxisAlignment.end,
      //                                       crossAxisAlignment:
      //                                           CrossAxisAlignment.end,
      //                                       children: [
      //                                         Image.asset(
      //                                           _dbController4
      //                                               .goalCategoryImageConst(
      //                                                   index),
      //                                           height: AppSizes.height10 * 11,
      //                                         )
      //                                       ],
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ),
      //                           SizedBox(height: AppSizes.height10 * 1.5),
      //                         ],
      //                       );
      //                     },
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           );
      //   }),
      // ),
    );
  }
}

//TODO:
