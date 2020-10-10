import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostAd4 extends StatefulWidget {
  const PostAd4({
    Key key,
  }) : super(key: key);

  @override
  _PostAd4State createState() => _PostAd4State();
}

class _PostAd4State extends State<PostAd4> {
  int _selected = 0;
  final String _planBg = "assets/background/bg_payment_plan.png";
  final String _planBgSelected =
      "assets/background/bg_payment_plan_selected.png";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(392, 850),
    );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Text(
                "4 Out of 4",
                style: TextStyle(
                    color: Color(0xff979797),
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
            SvgPicture.asset("assets/icons/progress_step_4.svg"),
            SizedBox(height: 8.h),
            Text(
              "Step 4",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xff4B69FF),
              ),
            ),
            Text(
              "SELECT A PAYMENT PLAN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                    textColor: (_selected == 1) ? Colors.white : null,
                    onPressed: () {
                      setState(() {
                        (_selected == 1) ? _selected = 0 : _selected = 1;
                      });
                    },
                    padding: EdgeInsets.all(0),
                    child: PaymentPlanCard(
                      bgImg: (_selected == 1) ? _planBgSelected : _planBg,
                      minVisible: false,
                      adQty: 1,
                      adRate: 100,
                    )),
                FlatButton(
                    textColor: (_selected == 2) ? Colors.white : null,
                    onPressed: () {
                      setState(() {
                        (_selected == 2) ? _selected = 0 : _selected = 2;
                      });
                    },
                    padding: EdgeInsets.all(0),
                    child: PaymentPlanCard(
                      bgImg: (_selected == 2) ? _planBgSelected : _planBg,
                      minVisible: true,
                      adQty: 10,
                      adRate: 90,
                    )),
                FlatButton(
                    textColor: (_selected == 3) ? Colors.white : null,
                    onPressed: () {
                      setState(() {
                        (_selected == 3) ? _selected = 0 : _selected = 3;
                      });
                    },
                    padding: EdgeInsets.all(0),
                    child: PaymentPlanCard(
                      bgImg: (_selected == 3) ? _planBgSelected : _planBg,
                      minVisible: true,
                      adQty: 50,
                      adRate: 80,
                    )),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "PRICE DETAILS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "(30 ADS)",
                  style: TextStyle(
                      color: Color(0xff979797),
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      vertical:
                          BorderSide(color: Colors.grey.withOpacity(0.5)))),
              // color: Colors.grey.withOpacity(0.5),
              height: 1.h,
              width: 172.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total amount",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "data",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Referral code applied",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "data",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      vertical:
                          BorderSide(color: Colors.grey.withOpacity(0.5)))),
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL PAYABLE AMOUNT",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "data",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 80.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 54.w),
                  color: Color(0XFFFC0151),
                  onPressed: () {},
                  textColor: Colors.white,
                  child: Text(
                    "PROCEED TO PAYMENT",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  shape: StadiumBorder(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentPlanCard extends StatelessWidget {
  PaymentPlanCard({this.bgImg, this.adQty, this.adRate, this.minVisible});
  final String bgImg;
  final int adQty;
  final int adRate;
  final bool minVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(this.bgImg),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          (minVisible)
              ? Text(
                  "minimum",
                  style: TextStyle(fontWeight: FontWeight.w300),
                )
              : SizedBox(
                  height: 16.h,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                adQty.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Text(
                  "Ads",
                  style: TextStyle(fontSize: 8),
                ),
              )
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹ " + adRate.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text(
                  " /Ad",
                  style: TextStyle(fontSize: 8),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "2 months",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
