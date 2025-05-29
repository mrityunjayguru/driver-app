import 'package:get/get.dart';
import 'package:route_roster_pro/modules/coordinator/view/widgets/coord_widget.dart';
import 'package:route_roster_pro/modules/coordinator/view/widgets/student_widget.dart';
import 'package:route_roster_pro/modules/guardian/model/stop_model.dart';

import '../../../utils/common_import.dart';
import '../../guardian/model/bus_status_model.dart';
import '../view/widgets/stop_widget.dart';

class CoordinatorBusStatusController extends GetxController{
  RxInt tab = 0.obs;
  RxBool openDropdown = false.obs;
  final List<StudentBusStatus> studentBusStatusList = [
    StudentBusStatus(
      name: "Kannu Chaudhary",
      admissionNo: "6666",
      grade: "IV Mercury",
      routeNo: 12,
      pickupPoint: "Main Market",
      busStatus: "At School",
      pickupTime: "07:00",
      dropTime: "02:45",
      gender: true
    ),
    StudentBusStatus(
      name: "Aaru Gautam",
      admissionNo: "8888",
      grade: "Mont Venus",
      routeNo: 24,
      pickupPoint: "Gaur City 1 Gate",
      busStatus: "In Transit",
      pickupTime: "09:30",
      dropTime: "01:30",
      gender: false
    ),
  ];



  void switchTab(int tabNo){
    tab.value = tabNo;
  }

  List<Widget> screens = [
    const StopWidget(),
    StudentWidget(),
    const CoordinatorWidget()
  ];



}