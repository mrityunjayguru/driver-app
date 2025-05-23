import 'package:flutter/cupertino.dart';
import 'package:route_roster_pro/modules/coordinator/view/route_history_info_view.dart';
import 'package:route_roster_pro/modules/coordinator/view/widgets/timeline.dart';

class StopWidget extends StatelessWidget{
  const StopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HistoryTimeline();
  }

}