import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:intl/intl.dart';
import 'package:new_vendor/dopa_glb.dart' as glb;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:new_vendor/login.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'display_reports.dart';

class Profile_sts extends StatefulWidget {
  const Profile_sts({super.key});

  @override
  State<Profile_sts> createState() => _Profile_stsState();
}

DateTime DateFR = DateTime.now();
String FrmDt = DateFormat('yyyy-MM-dd').format(DateFR).toString();
DateTime DateTO = DateTime.now();
String ToDt = DateFormat('yyyy-MM-dd').format(DateTO).toString();

class _Profile_stsState extends State<Profile_sts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor Reports'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print("tap");
                          // datepopup(context);
                          _showIOS_DatePicker(context);
                        },
                        child: Text('From'),
                      ),
                      Text(FrmDt.toString()),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _showIOS_DatePicker1(context);
                        },
                        child: Text('TO'),
                      ),
                      Text(ToDt.toString())
                    ],
                  ),
                )
              ],
            ),
//             ElevatedButton(
//               onPressed: () {
//                 print("tap");
//                 // Daily_limit();
//                 // Assuming you have received the HTML data as a String named 'receivedData'
//                 String receivedData =
//                     '<h1>Hello, this is HTML content hfuy ugty u!</h1>';

// // Use the HtmlPage widget to display the received HTML data
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => HtmlPage(receivedData: receivedData),
//                   ),
//                 );
//               },
//               child: Text('Submit'),
//             ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              glb.report = 1;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DisplayReports()));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10)),
                                height: 120,
                                width: 150,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "List Of All Profile\nSpacial/Regular",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              glb.report = 2;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DisplayReports()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10)),
                              height: 120,
                              width: 150,
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "List Of All Profile \nDetails-Spacial/Enabled/Disable",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              glb.report = 3;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DisplayReports()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10)),
                              height: 120,
                              width: 150,
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "List Of Routerkey&Ads Hitcount with date",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10)),
                            height: 120,
                            width: 150,
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "List Of Profile Name & Ads Hitcount ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10)),
                            height: 120,
                            width: 150,
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Datewise User Count",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10)),
                            height: 120,
                            width: 150,
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Router keywise User Count",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 220),
            //   child: Column(
            //     children: [
            //       Container(
            //           height: 100,
            //           width: 95,
            //           decoration: BoxDecoration(
            //               color: Colors.black38,
            //               borderRadius: BorderRadius.circular(10))),
            //       Padding(
            //         padding: const EdgeInsets.all(10),
            //         child: Container(
            //             height: 100,
            //             width: 95,
            //             decoration: BoxDecoration(
            //                 color: Colors.black38,
            //                 borderRadius: BorderRadius.circular(10))),
            //       ),
            //       Container(
            //           height: 100,
            //           width: 95,
            //           decoration: BoxDecoration(
            //               color: Colors.black38,
            //               borderRadius: BorderRadius.circular(10))),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  //
  void _showIOS_DatePicker(ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 190,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 180,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          setState(() {
                            FrmDt =
                                DateFormat('yyyy-MM-dd').format(val).toString();
                            // dateSelected = val.toString();
                          });
                        }),
                  ),
                ],
              ),
            ));
  }

  //
  void _showIOS_DatePicker1(ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 190,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 180,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          setState(() {
                            print(val);
                            ToDt =
                                DateFormat('yyyy-MM-dd').format(val).toString();
                            // dateSelected = val.toString();
                          });
                        }),
                  ),
                ],
              ),
            ));
  }

  //

  Daily_limit() async {
    List usrid_lst = [], usrname_lst = [], contact_lst = [], count_lst = [];

    print('Dl m async');
    print('daily limit${glb.dailylimit}');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');

    final Map dict = {
      "tlvNo": "209",
      "pid": glb.AdID,
      "key": "1",
      "sdt": "$FrmDt",
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
            // _isLoading = false;
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

            var usrid = SubjectMap["usrid"];
            var usrnm = SubjectMap["usrname"];
            var contact = SubjectMap["contact"];
            var count = SubjectMap["count"];

            usrid_lst = usrname_lst = contact_lst = count_lst = [];
            usrid_lst = glb.strToLst(usrid);
            usrname_lst = glb.strToLst(usrnm);
            contact_lst = glb.strToLst(contact);
            count_lst = glb.strToLst(count);

            // List<String> uid_lst;
            // for (int i = 0; i < usrid_lst.length; i++) {
            //   uid_lst = usrid_lst.elementAt(i);
            // }

            // if (usrid.isEmpty() == false) {
            //   usrid_lst = glb.strToLst(usrid);
            // }
            // if (usrnm.isEmpty() == false) {
            //   usrname_lst = glb.strToLst(usrnm);
            // }
            // if (contact.isEmpty() == false) {
            //   contact_lst = glb.strToLst(contact);
            // }
            // if (count.isEmpty() == false) {
            //   count_lst = glb.strToLst(count);
            // }

            String header = "All Advertise and All Routers";
            List<String> ls = ['1', '2', '3', '4'];
            generatePDF(ls)
                .then((file) => print('PDF Generated: ${file.path}'))
                .catchError((error) => print('Error: $error'));
            print("g pdf");
            String tableStr =
                "<br><br><center><b><h1> DATEWISE DISTINCT USERS USAGE REPORT</b></h1></center>" +
                    "<table align=\"center\"  style=\"width:75%\" border=\"1\">\n" +
                    "<tr colspan=\"4\"> <td colspan=\"4\"> <center><h3>" +
                    header +
                    " </h3> </center> </td></tr>\n" +
                    "<tr>\n" +
                    "<th>SL NO</th>\n" +
                    "<th>USER NAME</th>\n" +
                    "<th>CONTACT</th>\n" +
                    "<th>AD VIEW COUNT</th>\n" +
                    "  </tr>";
            String stat = "", wb = "";
            int ton = 0, price = 0, tot = 0, sum = 0, tot1 = 0, price1 = 0;
            int epoc = 0;
            if (usrid_lst != null) {
              int c = 0;

              for (int i = 0; i < usrid_lst.length; i++) {
                c++;
                sum += int.parse(count_lst.elementAt(i).toString());
                // sum += Int.parseInt(count_lst.get(i).toString());
                tableStr += "<tr>" +
                    "<td>" +
                    c.toString() +
                    "</td>" +
                    "<td>" +
                    usrname_lst.elementAt(i).toString() +
                    "</td>" +
                    "<td>" +
                    contact_lst.elementAt(i).toString() +
                    "</td>" +
                    "<td>" +
                    count_lst.elementAt(i).toString() +
                    "</td>" +
                    "</tr>";
              }
            }
            tableStr +=
                "<tr><td colspan=\"3\"><center>TOTAL AD BURNNINGS<center></td><td>" +
                    sum.toString() +
                    "</td></tr></center></table>";

            String fileName = "datewise_user_usage.html";
            String filepath = "./DOPAReports";
            print("creating ");
            // qt.createReport(tableStr, fileName);
            try {
              // HtmlEditorKitTest htmlEditorKitTest = new HtmlEditorKitTest(qt.glbObj.filepath + "/" + fileName);
            } catch (ex) {
              // Logger.getLogger(Home_Page.class.getName()).log(Level.SEVERE, null, ex);
            }
          } catch (e) {
            print(e);
            return "Failed";
          }
        }
      }
    } catch (e) {
      print("handle Exception here::$e");
      setState(() {
        // _isLoading = false;
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
  //
}

Future<File> generatePDF(List<String> data) async {
  final pdf = pw.Document();

  // Add content to the PDF
  for (var item in data) {
    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text(item),
        );
      },
    ));
  }

  // Save the PDF to a file
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  print("path  = $tempPath");
  final output = File('${getTemporaryDirectory}/your_file_name.pdf');
  await output.writeAsBytes(await pdf.save());

  return output;
}

// //++++++
// create report

//     private void jLabel9MouseClicked(java.awt.event.MouseEvent evt) {
//         // TODO add your handling code here:
//         String fltr = "", sdat = "", edat = "", tim = "", pfid = "", rkey = "", key = "1", header = "";
//         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//         Date date1 = null, date2 = null;
//         date1 = jDate2.getDate();
//         if (date1 == null) {
//             JOptionPane.showMessageDialog(null, "Please Select Start Date");
//             return;
//         }
//         sdat = sdf.format(date1);
//         header = "For Selected Date " + sdat + ", ";
//         int row = jTable1.getSelectedRow();
//         if (row >= 0) {
//             pfid = id_lst.get(row).toString();
//         } else {
//             pfid = "NA";
//         }
//         int row1 = jTable3.getSelectedRow();
//         if (row1 >= 0) {
//             rkey = routerkey_lst.get(row1).toString();
//         } else {
//             rkey = "NA";
//         }
//         if (row < 0 && row1 < 0) {
//             key = "1";
//             header += "All Advertise and All Routers";
//         } else if (row >= 0 && row1 < 0) {
//             key = "2";
//             header += "Profile " + pname_lst.get(row).toString() + " On All Routers";
//         } else if (row < 0 && row1 >= 0) {
//             key = "3";
//             header += "All ADvertise On Router " + rkey + " ";
//         } else if (row >= 0 && row1 >= 0) {
//             key = "4";
//             header += "Profile " + pname_lst.get(row1).toString() + " On Router " + rkey + " ";
//         }

//         jsonObject = new JSONObject();
//         try {

//             jsonObject.put("key", key);
//             jsonObject.put("sdt", sdat);
//             jsonObject.put("pfid", pfid);
//             jsonObject.put("rkey", rkey);

//             String tlvStr = jsonObject.toString();
//             System.out.println("tlvStr=========>" + tlvStr);
//             postWrap.rcv_buff = "";
//             postWrap.get_generic_hook(tlvStr, 209);
//             System.out.println("postWrap.error_code================>>>>" + postWrap.error_code);
//             System.out.println("RCV BUFF================>>>>" + postWrap.rcv_buff);
//         } catch (JSONException e) {
//             e.printStackTrace();
//         }
//         if (postWrap.error_code == 101) {
//             JOptionPane.showMessageDialog(null, "NO INTERNET Connection");
//             return;
//         }

//         if (postWrap.error_code == 2) {
//             JOptionPane.showMessageDialog(null, "NO DATA FOUND");
//             return;
//         }
//         if (postWrap.error_code != 0) {
//             JOptionPane.showMessageDialog(null, "Something Went Wrong ");
//             return;
//         }
// //        "usrid":str(usrid),
// //            "usrname":str(usrname),
// //            "contact":str(contact),
// //            "count":str(count)

//         String tableStr = "<br><br><center><b><h1> DATEWISE DISTINCT USERS USAGE REPORT</b></h1></center>"
//                 + "<table align=\"center\"  style=\"width:75%\" border=\"1\">\n"
//                 + "<tr colspan=\"4\"> <td colspan=\"4\"> <center><h3>" + header + " </h3> </center> </td></tr>\n"
//                 + "<tr>\n"
//                 + "<th>SL NO</th>\n"
//                 + "<th>USER NAME</th>\n"
//                 + "<th>CONTACT</th>\n"
//                 + "<th>AD VIEW COUNT</th>\n"
//                 + "  </tr>";
//         String stat = "", wb = "";
//         int ton = 0, price = 0, tot = 0, sum = 0, tot1 = 0, price1 = 0;
//         long epoc = 0;
//         if (usrid_lst != null) {

//             int c = 0;

//             for (int i = 0; i < usrid_lst.size(); i++) {
//                 c++;
//                 sum += Integer.parseInt(count_lst.get(i).toString());
//                 tableStr += "<tr>"
//                         + "<td>" + c + "</td>"
//                         + "<td>" + usrname_lst.get(i).toString() + "</td>"
//                         + "<td>" + contact_lst.get(i).toString() + "</td>"
//                         + "<td>" + count_lst.get(i).toString() + "</td>"
//                         + "</tr>";
//             }
//         }
//         tableStr += "<tr><td colspan=\"3\"><center>TOTAL AD BURNNINGS<center></td><td>" + sum + "</td></tr></center></table>";

//         String fileName = "datewise_user_usage.html";
//         String filepath = "./DOPAReports";
//         qt.createReport(tableStr, fileName);
//         try {
//             HtmlEditorKitTest htmlEditorKitTest = new HtmlEditorKitTest(qt.glbObj.filepath + "/" + fileName);
//         } catch (URISyntaxException ex) {
//             Logger.getLogger(Home_Page.class.getName()).log(Level.SEVERE, null, ex);
//         }

//     }
//

class HtmlPage extends StatelessWidget {
  final String receivedData;

  HtmlPage({required this.receivedData});

  final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTML Page'),
        actions: [
          IconButton(
              onPressed: () {
                // htmlTOPDF("<h1>Hello, this is HTML fuy  juft content!</h1>");
              },
              icon: Icon(Icons.picture_as_pdf))
        ],
      ),
      body: WebView(
        initialUrl: 'about:blank',
        allowsInlineMediaPlayback: true,
        onWebViewCreated: (WebViewController webViewController) {
          // Load the received data into the WebView
          webViewController.loadUrl(Uri.dataFromString(
            "<h1>Hello, this is HTML fuy  juft content!</h1>",
            mimeType: 'text/html',
            encoding: Encoding.getByName('utf-8')!,
          ).toString());
        },
      ),
    );
  }
}

// htmlTOPDF(String HTMLcontent) async {
//   final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

//   final Directory? downloadsDir = await getDownloadsDirectory();

//   final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
//       HTMLcontent, downloadsDir.toString(), "HTML_PDF");
// }
