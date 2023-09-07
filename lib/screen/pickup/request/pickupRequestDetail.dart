import 'dart:io';

import 'package:delivery_app/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/getController.dart';
import '../../../utils/theme.dart';
import '../../login.dart';

class PickupRequestDetails extends StatefulWidget {
  const PickupRequestDetails({super.key});

  @override
  State<PickupRequestDetails> createState() => _PickupRequestDetailsState();
}

class _PickupRequestDetailsState extends State<PickupRequestDetails> {
  var orders = Get.find<OrderController>().orders;
  TextEditingController countController = TextEditingController();
  FocusNode countFocusNode = FocusNode();
  List<String> items = ["30", "50", "100", "All"];
  String? value;
  var getResult = 'QR Code Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DelimenPannel",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Constants.blue,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
            )),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return Container(
                        // margin: EdgeInsets.only(bottom: 100),
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          titleTextStyle: const TextStyle(
                              fontSize: 14, color: Colors.black),
                          content: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.17,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Text(
                                    "You have 10 notifications",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person_add,
                                      color: Constants.realBlue,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Text(
                                        "5 new members joined today",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Center(
                                    child: Text(
                                  'View all',
                                  style: TextStyle(fontSize: 12),
                                )),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  },
                );
              },
              icon: Icon(
                Icons.notifications_outlined,
              )),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        titleTextStyle:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        content: Container(
                          color: Constants.blue,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                //  margin: EdgeInsets.symmetric(horizontal: 5),
                                padding: EdgeInsets.only(right: 10),
                                child: CircleAvatar(
                                  radius: 37,
                                  backgroundColor: Colors.white24,
                                  child: CircleAvatar(
                                    maxRadius: 35,
                                    backgroundColor: Colors.black45,
                                    child: Icon(
                                      Icons.person,
                                      size: 55,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  "aung naing",
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white70),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  "Delivery Men",
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white70),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Center(
                                  child: Text(
                                'Delivery Management System',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white70),
                              )),
                            ],
                          ),
                        ),
                        actions: [
                          Container(
                            // color: Colors.black12,
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                  // style: TextButton.styleFrom(
                                  //     padding: const EdgeInsets.only(left: 70)),
                                  onPressed: () {
                                    Get.to(ProfileScreen());
                                  },
                                  child: Center(
                                    child: const Text(
                                      "Profile",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12),
                                    ),
                                  ),
                                ),
                                OutlinedButton(
                                  // style: TextButton.styleFrom(
                                  //     padding: const EdgeInsets.only(left: 30)),
                                  onPressed: () {
                                    Get.to(() => LoginScreen());
                                    // Get.back();
                                  },
                                  child: Center(
                                    child: const Text("Sign out",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
                },
              );
            },
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                maxRadius: 12,
                backgroundColor: Colors.black45,
                child: Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.white54,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.all(16),
        child: Column(children: [
          Row(
            children: [
              Text(
                "Delimen",
                style: TextStyle(
                  fontSize: 20,
                  // color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Got Parcel List",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            // width: MediaQuery.of(context).size.width * 0.95,
            height: 30,
            decoration: BoxDecoration(color: Constants.gray),
            child: Row(children: [
              Icon(Icons.dashboard),
              Text(
                ' Home > ',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                ' Delimen >',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                ' Got Parcel List ',
                style: TextStyle(fontSize: 12),
              ),
            ]),
          ),
          SizedBox(
            height: 16,
          ),
          Card(
            child: Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              //  margin: EdgeInsets.only(bottom: 100),
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return Container(
                                  // margin: EdgeInsets.only(bottom: 100),
                                  height:
                                      MediaQuery.of(context).size.height * 0.72,
                                  child: AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    titleTextStyle: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    content: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20),
                                      child: Column(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Text(
                                                  "Pickup Parcel",
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () => Get.back(),
                                                child: Icon(
                                                  Icons.cancel,
                                                  color: Colors.grey,
                                                ),
                                              )
                                            ],
                                          ),
                                          Divider(),
                                          Obx((() => OrderController
                                                      .selectedImagePath
                                                      .value ==
                                                  ''
                                              ? Text(
                                                  'Select image camera/gallery',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Constants
                                                          .tDefaultSize))
                                              : Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2,
                                                  child: Column(
                                                    children: [
                                                      Image.file(File(
                                                        OrderController
                                                            .selectedImagePath
                                                            .value,
                                                      )),
                                                      // Text(
                                                      //   'Parcel',
                                                      //   style: TextStyle(
                                                      //     fontSize: Constants
                                                      //         .tDefaultSize,
                                                      //   ),
                                                      // )
                                                    ],
                                                  ),
                                                ))),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      OrderController.getImage(
                                                          ImageSource.camera);
                                                    },
                                                    child: Image.asset(
                                                      'assets/icons/camera.png',
                                                      width: 100,
                                                      height: 100,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Take Photo',
                                                    style: TextStyle(
                                                        fontSize: Constants
                                                            .tDefaultSize,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              // Column(
                                              //   children: [
                                              //     InkWell(
                                              //       onTap: () {
                                              //         OrderController.getImage(
                                              //             ImageSource.gallery);
                                              //       },
                                              //       child: Image.asset(
                                              //         'assets/icons/gallery.png',
                                              //         width: 100,
                                              //         height: 100,
                                              //       ),
                                              //     ),
                                              //     Text(
                                              //       'Gallery',
                                              //       style: TextStyle(
                                              //           fontSize: Constants
                                              //               .tDefaultSize,
                                              //           fontWeight:
                                              //               FontWeight.bold),
                                              //     ),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15,
                                                    right: 15,
                                                    bottom: 10),
                                                child: Text(
                                                  'Scan',
                                                  style: TextStyle(
                                                      fontSize: Constants
                                                          .tDefaultSize,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  scanQRCode();
                                                },
                                                child: Image.asset(
                                                  'assets/icons/scanner.png',
                                                  width: 90,
                                                  height: 90,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                getResult,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize:
                                                      Constants.tDefaultSize,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                            },
                          );
                        }),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                          width: MediaQuery.of(context).size.width * 0.33,
                          decoration: BoxDecoration(
                              color: Constants.realBlue,
                              borderRadius: BorderRadius.circular(3)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.telegram,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Get Parcel',
                                style: TextStyle(
                                    fontSize: Constants.tDefaultSize,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.remove,
                            color: Colors.grey[500],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.cancel,
                              color: Colors.grey[500],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Request Date :: 21-08-2023 01:22 pm ',
                      style: TextStyle(
                          fontSize: Constants.tDefaultSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Client Name :: Client Name',
                      style: TextStyle(
                          fontSize: Constants.tDefaultSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Show',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.27,
                      height: 35,
                      margin: EdgeInsets.all(16),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: value,
                          isExpanded: true,
                          items: items.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.value = value),
                        ),
                      )

                      // value: selecttownshipDetailPick,

                      ,
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.height * 0.12,
                    //   height: 35,
                    //   child: TextFormField(
                    //     controller: countController,
                    //     focusNode: countFocusNode,
                    //     decoration: InputDecoration(
                    //       // labelText: "user name",
                    //       labelStyle: TextStyle(fontSize: 12),
                    //       //  suffixIcon: Icon(Icons.person),
                    //       fillColor: Colors.white,
                    //       focusedBorder: OutlineInputBorder(
                    //         //  borderRadius: BorderRadius.circular(10.0),
                    //         borderSide: BorderSide(
                    //           color: Colors.black12,
                    //         ),
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         // borderRadius: BorderRadius.circular(10.0),
                    //         borderSide: BorderSide(
                    //           color: Colors.grey,
                    //           // width: 2.0,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'entries',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Search :',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.2,
                      height: 35,
                      child: TextFormField(
                        controller: countController,
                        focusNode: countFocusNode,
                        decoration: InputDecoration(
                          // labelText: "user name",
                          labelStyle: TextStyle(fontSize: 12),
                          //  suffixIcon: Icon(Icons.person),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            //  borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black12,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              //  width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.31,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  // color: Constants.gray,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      DataTable(
                        headingRowColor:
                            MaterialStateProperty.all(Constants.gray),
                        dataRowColor: MaterialStateProperty.all(Colors.white),
                        decoration: BoxDecoration(
                            //color: Colors.grey
                            ),
                        horizontalMargin: 8,
                        columnSpacing: 18,
                        border: TableBorder.all(color: Colors.black12),
                        columns: [
                          DataColumn(
                              label: Text(
                            "#",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Constants.tDefaultSize,
                            ),
                          )),
                          DataColumn(
                              label: Text(
                            "Track Code",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Constants.tDefaultSize,
                            ),
                          )),
                          DataColumn(
                              label: Text(
                            "Receiver Name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Constants.tDefaultSize,
                            ),
                          )),
                          DataColumn(
                              label: Text(
                            "Parcel Info",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Constants.tDefaultSize,
                            ),
                          )),
                          DataColumn(
                              label: Text(
                            "Photo",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Constants.tDefaultSize,
                            ),
                          )),
                          DataColumn(
                              label: Text(
                            "Status",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Constants.tDefaultSize,
                            ),
                          )),
                          DataColumn(
                              label: Text(
                            "Action",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Constants.tDefaultSize,
                            ),
                          )),
                        ],
                        rows: orders!.map((order) {
                          return DataRow(cells: [
                            DataCell(Container(
                              padding: EdgeInsets.only(left: 5),
                              //  color: Colors.white,
                              child: Text(
                                '1',
                                style:
                                    TextStyle(fontSize: Constants.tSmallSize),
                              ),
                            )),
                            DataCell(Text(
                              '11-230020',
                              style: TextStyle(fontSize: Constants.tSmallSize),
                            )),
                            DataCell(Text(
                              'rec Name',
                              style: TextStyle(fontSize: Constants.tSmallSize),
                            )),
                            DataCell(Text(
                              'testing',
                              style: TextStyle(fontSize: Constants.tSmallSize),
                            )),
                            DataCell(Text(
                              '',
                              style: TextStyle(fontSize: Constants.tSmallSize),
                            )),
                            DataCell(Text(
                              'Picked Up',
                              style: TextStyle(fontSize: Constants.tSmallSize),
                            )),
                            DataCell(
                                Center(
                                  child: Icon(
                                    Icons.cancel,
                                    color: Constants.realRed,
                                  ),
                                ), onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return Container(
                                      // margin: EdgeInsets.only(bottom: 100),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      child: AlertDialog(
                                        backgroundColor: Constants.realRed,
                                        contentPadding: EdgeInsets.zero,
                                        titleTextStyle: const TextStyle(
                                            fontSize: 14, color: Colors.black),
                                        content: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.17,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Text(
                                                  "Delete Confirmation",
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Divider(),
                                              Row(
                                                children: [
                                                  // Icon(
                                                  //   Icons.person_add,
                                                  //   color: Constants.realBlue,
                                                  // ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15,
                                                            right: 15),
                                                    child: Text(
                                                      "Are you sure want to delete?",
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(),

                                              // Center(
                                              //     child: Text(
                                              //   'View all',
                                              //   style: TextStyle(fontSize: 12),
                                              // )),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              OutlinedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: BorderSide(
                                                        //  width: 5.0,
                                                        color: Colors.white),
                                                  ),
                                                  child: Text(
                                                    'Close',
                                                    style: TextStyle(
                                                        fontSize: Constants
                                                            .tSmallSize,
                                                        color: Colors.white),
                                                  )),
                                              OutlinedButton(
                                                onPressed: () {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          'Delete Successfully.',
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.green,
                                                      fontSize: 14);
                                                  Get.back();
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  side: BorderSide(
                                                      //  width: 5.0,
                                                      color: Colors.white),
                                                ),
                                                child: Text(
                                                  'Confirm Delete',
                                                  style: TextStyle(
                                                      fontSize:
                                                          Constants.tSmallSize,
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  });
                                },
                              );

                              // Get.to(() => OrderDetailScreen(
                              //       orderId: order.id!,
                              //       orderStatus: order.last_status!.name!,
                              //       order_id: order.orderId.toString(),
                              //     )
                              //     );
                            })
                          ]);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Showing 1 to 2 of 2 entries',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: EdgeInsets.symmetric(
                    horizontal: 3,
                  ),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          'Previous',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                      Container(
                        width: 30,
                        color: Constants.blue,
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                      Text(
                        'Next',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Footer',
                      //textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ]),
            ),
          ),
        ]),
      )),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }
}
