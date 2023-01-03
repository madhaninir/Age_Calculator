import 'package:flutter/material.dart';


void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Age_Calculator(),
    ),
  );
}

class Age_Calculator extends StatefulWidget {
  const Age_Calculator({Key? key}) : super(key: key);

  @override
  State<Age_Calculator> createState() => _Age_CalculatorState();
}

class _Age_CalculatorState extends State<Age_Calculator> {
  DateTime data = DateTime.now();

  String DD = "00";
  String MM = "00";
  String YY = "00";

  String PDD = "00";
  String PMM = "00";
  String PYY = "00";

  String NMM = "00";
  String NDD = "00";

  TextEditingController Datecontroller = TextEditingController();
  TextEditingController Monthcontroller = TextEditingController();
  TextEditingController Yearcontroller = TextEditingController();

  List<String> month = [
    "Jan",
    "Feb",
    "May",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff203A43),
        title: const Text(
          "Age Calculator",
          style: TextStyle(
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Text(
                      " Today's Data",
                      style:  TextStyle(
                        fontSize: 16,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: const Color(0xff203A43)),
                      ),
                      child: Text(
                        "${data.day} ${month[data.month - 1]}, ${data.year}",
                        style: const TextStyle(
                          color: const Color(0xff1C003E),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Text(
                      " Data Of Birth",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 120,
                          child: TextField(
                            controller: Datecontroller,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "DD",
                            ),
                            onChanged: (value){
                              DD = value;
                              print(DD);
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 120,
                          child: TextField(
                            controller: Monthcontroller,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "MM",
                            ),
                            onChanged: (value){
                              MM = value;
                              print(MM);
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 120,
                          child: TextField(
                            controller: Yearcontroller,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "YYYY",
                            ),
                            onChanged: (value){
                              YY = value;
                              print(YY);
                            },
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        setState(() {
                          Datecontroller.clear();
                          Monthcontroller.clear();
                          Yearcontroller.clear();

                          DD = "00";
                          MM = "00";
                          YY = "00";

                          PDD = "00";
                          PMM = "00";
                          PYY = "00";

                          NDD = "00";
                          NMM = "00";
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff13547A),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Clear",
                          style:TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: (){
                        setState((){
                          PYY = (data.year - int.parse(YY)).toString();
                          PMM = (data.month >= int.parse(MM))
                              ?(data.month - int.parse(MM)).toString()
                              :(int.parse(MM) - data.month + 1).toString();
                          PDD = (data.month % 2 == 0)
                              ?(data.day >= int.parse(DD))
                              ?(data.day - int.parse(DD)).toString()
                              :(int.parse(DD) - data.day).toString()
                              :(int.parse(DD) - data.day).toString();


                          NMM = (data.month >= int.parse(MM))
                              ?(int.parse(MM)+12 - data.month).toString()
                              :(int.parse(MM) - data.month).toString();
                          NDD = (data.month % 2 == 0)
                              ?(data.day >= int.parse(DD))
                              ?(int.parse(DD)+31 - data.day).toString()
                              :(int.parse(DD) - data.day).toString()
                              :
                          (data.day >= int.parse(DD))
                              ?(data.day+30 - int.parse(DD)).toString()
                              :(int.parse(DD) - data.day).toString();
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff203A43),
                          ),
                          color: const Color(0xff13547A),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Calculate",
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    " Present Age",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff13547A),
                          Color(0XFF203A43),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$PYY",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              "Year",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$PMM",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              "MM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$PDD",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              "DD",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const Text(
                    " Next Birthday",
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xfF6BBED9),
                          Color(0XFF006ACB),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "$NMM",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              "MM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$NDD",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              "DD",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
