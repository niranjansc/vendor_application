import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:new_vendor/ads_type_page.dart';
import 'package:new_vendor/languages.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:new_vendor/homescreen.dart';
import 'package:new_vendor/ads_creation.dart';
import 'package:new_vendor/dopa_glb.dart' as glb;
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:new_vendor/location.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_vendor/lst_Ads.dart';

class LstAds01 extends StatefulWidget {
  const LstAds01({super.key});

  @override
  State<LstAds01> createState() => _LstAdsState();
}

TextEditingController cnt = new TextEditingController();
TextEditingController dailylimitcnt = new TextEditingController();
TextEditingController maxLimt = new TextEditingController();
TextEditingController Mcont = new TextEditingController();

bool isVisible = false;

String nav = "";
List ads = [
  "Allocate points",
  "De-allocate points",
  "View Ads-Link",
  "View Ads-Video",
  "View Profile Summary",
  // "Enable",
  // "Disable",
  "Update location",
  "View location",
  "Daily limit",
  "Max limit",
  // "Ads view - ",
  "Ads type",
  // "Select tags",
  "Mobile number update"
];

bool col = false;
String E_D = "";

class _LstAdsState extends State<LstAds01> {
  @override
  void initState() {
    // TODO: implement initState
    if (glb.sts == 'Enabled') {
      col = false;
      E_D = "Disable";
    } else {
      col = true;

      E_D = "Enable";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${glb.AdNm}"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              // if (glb.sts == 'Disabled') {
              //   setState(() {
              //     glb.sts == 'Enabled';
              //   });
              // } else if (glb.sts == 'Enabled') {
              //   setState(() {
              //     glb.sts == 'Disabled';
              //   });
              // }

              Enable_disable();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: col ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                width: 150,
                child: Center(
                    child: Text(
                  E_D,
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: ads.length,
                itemBuilder: (BuildContext context, index) {
                  return Visibility(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          print(ads[index]);
                          nav = ads[index].toString();
                          if (ads[index].toString() == 'Allocate points') {
                            allocate_popup();
                          } else if (ads[index].toString() ==
                              'De-allocate points') {
                            deallocate_popup();
                          } else if (ads[index].toString() == 'Daily limit') {
                            print('daily poup');
                            daily_limitpopup();
                          } else if (ads[index].toString() == 'Disable') {
                            glb.sts = 'Disabled';
                            Enable_disable();
                          } else if (ads[index].toString() == 'Enable') {
                            glb.sts = 'Enabled';
                            Enable_disable();
                          } else if (ads[index].toString() == 'View Ads-link') {
                            print(glb.AdLink);
                            var url = glb.AdLink;
                            _View_Ads(url);
                          } else if (ads[index].toString() ==
                              'Update location') {
                            getDeviceLocation();
                          } else if (ads[index].toString() == 'View location') {
                            getDeviceLocation();
                          } else if (ads[index].toString() == 'Ads type') {
                            // Ads_type_popup();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ads_type_page()));
                          } else if (ads[index].toString() == 'Select tags') {
                            //slct_tgs_popup();
                          } else if (ads[index].toString() ==
                              'View Ads-Video') {
                            var url = glb.Ads_link;
                            _View_Ads(url);
                          } else if (ads[index].toString() == 'Max limit') {
                            max_limitpopup();
                          } else if (ads[index].toString() ==
                              'Mobile number update') {
                            Mobile_no_popup();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          width: double.maxFinite,
                          child: Center(
                              child: Text(
                            ads[index],
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  allocate_popup() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setstate) {
            return AlertDialog(
              title: Text('Allocate points'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                    var cont = cnt.text;
                    var a = int.parse(glb.cur_trgt.toString());
                    var b = int.parse(cont.toString());
                    glb.points = (b * -1).toString();
                    var res = a + b;
                    glb.cur_trgt = res.toString();
                    print('res== $res');
                    Allocatepoints();
                  },
                  child: const Text('OK'),
                ),
              ],
              content: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: 200,
                  height: 50,
                  child: Column(
                    children: [
                      TextField(
                        controller: cnt,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              /*actions: <Widget>[

                    TextButton(onPressed: () {}, child: Text('Ok'))
                ],*/
            );
          });
        });
  }

  Ads_type_popup() {
    SingingCharacter1? _character = SingingCharacter1.special;
    SingingCharacter? _character1 = SingingCharacter.Super;
    return showDialog(
        context: context,
        builder: (
          BuildContext context,
        ) {
          return StatefulBuilder(builder: (context, setstate) {
            return AlertDialog(
                title: Text('Select Ads Type'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Select_tags();
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text('OK'),
                  ),
                ],
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
                        width: 100,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: const Text('Spacial Type'),
                              leading: Radio<SingingCharacter1>(
                                value: SingingCharacter1.special,
                                groupValue: _character,
                                onChanged: (SingingCharacter1? value) {
                                  setState(() {
                                    _character = value;
                                    glb.spacial = "1";
                                    isVisible = true;
                                    Select_adstype();
                                  });
                                },
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Visibility(
                                    visible: isVisible,
                                    child: Expanded(
                                      child: Scrollable(
                                        viewportBuilder: (BuildContext context,
                                            ViewportOffset position) {
                                          return Container(
                                              color: Colors.grey[100],
                                              child: Column(
                                                children: <Widget>[
                                                  ListTile(
                                                    title: const Text('Supper'),
                                                    leading:
                                                        Radio<SingingCharacter>(
                                                      value: SingingCharacter
                                                          .Super,
                                                      groupValue: _character1,
                                                      onChanged:
                                                          (SingingCharacter?
                                                              value) {
                                                        setState(() {
                                                          glb.tagtype =
                                                              'supertag';

                                                          _character1 = value;
                                                          Select_tags1();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: const Text('Campus'),
                                                    leading:
                                                        Radio<SingingCharacter>(
                                                      value: SingingCharacter
                                                          .campus,
                                                      groupValue: _character1,
                                                      onChanged:
                                                          (SingingCharacter?
                                                              value) {
                                                        setState(() {
                                                          glb.tagtype =
                                                              'campustag';
                                                          _character1 = value;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title:
                                                        const Text('premier'),
                                                    leading:
                                                        Radio<SingingCharacter>(
                                                      value: SingingCharacter
                                                          .premier,
                                                      groupValue: _character1,
                                                      onChanged:
                                                          (SingingCharacter?
                                                              value) {
                                                        setState(() {
                                                          glb.tagtype =
                                                              'onpremtag';
                                                          _character1 = value;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ));
                                        },
                                      ),
                                    )),
                              ],
                            ),
                            ListTile(
                              title: const Text('Regular Type'),
                              leading: Radio<SingingCharacter1>(
                                value: SingingCharacter1.regular,
                                groupValue: _character,
                                onChanged: (SingingCharacter1? value) {
                                  setState(() {
                                    _character = value;
                                    glb.spacial = "0";
                                    isVisible = false;
                                  });
                                  Select_adstype();
                                },
                              ),
                            ),
                          ],
                        ));
                  },
                )
                /*actions: <Widget>[

                    TextButton(onPressed: () {}, child: Text('Ok'))
                ],*/
                );
          });
        });
  }

  slct_tgs_popup() {
    SingingCharacter? _character = SingingCharacter.Super;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setstate) {
            return AlertDialog(
                title: Text('Select Tag Type'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text('OK'),
                  ),
                ],
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
                        height: 170,
                        width: 100,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: const Text('Supper'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.Super,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Campus'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.campus,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('premier'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.premier,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ));
                  },
                ));
          });
        });
  }

  bool _showData = false, _isLoading = true, isCached = false;

  Allocatepoints() async {
    print('total');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');

    String tlv = "{\"pid\":${glb.AdID},\"tgt_cnt\":${glb.cur_trgt}}";

    final Map dict = {
      "tlvNo": "62",
      "pid": glb.AdID,
      "tgt_cnt": glb.cur_trgt,
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
        print('res === $res');
        if (res.contains("ErrorCode#2")) {
          print('error2');

          setState(() {
            _isLoading = false;
          });

          glb.showToast('No new notifications');
          return;
        } else if (res.contains("ErrorCode#8")) {
          glb.showToast('Something Went Wrong');
          return;
        } else if (res.contains("ErrorCode#0")) {
          Allocatepoints_2();
          print("Done");
          // glb.cnd.showToast(context, 'Done');
          glb.Done_popup(context);
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
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

  Allocatepoints_2() async {
    print('total allocate pts 2');
    String url = glb.endpoint;
//print('TimeTable async url:$url');
    print('TimeTable tlv:: $url');

    String tlv = "{\"pid\":${glb.AdID},\"tgt_cnt\":${glb.cur_trgt}}";
    // print(tlv);
    //print('tlv');

    final Map dict = {
      "tlvNo": "63",
      "vendid": "15",
      "date": glb.getTodaysDate(),
      "pid": glb.AdID,
      "points": glb.points,
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
        print('res === $res');
        if (res.contains("ErrorCode#2")) {
          print('error2');

          setState(() {
            _isLoading = false;
          });

          return;
        } else if (res.contains("ErrorCode#8")) {
          glb.showToast('Something Went Wrong');
          return;
        } else if (res.contains("ErrorCode#0")) {
          print("Done");
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
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

// ===================================

  deallocate_popup() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: ((context, setState) {
              return AlertDialog(
                title: Text("De-allocate points"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                      var cont = cnt.text;
                      var a = int.parse(glb.cur_trgt.toString());
                      var b = int.parse(cont.toString());
                      glb.points = (b * 1).toString();
                      var res = a - b;
                      glb.cur_trgt = res.toString();
                      print('res== $res');
                      De_allocatepoints();
                    },
                    child: const Text('OK'),
                  ),
                ],
                content: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    width: 200,
                    height: 50,
                    child: Column(
                      children: [
                        TextField(
                          controller: cnt,
                          keyboardType: TextInputType.number,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }

  De_allocatepoints() async {
    print('total');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');

    String tlv = "{\"pid\":${glb.AdID},\"tgt_cnt\":${glb.cur_trgt}}";

    final Map dict = {
      "tlvNo": "62",
      "pid": glb.AdID,
      "tgt_cnt": glb.cur_trgt,
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
        print('res === $res');
        if (res.contains("ErrorCode#2")) {
          print('error2');

          setState(() {
            _isLoading = false;
          });

          return;
        } else if (res.contains("ErrorCode#8")) {
          glb.showToast('Something Went Wrong');
          return;
        } else if (res.contains("ErrorCode#0")) {
          print("Done");
          De_allocatepoints_2();
          glb.cnd.showToast(context, 'Done');
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
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

  De_allocatepoints_2() async {
    print('total');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');

    String tlv = "{\"pid\":${glb.AdID},\"tgt_cnt\":${glb.cur_trgt}}";

    final Map dict = {
      "tlvNo": "63",
      "vendid": "15",
      "date": glb.getTodaysDate(),
      "pid": glb.AdID,
      "points": glb.points,
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
        print('res === $res');
        if (res.contains("ErrorCode#2")) {
          print('error2');

          setState(() {
            _isLoading = false;
          });

          // glb.showToast('No new notifications');
          return;
        } else if (res.contains("ErrorCode#8")) {
          glb.showToast('Something Went Wrong');
          return;
        } else if (res.contains("ErrorCode#0")) {
          Allocatepoints_2();
          print("Done");
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
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

  // ======================================
  daily_limitpopup() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: ((context, setState) {
              return AlertDialog(
                title: Text("Daily limit points"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                      var cont = dailylimitcnt.text;
                      glb.dailylimit = cont;

                      Daily_limit();
                    },
                    child: const Text('OK'),
                  ),
                ],
                content: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    width: 200,
                    height: 50,
                    child: Column(
                      children: [
                        TextField(
                          controller: dailylimitcnt,
                          keyboardType: TextInputType.number,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }

  // ===================

  Daily_limit() async {
    print('Dl m async');
    print('daily limit${glb.dailylimit}');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');
    glb.dailylimit = dailylimitcnt.text;

    final Map dict = {
      "tlvNo": "101",
      "pid": glb.AdID,
      "key": "29",
      "dlcnt": glb.dailylimit,
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
        print('res === $res');
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
        } else if (res.contains("ErrorCode#0")) {
          print("Done");
          // De_allocatepoints_2();
          glb.cnd.showToast(context, 'Done');
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
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

// ========================================================================
  Max_limit() async {
    print('maxlimit');
    String url = glb.endpoint;
//print('TimeTable async url:$url');
    print('TimeTable tlv:: $url');

    // String tlv = "{\"pid\":${glb.AdID},\"tgt_cnt\":${glb.cur_trgt}}";
    // print(tlv);
    //print('tlv');

    final Map dict = {
      "tlvNo": "101",
      "pid": glb.AdID,
      "mxcnt": glb.maxLimit,
      "key": "35",
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
        print('res === $res');
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
        } else if (res.contains("ErrorCode#0")) {
          print("Done");
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
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

// =====================================

  max_limitpopup() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: ((context, setState) {
              return AlertDialog(
                title: Text("Max limit points"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                      var cont = maxLimt.text;
                      glb.maxLimit = cont + "";
                      print("maxlimit=${glb.maxLimit}");
                      Max_limit();
                      // Daily_limit();
                    },
                    child: const Text('OK'),
                  ),
                ],
                content: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    width: 200,
                    height: 50,
                    child: Column(
                      children: [
                        TextField(
                          controller: maxLimt,
                          keyboardType: TextInputType.number,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }

// =============================================================

  Mobile_no_popup() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: ((context, setState) {
              return AlertDialog(
                title: Text("Mobile number update"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      glb.mobno = Mcont.text;
                      print(glb.mobno.length);
                      if (glb.mobno.length == 10) {
                        Navigator.pop(context, 'OK');
                        Mobile_no_update();
                      } else {
                        glb.showToast('Please Enter Valid Mobile Number');
                      }
                    },
                    child: const Text('OK'),
                  ),
                ],
                content: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    width: 200,
                    height: 50,
                    child: Column(
                      children: [
                        TextField(
                          controller: Mcont,
                          keyboardType: TextInputType.number,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }

  // ========================================
  Mobile_no_update() async {
    String url = glb.endpoint;

    final Map dict = {
      "tlvNo": "101",
      "pid": glb.AdID,
      "key": "36",
      "link": glb.mobno,
      "segid": "segid",
      "uid": "-1",
      "authToken": "AABBCCDD"
    };
    print('mbno dict = $dict');

    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            "Accept": "application/json",
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(dict));
      print(response.body);

      print(response.statusCode);
      if (response.statusCode == 200) {
        var res = response.body;
        print('res === $res');
        if (res.contains("ErrorCode#2")) {
          print('error2');

          setState(() {
            _isLoading = false;
          });

          return;
        } else if (res.contains("ErrorCode#8")) {
          glb.showToast('Something Went Wrong');
          return;
        } else if (res.contains("ErrorCode#0")) {
          print("Done");

          glb.cnd.showToast(context, 'Done');
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
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

// =============================================
  Select_adstype() async {
    print('Select_adstype');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');
    print(glb.spacial);
    print(glb.AdID);
    final Map dict = {
      "tlvNo": "101",
      "pid": glb.AdID,
      "special": glb.spacial,
      "key": "28",
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
        print('res === $res');
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
        } else if (res.contains("ErrorCode#0")) {
          print("Done");
          glb.Done_popup(context);
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
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
  // =====================================================

  Select_tags() async {
    print('Select_tags');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');
    print(glb.tag);
    print(glb.AdID);
    var key = "";
    var tag = "";
    if (glb.tagtype == 'supertag') {
      key = "31";
    } else if (glb.tagtype == 'campustag') {
      key = "32";
    } else if (glb.tagtype == 'onpremtag') {
      key = "33";
    }
    tag = glb.tagtype;
    String tag_val = "Sample";
    print(key);
    print("tag::" + tag);
    final Map dict = {
      "tlvNo": "101",
      "pid": glb.AdID,
      tag: tag_val,
      "key": key,
      "uid": "-1",
      "authToken": "AABBCCDD"
    };
    print('p dict = $dict');

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
        print('res === $res');
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
        } else if (res.contains("ErrorCode#0")) {
          print("Done");
          glb.Done_popup(context);
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
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

// ===================================

  Select_tags1() async {
    print('Select_tags1');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');

    var tag = "";
    String type = glb.tag;

    print("tag::" + glb.tagtype);
    final Map dict = {
      "tlvNo": "43",
      // "pid": glb.AdID,
      "key": "3",
      "Type": glb.subTag,
      "uid": "-1",
      "authToken": "AABBCCDD"
    };
    print('prev $dict');

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
        print('res === $res');
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
        } else if (res.contains("ErrorCode#0")) {
          print("Done");
          glb.Done_popup(context);
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
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

// ===============================
  Enable_disable() async {
    print('enable or disable');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');

    String mode = "";
    print('sts e/d = ${glb.sts}');
    if (glb.sts == 'Enabled') {
      mode = '0';
    } else if (glb.sts == 'Disabled') {
      mode = '1';
    }
    print('adid = ${glb.AdID}');
    print('mode == $mode');
    final Map dict = {
      "tlvNo": "61",
      "pid": glb.AdID,
      "vdid": "15",
      "uid": "-1",
      "mode": mode,
      "authToken": "AABBCCDD"
    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            "Accept": "application/json",
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(dict));
      print('dict = $dict');
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var res = response.body;
        print('res === $res');
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
        } else if (res.contains("ErrorCode#0")) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LstAds()));
          print("Done");
          glb.cnd.showToast(context, 'Done');
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
          } catch (e) {
            print(e);
            return "Failed";
          }
        }
      }
    } catch (e) {
      print("handle  Exception here::$e");
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
}

Update_location() async {
  print('total');
  print('latitude :${glb.latitude}');
  print('longitude:${glb.longitude}');
  String url = glb.endpoint;

  print('TimeTable tlv:: $url');

  final Map dict = {
    "tlvNo": "205",
    "id": glb.AdID,
    "lats": glb.latitude,
    "lngs": glb.longitude,
    "key": "3",
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
      print('res === $res');
      if (res.contains("ErrorCode#2")) {
        print('error2');

        return;
      } else if (res.contains("ErrorCode#8")) {
        glb.showToast('Something Went Wrong');
        return;
      } else if (res.contains("ErrorCode#0")) {
        print("Done");
        glb.showToast('Done');
      } else {
        try {
          Map<String, dynamic> SubjectMap = json.decode(response.body);
          print("json str:$SubjectMap");
        } catch (e) {
          print(e);
          return "Failed";
        }
      }
    }
  } catch (e) {
    print("handle Exception here::$e");

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

// =======================================================

void getDeviceLocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double latitude = position.latitude;
    double longitude = position.longitude;

    // Do something with the latitude and longitude values
    print('Latitude: $latitude, Longitude: $longitude');
    glb.latitude = latitude.toString();
    glb.longitude = longitude.toString();
  } catch (e) {
    print('Error: $e');
  }
  if (nav == 'Update location') {
    Update_location();
    glb.showToast('Done');
  } else if (nav == 'View location') {
    _view_loc(glb.latitude, glb.longitude);
  }
}

_View_Ads(String url) async {
  print('ads');
  try {
    print('try');

    LaunchMode.externalApplication;
    // ignore: deprecated_member_use
    await launch(url);
  } catch (_) {}
}

_view_loc(String lat, String long) async {
  print('ads');
  try {
    print('try');
    String url = "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    LaunchMode.externalApplication;
    // ignore: deprecated_member_use
    await launch(url);
  } catch (_) {}
}

enum SingingCharacter { campus, Super, premier }

enum SingingCharacter1 { special, regular }
