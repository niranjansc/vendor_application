library globals;

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String endpoint =
    // "https://container-isp-suite.ubk7f2p444mio.ap-south-1.cs.amazonlightsail.com/";
    "http://101.53.149.34:5011/";

bool isDark = true;

List strToLst(String str) {
  var split = str.toString().split(",");
  return split;
}

int report = 0;

List pnameLst = [];
List AdIdLst = [];
List AdUidLst = [];
List linkLst = [];
List HCLst = [];
List aprvd_list = [];
List adv_status = [];
List tgt_cnt = [];
List rem_cnt = [];
List Advt_link = [];

String AdLink = "";

String AdNm = "";
String AdID = "";
String _fileText = "";
String latitude = "";
String longitude = "";
String dailylimit = "";

String points = "";

String sts = "";

String Ads_link = "";

String cur_pid = "",
    cur_prof_vendid = "",
    cur_trgt = "",
    cur_hit_prof = "",
    Link_cur_vendor = "",
    cur_adv_stat = "",
    cur_img_link_vendor = "",
    cur_minAge = "",
    cur_maxAge = "",
    gender = "",
    profName = "",
    adTypeCur = "",
    slatCur = "",
    slongCur = "",
    advPreferenceCur = "",
    dlcntCur = "",
    IST_Stime = "",
    IST_Etime = "";

String total_cnt = "";
String Remainning_cnt = "";

String maxLimit = "";

String spacial = "";
String tagtype = "";
String tag = "";
String subTag = '';
String subTagType = '';
String mobno = '';

List subTags_lst = [];

String getTodaysDate() {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);
  return formattedDate;
}

void showToast(String msg) {
  Get.snackbar('Alert', msg, snackPosition: SnackPosition.TOP);
}

class cnd {
  static void showToast(BuildContext context, String msg) {
    Get.snackbar('Alert', msg,
        snackPosition: SnackPosition.TOP, duration: Duration(seconds: 5));
  }
}

Done_popup(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setstate) {
          return AlertDialog(
              title: Text('Success'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK'),
                ),
              ],
              content: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    Text('Done'),
                  ],
                ),
              )
              /*actions: <Widget>[

                    TextButton(onPressed: () {}, child: Text('Ok'))
                ],*/
              );
        });
      });
}

loading_popup(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setstate) {
          return AlertDialog(
              content: SizedBox(
            height: 50,
            child: Row(
              children: [
                CircularProgressIndicator(),
                Text('Loading ....'),
              ],
            ),
          )
              /*actions: <Widget>[

                    TextButton(onPressed: () {}, child: Text('Ok'))
                ],*/
              );
        });
      });
}

loading(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircularProgressIndicator(
            color: Colors.green,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Loading',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
