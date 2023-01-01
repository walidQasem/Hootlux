import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookingController extends GetxController {
  String? idHotel;
  String? price;
  DateTime? stratDate;
  DateTime? endDate;
  int indexEfant = 0;

  int indexdult = 1;
  double some = 0;
  int nbr = 1;
  onchangedate(PickerDateRange d) {
    stratDate = d.startDate;
    endDate = d.endDate;
    if (stratDate != null && endDate != null) {
      nbr = endDate!.day - stratDate!.day;
    } else {
      nbr = 1;
    }

    update();
  }

  getInformation() {
    idHotel = Get.arguments['idHotel'];
    price = Get.arguments['price'];
    some = double.parse(price.toString());
  }

  oncready() {
    stratDate ??= DateTime.utc(1999, 00, 0);
    endDate ??= DateTime.utc(1999, 00, 0);
  }

  changeDropDownEnfant(int e) {
    indexEfant = e;
    update();
  }

  changeDropDowndelt(int e) {
    indexdult = e;
    update();
  }

  calculerSome() {
    double ef = indexEfant * double.parse(price.toString());
    double ed = indexdult * double.parse(price.toString());
    some = ef + ed;
    some = some * nbr;
    update();
  }

  @override
  void onInit() {
    oncready();
    getInformation();
    super.onInit();
  }
}
