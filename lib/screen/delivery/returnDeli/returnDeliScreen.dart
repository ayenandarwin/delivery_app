import 'package:delivery_app/controller/naviController.dart';
import 'package:delivery_app/screen/delivery/getWay/getWayDetail.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/service/deliveryReturnServic.dart';
import 'package:delivery_app/service/orderDetailService.dart';
import 'package:delivery_app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/getController.dart';
import '../../../utils/theme.dart';
import '../../login.dart';

class ReturnDeliverScreen extends StatefulWidget {
  const ReturnDeliverScreen({super.key});

  @override
  State<ReturnDeliverScreen> createState() => _ReturnDeliverScreenState();
}

class _ReturnDeliverScreenState extends State<ReturnDeliverScreen> {
  String? orderid;
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  var orders = Get.find<OrderController>().orders;
  TextEditingController countController = TextEditingController();
  FocusNode countFocusNode = FocusNode();
  List<String> items = ["30", "50", "100", "All"];
  String? value;
  var _remove;
  @override
  void initState() {
    _remove = true;

    super.initState();
  }

  buildBottomNavigationMenu(context, naviController) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: Global.changePage,
            currentIndex: naviController.currentIndex.value,
            // backgroundColor: Color.fromRGBO(101, 10, 10, 0.8),
            backgroundColor: Constants.blue,
            unselectedItemColor: Colors.white,
            selectedItemColor: Constants.red,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home'.tr,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.card_giftcard,
                    size: 20.0,
                  ),
                ),
                label: 'Pickup'.tr,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.qr_code,
                    size: 20.0,
                  ),
                ),
                label: 'Scan'.tr,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.delivery_dining,
                    size: 20.0,
                  ),
                ),
                label: 'Delivery',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.person_sharp,
                    size: 20.0,
                  ),
                ),
                label: 'Account'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final NaviController naviController = Get.put(NaviController());

    return Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, naviController),
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
              Get.to(() => ProfileScreen());
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
      body: SingleChildScrollView(child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Container(
            margin: EdgeInsets.all(16),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "Return List",
                    style: TextStyle(
                      fontSize: 20,
                      // color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Text(
                  //   "Return List",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _remove
                  ? Card(
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
                          // Container(
                          //   margin: EdgeInsets.symmetric(horizontal: 8),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text(
                          //         '',
                          //         style: TextStyle(
                          //             fontSize: 16, color: Constants.green),
                          //       ),
                          //       Row(
                          //         children: [
                          //           Icon(
                          //             Icons.remove,
                          //             color: Colors.grey[500],
                          //           ),
                          //           SizedBox(
                          //             width: 10,
                          //           ),
                          //           InkWell(
                          //             onTap: (() {
                          //               setState(() {
                          //                 _remove = !_remove;
                          //               });
                          //             }),
                          //             child: Icon(
                          //               Icons.cancel,
                          //               color: Colors.grey[500],
                          //             ),
                          //           )
                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Search:',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 3,
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
                          ref.watch(deliReturnServiceProvider).when(
                              data: (deliReturnList) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.61,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              // color: Constants.gray,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    headingRowColor: MaterialStateProperty.all(
                                        Constants.gray),
                                    dataRowColor:
                                        MaterialStateProperty.all(Colors.white),
                                    decoration: BoxDecoration(
                                        //color: Colors.grey
                                        ),
                                    horizontalMargin: 8,
                                    columnSpacing: 18,
                                    border:
                                        TableBorder.all(color: Colors.black12),
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
                                        "Process Date",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Constants.tDefaultSize,
                                        ),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Code",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Constants.tDefaultSize,
                                        ),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "To Delivery Info",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Constants.tDefaultSize,
                                        ),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Constants.tDefaultSize,
                                        ),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Constants.tDefaultSize,
                                        ),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "",
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
                                        "Weight",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Constants.tDefaultSize,
                                        ),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Note",
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
                                    rows: deliReturnList.map((deliReturn) {
                                      String apiDateString =
                                          "${deliReturn!.created_at!}"; // Replace this with your API date
                                      DateTime apiDate =
                                          DateTime.parse(apiDateString);
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy H:m a')
                                              .format(apiDate);
                                      return DataRow(cells: [
                                        DataCell(Container(
                                          padding: EdgeInsets.only(left: 5),
                                          //  color: Colors.white,
                                          child: Text(
                                            (deliReturnList
                                                        .indexOf(deliReturn) +
                                                    1)
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: Constants.tSmallSize),
                                          ),
                                        )),
                                        DataCell(Text(
                                          "$formattedDate",
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          deliReturn.order_code!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          deliReturn.to_name!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          deliReturn.to_phone!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          deliReturn.to_address!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          deliReturn.to_township!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          deliReturn.item_info!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          deliReturn.weight!,
                                          style: TextStyle(
                                              // color: Constants.green,
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(deliReturn.note != null
                                            ? Text(
                                                deliReturn.note!,
                                                style: TextStyle(
                                                    // color: Constants.green,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              )
                                            : Container()),
                                        DataCell(
                                            InkWell(
                                              onTap: (() async {
                                                setState(() {
                                                  orderid =
                                                      deliReturn.order_id!;
                                                });
                                                bool res = await Get.to(
                                                    GetWayDetail(
                                                        id: orderid
                                                            .toString()));

                                                if (res) {
                                                  ref.invalidate(
                                                      orderDetailProvider);
                                                }
                                              }),
                                              child: Center(
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  color: Constants.blue,
                                                  child: Icon(
                                                    Icons.menu,
                                                    size: 18,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            onTap: () {})
                                      ]);
                                    }).toList(),
                                  ),
                                ),
                              ),
                            );
                          }, error: (Object error, StackTrace stackTrace) {
                            return Text('$error');
                          }, loading: () {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                '',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ]),
                      ),
                    )
                  : Container(),
            ]),
          );
        },
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
}
