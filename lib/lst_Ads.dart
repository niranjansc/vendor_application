import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:new_vendor/Model/VendorProfileModel.dart';
import 'package:new_vendor/cards/vendorprofile_card.dart';
import 'package:new_vendor/dopa_glb.dart' as glb;
import 'package:http/http.dart' as http;
import 'package:new_vendor/lst_Ads01.dart';

class LstAds extends StatefulWidget {
  const LstAds({super.key});

  @override
  State<LstAds> createState() => _LstAdsState();
}

List<VendorProfileModel> lib = [];
bool isVis = false;

class _LstAdsState extends State<LstAds> {
  bool _showData = false, _isLoading = true, isCached = false;
  // List _data = [];

  ttl() async {
    setState(() {
      lib = [];
      _isLoading = true;
    });

    print('total');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');
    final Map dict = {
      "tlvNo": "31",
      "vdid": "15",
      "uid": "-1",
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

          setState(() {
            _isLoading = false;
          });

          //        glb.showToast('No new notifications');
          return;
        } else if (res.contains("ErrorCode#8")) {
          glb.showToast('Something Went Wrong');
          return;
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
            var allocatept = SubjectMap['allocationpoints'];
            var Rpt = SubjectMap['rechargepoints'];
            var PTpt = SubjectMap['proftranspoints'];

            glb.Remainning_cnt = Rpt;
            glb.total_cnt = allocatept;
            print('pname++ $allocatept');
            print('points $Rpt');
            print(PTpt);
            Subject();
          } catch (e) {
            print(e);
            return "Failed";
          }
        }
      }
    } catch (e) {
      print("handle Exception here::$e");
      setState(() {
        _isLoading = false;
      });
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

  Subject() async {
    lib = [];
    String url = glb.endpoint;
//print('TimeTable async url:$url');
    print('TimeTable tlv:: $url');
    final Map dict = {
      "tlvNo": "34",
      "vdid": "15",
      "uid": "-1",
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

          setState(() {
            _isLoading = false;
          });

          return;
        } else if (res.contains("ErrorCode#8")) {
          glb.showToast('Something Went Wrong');
          return;
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("Subject:$SubjectMap");
            var pname = SubjectMap['pname'];
            var id = SubjectMap['id'];
            var uid = SubjectMap['uid'];
            var link = SubjectMap['link'];
            var Hc = SubjectMap['hit_cnt'];
            var isaprvd = SubjectMap['isaprvd'];
            var status = SubjectMap['enabled'];
            var advstatus = SubjectMap['adv_status'];
            var tgt_cnt = SubjectMap['tgt_cnt'];
            var rem_cnt = SubjectMap['rem_cnt'];
            var img_link = SubjectMap['ing_lnk'];
            // var Advt_link = SubjectMap["Advt_link"];

            // print('hc== ${Hc}');
            print(' 1 img_link==${img_link}');
            print('isaprvd== ${isaprvd}');
            print('status== ${status}');
            print('tgt_cnt==${tgt_cnt}');
            print('rem = ${rem_cnt}');
            // print('Advt_link=${Advt_link}');

            List pname_list = glb.strToLst(pname);
            List id_list = glb.strToLst(id);
            List uid_list = glb.strToLst(uid);
            List link_list = glb.strToLst(link);
            List hcLst = glb.strToLst(Hc);
            List aprvd_list = glb.strToLst(isaprvd);
            List sts_Lst = glb.strToLst(status);
            List tgt_cntlist = glb.strToLst(tgt_cnt);
            List rem_cntlist = glb.strToLst(rem_cnt);
            List AdsLink_lst = glb.strToLst(img_link);
            // List Advt_link_list = glb.strToLst(Advt_link);

            for (int i = 0; i < aprvd_list.length; i++) {
              if (aprvd_list[i].toString() == '1') {
                aprvd_list[i] = 'Approved';
              } else {
                aprvd_list[i] = 'Disapproved';
              }
            }

            for (int i = 0; i < sts_Lst.length; i++) {
              print('Status====$sts_Lst[i]');
              if (sts_Lst[i] == '1') {
                sts_Lst[i] = 'Enabled';
              } else if (sts_Lst[i] == '0') {
                sts_Lst[i] = "Disabled";
              }
            }

            // print('$pname_list');

            print(uid_list);
            print(link_list);
            print(hcLst);
            print('lst = $aprvd_list');

            print('ids = =id_list');
            print("sts list = $sts_Lst");
            glb.pnameLst = pname_list;
            glb.AdIdLst = id_list;
            glb.AdUidLst = uid_list;
            glb.linkLst = link_list;
            glb.HCLst = hcLst;
            glb.aprvd_list = aprvd_list;
            glb.adv_status = sts_Lst;
            glb.tgt_cnt = tgt_cntlist;
            glb.rem_cnt = rem_cntlist;
            // glb.Advt_link = Advt_link_list;
            print('siccess');
            print('ad id = ${glb.AdIdLst.length}');

            for (int i = 0; i < glb.AdIdLst.length; i++) {
              lib.add(VendorProfileModel(
                uid: glb.AdUidLst.elementAt(i),
                pname: glb.pnameLst.elementAt(i),
                link: glb.linkLst.elementAt(i),
                id: glb.AdIdLst.elementAt(i),
                hc: glb.HCLst.elementAt(i),
                isaprvd: glb.aprvd_list.elementAt(i),
                status: glb.adv_status.elementAt(i),
                tgt_cnt: glb.tgt_cnt.elementAt(i),
                rem_cnt: glb.rem_cnt.elementAt(i),
                AdsLink: AdsLink_lst.elementAt(i),
              ));
            }
            // print(lib);

            setState(() {
              isVis = true;
              _isLoading = false;
            });

            // var subid = SubjectMap['2'];
            //var timetblid = SubjectMap['3'];

            print('pname$pname');
            print('id==$id');
            print('uid==$uid');
            print('link==$link');

            //    print('subid$subid');
            //  print('timetblid$timetblid');
          } catch (e) {
            print(e);
            return "Failed";
          }
        }
      }
    } catch (e) {
      print("handle Exception here::$e");
      setState(() {
        _isLoading = false;
      });
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

//   Ad_link() async {
//     print('total');
//     String url = glb.endpoint;
// //print('TimeTable async url:$url');
//     print('TimeTable tlv:: $url');

//     // String tlv = "{\"pid\":${glb.AdID},\"tgt_cnt\":${glb.cur_trgt}}";
//     // print(tlv);
//     //print('tlv');

//     final Map dict = {
//       "tlvNo": "34",
//       "vdid": "15",
//       "uid": "-1",
//       "authToken": "AABBCCDD"
//     };

//     try {
//       final response = await http.post(Uri.parse(url),
//           headers: <String, String>{
//             "Accept": "application/json",
//             'Content-Type': 'application/json; charset=UTF-8',
//           },
//           body: jsonEncode(dict));
//       print(response.body);
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         var res = response.body;
//         print('res === $res');
//         if (res.contains("ErrorCode#2")) {
//           print('error2');

//           // setState(() {
//           //   _isLoading = false;
//           // });

//           //        glb.showToast('No new notifications');
//           return;
//         } else if (res.contains("ErrorCode#8")) {
//           glb.showToast('Something Went Wrong');
//           return;
//         } else if (res.contains("ErrorCode#0")) {
//           // Allocatepoints_2();
//           print("Done");
//         } else {
//           try {
//             Map<String, dynamic> SubjectMap = json.decode(response.body);
//             print("json str:$SubjectMap");
//           } catch (e) {
//             print(e);
//             return "Failed";
//           }
//         }
//       }
//     } catch (e) {
//       print("handle Exception here::$e");
//       // setState(() {
//       //   _isLoading = false;
//       // });
//       if (e.toString().contains("Connection refused")) {
//         glb.showToast('No Internet Connection Found / Server is Down');
//       } else if (e.toString().contains("Operation timed out")) {
//         glb.showToast('Operation Timed Out');
//       }
//     }

//     return "Success";
//   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ttl();
    // Subject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('VENDOR PROFILES'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            ttl();
            // Subject();
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "TOTAL COUNT:",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text("${glb.Remainning_cnt}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "REMAINNING COUNT:",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text("${glb.total_cnt}",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isVis,
                child: Expanded(
                  child: _isLoading
                      ? Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: glb.loading(context),
                        )
                      : ListView.builder(
                          itemCount: lib.length,
                          itemBuilder: (BuildContext context, index) {
                            return vendorprofilecard(
                              datamodel: lib[index],
                            );
                          }),
                ),
              ),
            ],
          ),
        ));
  }
}
