import 'package:flutter/material.dart';
import 'package:masterindiatask/model/gst_user.dart';
import 'package:masterindiatask/utils/textstyles.dart';
import 'package:masterindiatask/utils/timeline.dart';

class DetailPage extends StatefulWidget {
  GstUserModel data;
  DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: Color(0xFFe4e4e4),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          alignment: Alignment.center,
          child: Container(
            height: size.height,
            width: size.width < 720 ? size.width : size.width * .4,
            color: size.width < 720 ? Colors.transparent : Colors.white.withOpacity(.65),
            padding: size.width < 720 ? null : EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                      color: Color(0xFF2da05e), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "GST Profile",
                            style: CustomTextStyles.subHeading.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "GSTIN of the Tax Payer",
                              style: CustomTextStyles.bodyText2.copyWith(color: Color(0xFFc7e5d3), fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.data.id,
                              style: CustomTextStyles.heading.copyWith(color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.data.name,
                              style: CustomTextStyles.bodyText1.copyWith(color: Colors.white),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "• Active",
                                style: CustomTextStyles.bodyText1.copyWith(color: Color(0xFF2da05e), fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            color: Colors.white,
                            child: Column(
                              children: [],
                            ),
                          ),
                          timelineData(size),
                          SizedBox(
                            height: 20,
                          ),
                          jurisdiction(),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: size.width,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Constitute of Business",
                                  style: CustomTextStyles.bodyText2.copyWith(fontWeight: FontWeight.w500, color: Color(0xFFc3c3c3)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.data.constituonofBusiness,
                                  style: CustomTextStyles.subHeading.copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: size.width,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Date of Registration",
                                      style: CustomTextStyles.bodyText2.copyWith(fontWeight: FontWeight.w500, color: Color(0xFFc3c3c3)),
                                    ),
                                    Text(
                                      "Date of Cancelation",
                                      style: CustomTextStyles.bodyText2.copyWith(fontWeight: FontWeight.w500, color: Color(0xFFc3c3c3)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.data.dateOfRegistration,
                                      style: CustomTextStyles.subHeading.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.data.dateOfCancelation,
                                      style: CustomTextStyles.subHeading.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Get Return Filing Status",
                      style: CustomTextStyles.bodyText1.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(color: Color(0xFF2da05e)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget timelineData(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Timeline(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        lineColor: Color(0xFF2da05e),
        lineGap: 0,
        gutterSpacing: 10,
        itemGap: 0,
        children: [
          Container(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Principal Place of Business",
                  style: CustomTextStyles.bodyText2.copyWith(fontWeight: FontWeight.w500, color: Color(0xFFc3c3c3)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.data.address,
                  style: CustomTextStyles.bodyText1.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Additional Place of Business",
                  style: CustomTextStyles.bodyText2.copyWith(fontWeight: FontWeight.w500, color: Color(0xFFc3c3c3)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.data.additionalPlace,
                  style: CustomTextStyles.bodyText1.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
        indicators: [
          CircleAvatar(
            backgroundColor: Color(0xFF2da05e).withOpacity(.3),
            child: Center(
              child: Icon(
                Icons.location_on,
                color: Color(0xFF2da05e),
                size: 20,
              ),
            ),
            radius: 10,
          ),
          CircleAvatar(
            backgroundColor: Color(0xFF2da05e).withOpacity(.3),
            child: Center(
              child: Icon(
                Icons.location_city,
                color: Color(0xFF2da05e),
                size: 20,
              ),
            ),
            radius: 10,
          ),
        ],
      ),
    );
  }

  Widget jurisdiction() {
    return Row(
      children: [
        Flexible(
          child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "State Jurisdiction",
                    style: CustomTextStyles.bodyText2.copyWith(fontWeight: FontWeight.w500, color: Color(0xFFc3c3c3)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.data.stateJurisdiction,
                    style: CustomTextStyles.bodyText1.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          flex: 1,
          fit: FlexFit.tight,
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Centre Jurisdiction",
                    style: CustomTextStyles.bodyText2.copyWith(fontWeight: FontWeight.w500, color: Color(0xFFc3c3c3)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.data.centreJurisdiction,
                    style: CustomTextStyles.bodyText1.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          flex: 1,
          fit: FlexFit.tight,
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Taxpayer Type",
                    style: CustomTextStyles.bodyText2.copyWith(fontWeight: FontWeight.w500, color: Color(0xFFc3c3c3)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.data.taxpayerType,
                    style: CustomTextStyles.bodyText1.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          flex: 1,
          fit: FlexFit.tight,
        ),
      ],
    );
  }
}
