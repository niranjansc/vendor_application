// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_vendor/dopa_glb.dart' as glb;
import 'package:http/http.dart' as http;

import 'Model/spl_rglr_profilemodel.dart';
import 'cards/spl_rglr_profilecard.dart';

class DisplayReports extends StatefulWidget {
  const DisplayReports({super.key});

  @override
  State<DisplayReports> createState() => _DisplayReportsState();
}

class _DisplayReportsState extends State<DisplayReports> {
  @override
  void initState() {
    // TODO: implement initState
    if (glb.report == 1) {
      Subject();
    } else if (glb.report == 2) {
      spl_enbl_dsbl();
    } else if (glb.report == 3) {
      Routerkey_Ads();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        foregroundColor: Colors.amber,
                        backgroundColor: Colors.amber,
                      ),
                      Text("Special")
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                      ),
                      Text("Regular")
                    ],
                  )
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: m.length,
                      itemBuilder: (BuildContext context, index) {
                        return spl_rglr_profilecard(
                          datamodel: m[index],
                        );
                      }))
            ],
          ),
        ));
  }

  List<spl_rglr_profilemodel> m = [];

  Subject() async {
    m = [];
    String url = glb.endpoint;
//print('TimeTable async url:$url');
    print('TimeTable tlv:: $url');
    final Map dict = {
      "tlvNo": "211",
      "key": "13",
      "uid": "15",
      "authToken": "AABBCCDD"
    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            "Accept": "application/json",
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(dict));
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var res = response.body;
        if (res.contains("ErrorCode#2")) {
          print('error2');

          setState(() {});

          return;
        } else if (res.contains("ErrorCode#8")) {
          glb.showToast('Something Went Wrong');
          return;
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("Subject:$SubjectMap");
            var adName = SubjectMap['res1'];
            var PName = SubjectMap['res2'];
            var typ = SubjectMap['res3'];

            print(' ads name==${adName}');
            print('profile name== ${PName}');
            print('status== ${typ}');

            List adName_lst = glb.strToLst(adName);
            List pName_lst = glb.strToLst(PName);
            List typ_lst = glb.strToLst(typ);

            print('ids = =id_list');

            for (int i = 0; i < pName_lst.length; i++) {
              m.add(spl_rglr_profilemodel(
                  name: pName_lst.elementAt(i),
                  adName: adName_lst.elementAt(i),
                  type: typ_lst.elementAt(i)));
            }

            setState(() {});
          } catch (e) {
            print(e);
            return "Failed";
          }
        }
      }
    } catch (e) {
      print("handle Exception here::$e");
      setState(() {});
      if (e.toString().contains("Connection refused")) {
        glb.showToast('No Internet Connection Found / Server is Down');
      } else if (e.toString().contains("Operation timed out")) {
        glb.showToast('Operation Timed Out');
      } else if (e.toString().contains(
          "Failed host lookup: 'container-isp-suite.ubk7f2p444mio.ap-south-1.cs.amazonlightsail.com'")) {
        glb.showToast('No Internet Connection');
      }
    }

    return "Success";
  }

  spl_enbl_dsbl() async {
    m = [];
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');
    final Map dict = {
      "tlvNo": "212",
      "key": "1",
      "uid": "16",
      "authToken": "AABBCCDD"
    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            "Accept": "application/json",
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(dict));
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var res = response.body;
        if (res.contains("ErrorCode#2")) {
          print('error2');

          setState(() {});

          return;
        } else if (res.contains("ErrorCode#8")) {
          glb.showToast('Something Went Wrong');
          return;
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("Subject:$SubjectMap");
            var adName = SubjectMap['res1'];
            var Hitcount = SubjectMap['res2'];
            var Tgt_count = SubjectMap['res3'];
            var Vendor = SubjectMap['res4'];
            var rem = SubjectMap['res5'];
            var spacial = SubjectMap['res6'];
            var enabled = SubjectMap['res7'];

            print(' ads name==${adName}');
            print('Hit count == ${Hitcount}');
            print('tgt count== ${Tgt_count}');

            print(' vendor==${Vendor}');

            print(' rem==${rem}');
            print('spacial== ${spacial}');
            print('enabled== ${enabled}');

            List adName_lst = glb.strToLst(adName);
            List Hitcount_lst = glb.strToLst(Hitcount);
            List Tgt_count_lst = glb.strToLst(Tgt_count);
            List Vendor_lst = glb.strToLst(Vendor);

            List rem_lst = glb.strToLst(rem);
            List spacial_lst = glb.strToLst(spacial);
            List enabled_lst = glb.strToLst(enabled);

            print('ids = =id_list');

            setState(() {});
          } catch (e) {
            print(e);
            return "Failed";
          }
        }
      }
    } catch (e) {
      print("handle Exception here::$e");
      setState(() {});
      if (e.toString().contains("Connection refused")) {
        glb.showToast('No Internet Connection Found / Server is Down');
      } else if (e.toString().contains("Operation timed out")) {
        glb.showToast('Operation Timed Out');
      } else if (e.toString().contains(
          "Failed host lookup: 'container-isp-suite.ubk7f2p444mio.ap-south-1.cs.amazonlightsail.com'")) {
        glb.showToast('No Internet Connection');
      }
    }

    return "Success";
  }

  Routerkey_Ads() async {
    print("rr == 123456");
    m = [];
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');
    final Map dict = {
      "tlvNo": "211",
      "key": "17",
      "uid": "53",
      "vdid": "53",
      "authToken": "AABBCCDD"
    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            "Accept": "application/json",
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(dict));
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var res = response.body;
        if (res.contains("ErrorCode#2")) {
          print('error2');

          setState(() {});

          return;
        } else if (res.contains("ErrorCode#8")) {
          glb.showToast('Something Went Wrong');
          return;
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("Subject:$SubjectMap");
            var adName = SubjectMap['res1'];
            var count = SubjectMap['res2'];
            var routerkey = SubjectMap['res3'];
            var date = SubjectMap['res4'];
            // var rem = SubjectMap['res5'];
            // var spacial = SubjectMap['res6'];
            // var enabled = SubjectMap['res7'];

            print(' ads name==${adName}');
            print('Hit count == ${count}');
            print('tgt count== ${routerkey}');

            print(' vendor==${date}');

            // print(' rem==${rem}');
            // print('spacial== ${spacial}');
            // print('enabled== ${enabled}');

            List adName_lst = glb.strToLst(adName);
            List count_lst = glb.strToLst(count);
            List routerkey_lst = glb.strToLst(routerkey);
            List date_lst = glb.strToLst(date);

            // List rem_lst = glb.strToLst(rem);
            // List spacial_lst = glb.strToLst(spacial);
            // List enabled_lst = glb.strToLst(enabled);

            print('ids = =id_list');

            setState(() {});
          } catch (e) {
            print(e);
            return "Failed";
          }
        }
      }
    } catch (e) {
      print("handle Exception here::$e");
      setState(() {});
      if (e.toString().contains("Connection refused")) {
        glb.showToast('No Internet Connection Found / Server is Down');
      } else if (e.toString().contains("Operation timed out")) {
        glb.showToast('Operation Timed Out');
      } else if (e.toString().contains(
          "Failed host lookup: 'container-isp-suite.ubk7f2p444mio.ap-south-1.cs.amazonlightsail.com'")) {
        glb.showToast('No Internet Connection');
      }
    }

    return "Success";
  }
}
