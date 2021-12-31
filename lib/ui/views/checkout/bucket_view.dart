import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/controller/signin_controller.dart';
import 'package:bumaco_aios/ui/views/address/addresss_list_view.dart';
import 'package:bumaco_aios/ui/views/checkout/bucket_item.dart';
import 'package:bumaco_aios/ui/views/coupon/coupon_list_view.dart';
import 'package:bumaco_aios/ui/views/home/empty_failure_no_internet_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class BucketView extends StatelessWidget {
  BucketView({Key? key}) : super(key: key);

  final _aController = AddressController.to;
  final pController = ProductController.to;
  final couponController = CouponController.to;
  final bController = BucketController.to;
  final lController = LocaleController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHome(
        title: 'cart'.tr + ' - ' + 'checkout'.tr,
        actionList: [
          IconButton(
            icon: Icon(Icons.delete),
            tooltip: 'Delete All Cart Items',
            onPressed: () {
              bController.removeAllBucket(false);
            },
          ),
          IconButton(
            icon: Icon(Icons.location_city_outlined),
            tooltip: 'Address List',
            onPressed: () {
              Get.to(() => AddressAddView(),
                  arguments: {'get_is_bucket': true});
            },
          ),
        ],
      ),
      body: Obx(
        () => bController.bucketList.length == 0
            ? EmptyFailureNoInternetView(
                image: emptyLottie,
                title: 'Content unavailable',
                description: 'Content not found',
                buttonText: "",
                onPressed: () {},
              )
            : ConstrainedBox(
                constraints: BoxConstraints(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: VStack(
                        [
                          InkWell(
                            onTap: () {
                              // showBottomSheet(
                              //   context: context,
                              //   builder: (context) =>
                              //       // AddressView()
                              //       Container(
                              //     color: Colors.red,
                              //   ),
                              // );
                              Get.to(() => AddressAddView(),
                                  arguments: {'get_is_bucket': true});
                            },
                            child: HStack(
                              [
                                ('address'.tr + ': ')
                                    .text
                                    .black
                                    .lg
                                    .make()
                                    .paddingOnly(left: 8),
                                Expanded(
                                  child: '${_aController.selectedAddress.value}'
                                      .text
                                      .xs
                                      .gray500
                                      .semiBold
                                      .ellipsis
                                      .maxLines(3)
                                      .make()
                                      .p8(),
                                ),
                                Icon(
                                  Icons.edit,
                                  color: Vx.coolGray500,
                                ).p8(),
                              ],
                            ).box.color(Vx.pink100).make(),
                          ),
                        ],
                        alignment: MainAxisAlignment.start,
                        crossAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    VxDivider(),
                    Row(children: [
                      Icon(Icons.local_offer_outlined)
                          .paddingSymmetric(horizontal: 20, vertical: 8),
                      Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            '${couponController.couponTitle.value}'
                                .text
                                .sm
                                .semiBold
                                .make(),
                            couponController.couponSubtitle.value == ''
                                ? SizedBox()
                                : couponController
                                    .couponSubtitle.value.text.xs.green500
                                    .make(),
                          ],
                        ).paddingSymmetric(horizontal: 20).expand(),
                      ),
                      couponController.couponApplied.isTrue
                          ? Icon(
                              Icons.close_rounded,
                              color: Vx.coolGray500,
                            )
                              .paddingSymmetric(horizontal: 20, vertical: 8)
                              .onTap(() {
                              couponController.clearPromocode();
                            })
                          : Icon(
                              Icons.arrow_forward_ios,
                              color: Vx.coolGray500,
                            ).paddingSymmetric(horizontal: 10, vertical: 8),
                    ]).paddingSymmetric(vertical: 5).onTap(() {
                      Get.to(() => CouponListView());
                    }),
                    VxDivider(),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          indent: 70,
                          endIndent: 20,
                        ),
                        itemCount: bController.bucketList.length,
                        padding: EdgeInsets.all(4),
                        itemBuilder: (context, index) {
                          BucketEntity item = bController.bucketList[index];
                          return BucketItem(item: item);
                        },
                      ),
                    ),
                    VxDivider(),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      alignment: Alignment.bottomCenter,
                      child: VStack(
                        [
                          Visibility(
                            visible: bController.isShowDetails.isTrue,
                            child: VStack(
                              [
                                HStack(
                                  [
                                    Expanded(
                                      child: ('total'.tr + ': ')
                                          .text
                                          .base
                                          .make()
                                          .p8(),
                                    ),
                                    '${lController.selectedSymbol}${bController.totalAmount}'
                                        .text
                                        .base
                                        .make()
                                        .p8(),
                                  ],
                                ),
                                HStack(
                                  [
                                    Expanded(
                                      child:
                                          ('tax'.tr + ': ').text.lg.make().p8(),
                                    ),
                                    '${lController.selectedSymbol}${bController.taxAmount}'
                                        .text
                                        .base
                                        .make()
                                        .p8(),
                                  ],
                                ),
                                HStack(
                                  [
                                    Expanded(
                                      child: Obx(
                                        () => couponController
                                                    .couponValue.value ==
                                                0
                                            ? ('discount'.tr + ':')
                                                .text
                                                .base
                                                .make()
                                                .p8()
                                            : ('discount'.tr +
                                                    ' (${couponController.couponValue} ${couponController.couponType}): ')
                                                .text
                                                .base
                                                .make()
                                                .p8(),
                                      ),
                                    ),
                                    '${lController.selectedSymbol}${bController.discountAmt}'
                                        .text
                                        .base
                                        .make()
                                        .p8(),
                                  ],
                                ),
                                HStack(
                                  [
                                    Expanded(
                                      child: ('shipping'.tr + ': ')
                                          .text
                                          .base
                                          .make()
                                          .p8(),
                                    ),
                                    '${lController.selectedSymbol}${bController.shippingAmt.round()}'
                                        .text
                                        .base
                                        .make()
                                        .p8(),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                          VStack(
                            [
                              HStack(
                                [
                                  Obx(
                                    () => bController.isShowDetails.isTrue
                                        ? Icon(Icons.arrow_drop_down_outlined)
                                        : Icon(Icons.arrow_drop_up_outlined),
                                  ),
                                  Icon(Icons.info_outline),
                                  Expanded(
                                    child: ('payable'.tr + ': ')
                                        .text
                                        .sm
                                        .semiBold
                                        .color(kPrimaryColor)
                                        .make()
                                        .p12(),
                                  ),
                                  // '\$${bController.grandTotal.value}'
                                  // .text.lg
                                  //     .make()
                                  //     .p12(),
                                  '${lController.selectedSymbol}${bController.grandTotal.value.toStringAsFixed(2)}'
                                      // .numCurrencyWithLocale(locale: 'en_UK')
                                      // .numCurrencyWithLocale(locale: 'ar_AE')
                                      .text
                                      .xl
                                      .bold
                                      .color(kPrimaryColor)
                                      .make()
                                      .p8(),
                                ],
                              ).onTap(() {
                                bController.isShowDetails.toggle();
                              }),
                              MaterialButton(
                                height: 50.0,
                                onPressed: () {
                                  !getStorageBoolValue(BOX_IS_LOGGEDIN)
                                      ? SigninController.to
                                          .loginPopupBottomSheet(context)
                                      : _aController.addressList.length == 0
                                          ? Get.to(() => AddressAddView(),
                                              arguments: {
                                                  'get_is_bucket': true
                                                })
                                          : bController.bookProductorderCall(
                                              '0', '');
                                },
                                // color: Color(0xff374ABE),
                                color: kPrimaryColor,
                                minWidth: double.maxFinite,
                                child: 'continue'.tr.text.white.xl.make(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
