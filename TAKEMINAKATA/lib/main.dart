import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  late TooltipBehavior _tooltipBehavior;
  int type = 0;
  String title = "Home";

  final List<ChartData> chartData = [
    ChartData(2010, 35),
    ChartData(2011, 13),
    ChartData(2012, 34),
    ChartData(2013, 27),
    ChartData(2014, 40),
    ChartData(2015, 35),
    ChartData(2016, 13),
    ChartData(2017, 34),
    ChartData(2018, 27),
    ChartData(2019, 40),
    ChartData(2020, 35),
    ChartData(2021, 13),
    ChartData(2022, 34),
    ChartData(2023, 27),
    ChartData(2024, 40),
    ChartData(2025, 35),
    ChartData(2026, 13),
    ChartData(2027, 34),
    ChartData(2028, 27),
    ChartData(2029, 40),
  ];

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  //functions
  AppBar appBarFun() {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset("assets/TAKEMINAKATA-inside.png"),
        ),
      ],
    );
  }

  Widget cardFun(Color color) {
    return Card(
      color: Colors.white, //Color(0xFFE8F4F4),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2.0,
          color: color, //Colors.white70,
        ),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Sending Message"),
          ));
        },
        child: Container(
          color: Colors.white70,
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.signal_cellular_alt_outlined,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
                title: const Text(
                  'nameOfDevice',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: const Text(
                  ' chipset: ESP-32\n sensors: all\n next peak: 10h\n current value: 10 mg',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: const Text(
                  'status: fine',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 2.0,
                    color: Colors.white70,
                  ),
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              /*Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check_outlined,
                    color: Colors.green,
                    size: 48,
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  Widget cardHorizontalFun(String message) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: Container(
          height: double.infinity,
          width: 256.0,
          decoration: BoxDecoration(
            color: const Color(0xFFE8F4F4),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeHorizontalFun() {
    return Center(
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8.0),
        children: [
          cardHorizontalFun("Overall status"),
          cardHorizontalFun("CO2 concentration"),
          cardHorizontalFun("Temperature"),
          cardHorizontalFun("Humidity"),
          //cardHorizontalFun(""),
          //cardHorizontalFun(""),
        ],
      ),
    );
  }

  Widget homeFun() {
    return Center(
      child: ListView(
        //scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8.0),
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Selected environment",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 192,
            child: homeHorizontalFun(),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              "List of devices",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          cardFun(Colors.black),
          cardFun(Colors.white70),
          cardFun(Colors.white70),
          cardFun(Colors.white70),
          cardFun(Colors.white70),
          cardFun(Colors.white70),
        ],
      ),
    );
  }

  Widget graphFun() {
    return Card(
      color: const Color(0xFFE8F4F4),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 2.0,
          color: Colors.white70,
        ),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: SfCartesianChart(
        tooltipBehavior: _tooltipBehavior,
        backgroundColor: Colors.white70,
        series: <ChartSeries>[
          FastLineSeries<ChartData, int>(
              enableTooltip: true,
              dataSource: chartData,
              // Dash values for spline
              dashArray: const <double>[5, 5],
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ],
      ),
    );
  }

  Widget graphPageFun() {
    return Center(
      child: ListView(
        children: [
          cardFun(Colors.white70),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Day",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          graphFun(),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Week",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          graphFun(),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Month",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          graphFun(),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Year",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          graphFun(),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "All",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          graphFun(),
        ],
      ),
    );
  }

  Widget displayFun() {
    switch (type) {
      case 0:
        return homeFun();
      case 1:
        return graphPageFun();
      default:
        return const Text(
          "Oops... something went wrong! Try again later.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //drawer for MyHomePage, contains Scaffold
      drawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_outlined,
                color: Colors.black,
              ),
            ),
            title: TextButton(
              onPressed: () {},
              child: const Text(
                "Add new device",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          body: Center(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: const EdgeInsets.all(8.0),
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      type = 0;
                      title = "Home";
                    });
                    Navigator.pop(context);
                  },
                  title: const Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 2.0,
                      color: Colors.white70,
                    ),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      type = 1;
                      title = "nameOfDevice graph";
                    });
                    Navigator.pop(context);
                  },
                  title: const Text(
                    "nameOfDevice graph",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 2.0,
                      color: Colors.white70,
                    ),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Colors.black,
                    weight: 4.0,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Go to settings",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      //appBar for MyHomePage
      appBar: appBarFun(),
      body: displayFun(),
    );
  }
}
