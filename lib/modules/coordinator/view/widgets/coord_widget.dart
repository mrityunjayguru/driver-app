import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:route_roster_pro/modules/coordinator/view/widgets/route_info.dart';

import '../../../../utils/profile_info_widget.dart';

class CoordinatorWidget extends StatelessWidget {
  const CoordinatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        routeInfo(
            routeName: "12",
            label: "Coordinators",
            time: "7:30",
            date: "22 May 2025").paddingOnly(bottom:16),
        Expanded(
            child: ListView.separated(
          itemBuilder: (context, index) => profileInfo(
              header: "",
              name: 'Eliana Keller',
              role: 'Teacher',
              address: '',
              phone: '+91 98765 43210',
              hideAddress: true,
              hideLabel: true,
              img: ''),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 16,
          ),
          itemCount: 3,
        ))
      ],
    );
  }
}
