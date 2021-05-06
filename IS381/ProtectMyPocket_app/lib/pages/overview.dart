import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class OverviewBody extends StatefulWidget {
  @override
  _OverviewBodyState createState() => _OverviewBodyState();
}

class _OverviewBodyState extends State<OverviewBody> {
  // DateTime selectedDate = DateTime.now();

  // _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate, // Refer step 1
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2025),
  //   );
  //   if(picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
          child: Row(
            children: [
              Expanded(
                child: Card(
                  child: InkWell(
                    onTap: null, 
                    // _selectDate(context),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text("วัน",textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: InkWell(
                    onTap: null,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text("เดือน",textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: InkWell(
                    onTap: null,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text("ปี",textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: PieChart(
            dataMap: dataMap,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 1.6,
            // colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 42,
            centerText: "22,000",
            legendOptions: LegendOptions(
              showLegendsInRow: true,
              legendPosition: LegendPosition.bottom,
              showLegends: true,
              // legendShape: _BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
            ),
          ),
        )
      ],
    );
  }
}

Map<String, double> dataMap = {
  "บ้าน": 5,
  "เดินทาง": 3,
  "อาหาร": 2,
  "บันเทิง": 2,
};
