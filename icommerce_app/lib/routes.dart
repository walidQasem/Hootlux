import 'package:get/get.dart';
import 'package:widget/constant/rooteNamed.dart';
import 'package:widget/view/auth/forgetpassword/forgetpassword.dart';
import 'package:widget/view/auth/forgetpassword/verifierCodeForgetPassword.dart';
import 'package:widget/view/auth/succescodeSingup.dart';
import 'package:widget/view/auth/verifycodeSingup.dart';
import 'package:widget/view/dashboard/home1Dash.dart';
import 'package:widget/view/dashboard/homeDash.dart';
import 'package:widget/view/home/booking/Payment%20confirmation.dart';
import 'package:widget/view/home/booking/Ticket.dart';
import 'package:widget/view/home/booking/addHotel.dart';
import 'package:widget/view/home/booking/card.dart';
import 'package:widget/view/home/booking/payment.dart';
import 'package:widget/view/home/homeApp.dart';
import 'package:widget/view/home/homepage/details.dart';
import 'package:widget/view/home/homepage/gallry.dart';
import 'package:widget/view/home/homepage/search.dart';
import 'package:widget/view/home/homepage/searchPage.dart';
import 'package:widget/view/home/profile/EditeProfille.dart';
import 'package:widget/view/home/profile/Favorite.dart';
import 'package:widget/view/home/profile/setting.dart';
import 'package:widget/view/locale.dart';
import 'package:widget/view/onboarding.dart';
import 'package:widget/view/auth/singin.dart';
import 'package:widget/view/auth/singup.dart';
import 'package:widget/view/auth/forgetpassword/ResetPassword.dart';
import 'package:widget/view/auth/forgetpassword/succes.dart';
import 'package:widget/widget/dashboard/uploadHotel.dart';

import 'middleware/mymiddleware.dart';
import 'view/home/booking/booking_date.dart';

List<GetPage<dynamic>>? rootee = [
  GetPage(
      name: "/",
      page: () => const LocaleService(),
      middlewares: [Mymeddleware()]),
  GetPage(name: Approot.onboarding, page: () => const Onboarding()),
  GetPage(name: Approot.signin, page: () => const Singin()),
  GetPage(name: Approot.singup, page: () => const Singup()),
  GetPage(name: Approot.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: Approot.verifierCode, page: () => const VerifierCode()),
  GetPage(name: Approot.resetPassword, page: () => const ResetPassword()),
  GetPage(name: Approot.succes, page: () => const Succes()),
  GetPage(name: Approot.checkcodesingup, page: () => const VerfiyCodeSingup()),
  GetPage(name: Approot.succesSingup, page: () => const SuccesSingup()),
  GetPage(name: Approot.home, page: () => const HomeApp()),
  GetPage(name: Approot.editeProfile, page: () => const EditeProfile()),
  GetPage(name: Approot.favorite, page: () => const Favorite()),
  GetPage(name: Approot.searchInput, page: () => const SearchInput()),
  GetPage(name: Approot.details, page: () => const DetailsHotel()),
  GetPage(name: Approot.setting, page: () => const Setting()),
  GetPage(name: Approot.gallry, page: () => const Gallry()),
  GetPage(name: Approot.seachpage, page: () => const SearchPage()),
  GetPage(name: Approot.bookingDate, page: () => const Bookingdate()),
  GetPage(name: Approot.payment, page: () => const Payment()),
  GetPage(name: Approot.cardPayment, page: () => const CardPayment()),
  GetPage(
      name: Approot.confermationPayment,
      page: () => const PaymentConfomation()),
  GetPage(name: Approot.ticket, page: () => const Ticket()),
  GetPage(name: Approot.homeDashboard, page: () => const HomeDash()),
  GetPage(name: Approot.ajouterHotel, page: () => const UploadHotel()),
  GetPage(name: Approot.addhotel, page: ()=>AddHotel()),
  GetPage(name: Approot.home1Dash, page:()=>Home1Dash())
  // GetPage(name: "/test", page: () => const TestMap())
];
