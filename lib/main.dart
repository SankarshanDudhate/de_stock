import 'package:destock/account_setting/account_setting.dart';
import 'package:destock/account_setting/change_password.dart';
import 'package:destock/account_setting/confirm_deactivate_account.dart';
import 'package:destock/account_setting/payment_details.dart';
import 'package:destock/categories_page.dart';
import 'package:destock/dashboard/dashboard.dart';
import 'package:destock/home_buyer.dart';
import 'package:destock/post_ad_4.dart';
import 'package:destock/profile/seller_profile.dart';
import 'package:destock/recently_viewed.dart';
import 'package:destock/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'FAQ.dart';
import 'Help.dart';
import 'profile/edit_company_details.dart';
import 'profile/edit_contact_person_details.dart';
import 'profile/edit_personal_details.dart';
import 'profile/buyer_profile.dart';
import 'search/search_home.dart';

void main() {
  // ScreenUtil.init(
  //     context,
  //     designSize: Size(392, 850),
  //   );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: Size(392, 850));
    return MaterialApp(
      title: 'Material App',
      // home: EditPersonalProfile(),
      // home: EditCompanyDetails(),
      // home: ContactPersonDetails(),
      // home: ProfileSeller(
      //   profileName: 'Ajay Mittal',
      //   profileEmail: 'mittal@mittalcorp.com',
      //   profilePhone: '89898 89898',
      //   companyName: 'Mittal steel corp near indore pvt ltd',
      //   companyPan: 'GHTRS 852K',
      //   companyGst: '22 AAAAA 000AA 1Z7',
      //   companyFactoryAddress:
      //       'Plot No. - 123, Sector – III, Industrial Area, Pithampur, Dist.: Dhar – 454 775, Madhya Pradesh',
      //   officeAddress:
      //       'Plot No. - 123, Sector – III, Industrial Area, Pithampur, Dist.: Dhar – 454 775, Madhya Pradesh',
      //   whatYouSell:
      //       'we sell all types of steel goods which include Steel, flat steel products, coated steel, tubes and pipes.',
      //   contactPersonName: 'Atul Mittal',
      //   contactPersonEmail: 'mittal@mittalcorp.com',
      //   contactPersonPhone: '89898 89898',
      // ),
      // home: ProfileBuyer(
      //   profileName: 'Ajay Mittal',
      //   profileEmail: 'mittal@mittalcorp.com',
      //   profilePhone: '89898 89898',
      //   companyName: 'Mittal steel corp near indore pvt ltd',
      //   companyPan: 'GHTRS 852K',
      //   companyGst: '22 AAAAA 000AA 1Z7',
      //   companyFactoryAddress:
      //       'Plot No. - 123, Sector – III, Industrial Area, Pithampur, Dist.: Dhar – 454 775, Madhya Pradesh',
      //   officeAddress:
      //       'Plot No. - 123, Sector – III, Industrial Area, Pithampur, Dist.: Dhar – 454 775, Madhya Pradesh',
      //   whatYouSell:
      //       'we sell all types of steel goods which include Steel, flat steel products, coated steel, tubes and pipes.',
      //   contactPersonName: 'Atul Mittal',
      //   contactPersonEmail: 'mittal@mittalcorp.com',
      //   contactPersonPhone: '89898 89898',
      // ),
      // home: AccountSettings(),
      // Completed with backend
      // home: ChangePassword(),
      // home: PaymentDetails(),
      home: PostAd4(),
      // home: SearchHome(),
      // home: Wishlist(),
      // home: HomeBuyer(),
      // home: Help(),
      // home: FAQ(),

      // Completed with backend
      // home: recently_viewed(),

      // Completed with backend
      // home: dashboard(),
      // home: category_page(),
    );
  }
}
