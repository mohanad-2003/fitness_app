import 'package:fitness_app/model/round_weekly_modle.dart';
import 'package:get/get.dart';

class WeekyController extends GetxController{
   var roundweekly1 = <RoundWeeklyModle>[
    RoundWeeklyModle(name: "Endurance Ride", time: "10:30", type: "Moderate"),
    RoundWeeklyModle(name: "Hill Climpes", time: "05:00", type: "Hight"),
    RoundWeeklyModle(name: "Interval Sprint", time: "07:00", type: "Hight"),
  ];
  var roundweekly2 = <RoundWeeklyModle>[
    RoundWeeklyModle(name: "Tempo Ride", time: "8:00", type: "Moderate"),
    RoundWeeklyModle(name: "cadeness Drill", time: "06:00", type: "Moderate"),
  ];
}