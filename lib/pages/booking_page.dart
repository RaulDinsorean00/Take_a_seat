// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_takeaseat/main.dart';
import 'package:counter_button/counter_button.dart';
import 'dart:math';

class BookingPage extends StatefulWidget {
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int page = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      if (page == 0) ...{
                        Container(
                          // ignore: prefer_const_constructors
                          child: Destination(),
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(63),
                            ),
                            color: Color.fromARGB(255, 194, 233, 226),
                          ),
                          height: 570,
                          width: 270,
                        ),
                      } else if (page == 1) ...{
                        Container(
                          child: AvailableTrips(),
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(63),
                            ),
                            color: Color.fromARGB(255, 194, 233, 226),
                          ),
                          height: 570,
                          width: 270,
                        ),
                      } else if (page == 2) ...{
                        Container(
                          child: PersonalData(),
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(63),
                            ),
                            color: Color.fromARGB(255, 194, 233, 226),
                          ),
                          height: 570,
                          width: 270,
                        ),
                      } else if (page == 3) ...{
                        Container(
                          child: Pay(),
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(63),
                            ),
                            color: Color.fromARGB(255, 194, 233, 226),
                          ),
                          height: 570,
                          width: 270,
                        ),
                      },
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (page != 0) ...{
                        MaterialButton(
                          //NEXT
                          height: 50.0,
                          minWidth: 50.0,
                          child: const Icon(Icons.arrow_back_ios_new_rounded,
                              color: Color.fromARGB(255, 255, 255, 255)),

                          shape: const CircleBorder(),
                          onPressed: () {
                            setState(() {
                              page--;
                            });
                          },
                          color: Color.fromARGB(255, 145, 192, 183),
                        ),
                      },
                      if (page != 3) ...{
                        Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                        MaterialButton(
                          //BACK
                          height: 50.0,
                          minWidth: 50.0,
                          child: const Icon(Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 255, 255, 255)),

                          shape: const CircleBorder(),
                          onPressed: () {
                            setState(() {
                              page++;
                            });
                          },
                          color: Color.fromARGB(255, 145, 192, 183),
                        ),
                      },
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (page == 3) ...{
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 16),
                      child: MaterialButton(
                        height: 60.0,
                        minWidth: 100.0,
                        child: const Text(
                          'BUY',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        onPressed: () {
                          // setState(() {
                          //   //WHEN PRESSING BUY
                          // });
                        },
                        color: Color.fromARGB(255, 145, 192, 183),
                      ),
                    ),
                  }
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 231, 253, 247),
      );
}

class Destination extends StatefulWidget {
  const Destination({Key? key}) : super(key: key);

  @override
  State<Destination> createState() => _DestinationState();
}

String dropdownValue = ' Timisoara';
String dropdownValue2 = ' Hunedoara';
DateTime date = DateTime(2022, 6, 18);
int _counterValue = 0;
int _counterValue2 = 0;

class _DestinationState extends State<Destination> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Text(
                  'Destination',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Departure',
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            Container(
                              height: 50,
                              width: 150,
                              color: Colors.white,
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                isExpanded: true,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.white,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  ' Timisoara',
                                  ' Hunedoara',
                                  ' Cluj'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            Text(
                              'Arrival',
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            Container(
                              height: 50,
                              width: 150,
                              color: Colors.white,
                              child: DropdownButton<String>(
                                value: dropdownValue2,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                isExpanded: true,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.white,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue2 = newValue!;
                                  });
                                },
                                items: <String>[
                                  ' Hunedoara',
                                  ' Timisoara',
                                  ' Cluj'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 28,
                              width: 120,
                              color: Colors.white,
                              child: (Text(
                                '${date.day}/${date.month}/${date.year}',
                                style: TextStyle(fontSize: 20),
                              )),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 145, 192, 183),
                              ),
                              child: Icon(Icons.arrow_drop_down,
                                  color: Colors.white),
                              onPressed: () async {
                                DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2050),
                                );
                                if (newDate == null) return;
                                setState(() => date = newDate);
                              },
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Adults     ',
                                style: TextStyle(fontSize: 20),
                              ),
                              CounterButton(
                                loading: false,
                                onChange: (int val) {
                                  setState(() {
                                    _counterValue = (val <= 0) ? 0 : val;
                                  });
                                },
                                count: _counterValue,
                                countColor: Colors.white,
                                buttonColor: Colors.black,
                                progressColor: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Children  ',
                                style: TextStyle(fontSize: 20),
                              ),
                              CounterButton(
                                loading: false,
                                onChange: (int val) {
                                  setState(() {
                                    _counterValue2 = (val <= 0) ? 0 : val;
                                  });
                                },
                                count: _counterValue2,
                                countColor: Colors.white,
                                buttonColor: Colors.black,
                                progressColor: Colors.black,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AvailableTrips extends StatefulWidget {
  const AvailableTrips({Key? key}) : super(key: key);

  @override
  State<AvailableTrips> createState() => _AvailableTripsState();
}

String dropdownValue3 = ' FastBus         19:30 - 22:30';
String dropdownValue4 = ' SlowBus         06:00 - 12:00';
bool _checked = false;
DateTime date2 = DateTime(2022, 6, 18);

class _AvailableTripsState extends State<AvailableTrips> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            'Available trips',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select the vehicle',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Container(
                  height: 50,
                  width: 200,
                  color: Colors.white,
                  child: DropdownButton<String>(
                    value: dropdownValue3,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    isExpanded: true,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue3 = newValue!;
                      });
                    },
                    items: <String>[
                      ' FastBus         19:30 - 22:30',
                      ' SlowBus         06:00 - 12:00',
                      ' AvgBus          13:30 - 18:00',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.code_outlined,
                      size: 52,
                      color: Colors.white,
                    ),
                    Checkbox(
                      value: _checked,
                      onChanged: (bool? value) {
                        print(value);
                        setState(() {
                          _checked = value!;
                        });
                      },
                      activeColor: Colors.white,
                      checkColor: Colors.red,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        if (_checked) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Returning date',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 28,
                      width: 120,
                      color: Colors.white,
                      child: (Text(
                        '${date2.day}/${date2.month}/${date2.year}',
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 145, 192, 183),
                      ),
                      child: Icon(Icons.arrow_drop_down, color: Colors.white),
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date2,
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2050),
                        );
                        if (newDate == null) return;
                        setState(() => date2 = newDate);
                      },
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Select the vehicle',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    color: Colors.white,
                    child: DropdownButton<String>(
                      value: dropdownValue4,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      isExpanded: true,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue4 = newValue!;
                        });
                      },
                      items: <String>[
                        ' SlowBus         06:00 - 12:00',
                        ' FastBus         19:30 - 22:30',
                        ' AvgBus          13:30 - 18:00',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]
      ],
    );
  }
}

class PersonalData extends StatefulWidget {
  const PersonalData({Key? key}) : super(key: key);

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

var nameController = TextEditingController();
var emailController = TextEditingController();
var numberController = TextEditingController();

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
          child: Text(
            'Personal Data',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                ),
                controller: nameController,
              ),
            ),
            Text(
              'Email',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                ),
                controller: emailController,
              ),
            ),
            Text(
              'Phone number',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
              controller: numberController,
            ),
          ],
        ),
      ],
    );
  }
}

class Pay extends StatefulWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              Text(
                'Pay',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'You need to pay',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(63),
                      ),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    height: 30,
                    width: 90,
                    child: Center(
                        child: Text('${random.nextInt(99).toString()} EUR')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
