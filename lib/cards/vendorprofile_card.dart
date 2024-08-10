import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vendor/Model/VendorProfileModel.dart';
import 'package:new_vendor/dopa_glb.dart' as glb;
import '../lst_Ads01.dart';

class vendorprofilecard extends StatefulWidget {
  const vendorprofilecard({super.key, required this.datamodel});
  final VendorProfileModel datamodel;

  @override
  State<vendorprofilecard> createState() => _vendorprofilecardState();
}

class _vendorprofilecardState extends State<vendorprofilecard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          print('Tapped card');
          glb.AdID = widget.datamodel.id;
          glb.AdNm = widget.datamodel.pname;
          glb.cur_trgt = widget.datamodel.tgt_cnt;
          glb.sts = widget.datamodel.status;
          glb.AdLink = widget.datamodel.link;
          glb.Ads_link = widget.datamodel.AdsLink;

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LstAds01()));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Profile Name: ${widget.datamodel.pname}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'ID: ${widget.datamodel.id}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Uid: ${widget.datamodel.uid}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Hit Count: ${widget.datamodel.hc}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Approval: ${widget.datamodel.isaprvd}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Status: ${widget.datamodel.status}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Targeted Count : ${widget.datamodel.tgt_cnt}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Remaining Count: ${widget.datamodel.rem_cnt}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
