import 'package:flutter/material.dart';

import '../api/gst_api.dart';
import '../data/gst_data.dart';
import '../routes/routes.dart';
import '../utils/textstyles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool toggle = false;
  String gstNo = "";
  bool showLoader = false;
  bool errorText = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFe5e5e5),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(5),
          child: Container(
            width: size.width < 720 ? size.width : size.width * .4,
            height: size.height,
            padding: EdgeInsets.all(4),
            color: Colors.white,
            child: SingleChildScrollView(
              physics: size.height < 350 ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFF2da05e),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Select the type for",
                          style: CustomTextStyles.bodyText1.copyWith(color: Colors.white),
                        ),
                        Text(
                          "GST Number search tool",
                          style: CustomTextStyles.heading.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        toggleButton(size),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: search(size),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: sampleGST(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget toggleButton(Size size) {
    return LayoutBuilder(builder: (_, constr) {
      return InkWell(
        onTap: () => setState(() => toggle = !toggle),
        child: Container(
          width: constr.maxWidth,
          decoration: BoxDecoration(color: Color(0xFF1a884b), borderRadius: BorderRadius.circular(25)),
          height: 50,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Stack(
            children: [
              Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 150),
                    width: toggle ? constr.maxWidth * .5 - 10 : 0,
                    height: 10,
                    color: Colors.transparent,
                  ),
                  Container(
                    height: 40,
                    width: constr.maxWidth * .5,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Center(
                      child: Text(
                        "Search GST Number",
                        style: CustomTextStyles.bodyText1.copyWith(color: toggle ? Colors.white : Color(0xFF93cda9), fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    child: Center(
                      child: Text(
                        "GST Return Status",
                        style: CustomTextStyles.bodyText1.copyWith(color: toggle ? Color(0xFF93cda9) : Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget search(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter GST Number",
          style: CustomTextStyles.bodyText1.copyWith(color: Color(0xFFe6e6e6)),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          decoration: BoxDecoration(color: Color(0xFFf2f2f2)),
          child: TextField(
            onChanged: (e) {
              setState(() {
                gstNo = e.toUpperCase();
                errorText = false;
              });
            },
            style: CustomTextStyles.bodyText1.copyWith(color: Colors.grey),
            maxLines: 1,
            cursorColor: Color(0xFFe2e2e2),
            decoration: InputDecoration(
              hintText: "Ex - GST12345",
              hintStyle: CustomTextStyles.bodyText1.copyWith(color: Color(0xFFe2e2e2)),
              border: InputBorder.none,
              hoverColor: Color(0xFFe2e2e2),
            ),
          ),
        ),
        errorText
            ? Container(
                child: Text(
                  "Please enter a valid GSTIN",
                  style: CustomTextStyles.bodyText1.copyWith(color: Colors.red.shade700),
                ),
              )
            : Container(),
        SizedBox(
          height: 30,
        ),
        showLoader
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2da05e)),
                ),
              )
            : InkWell(
                onTap: () async {
                  setState(() {
                    showLoader = true;
                  });
                  var data = await Api().getGstUser(gstNo);
                  setState(() {
                    showLoader = false;
                  });
                  print(data);
                  if (data != null) {
                    Navigator.pushNamed(context, Routes.viewDetailsPage, arguments: data);
                  } else {
                    setState(() {
                      errorText = true;
                    });
                  }
                },
                child: Container(
                  height: 50,
                  color: gstNo.length == 0 ? Color(0xFF2da05e).withOpacity(.5) : Color(0xFF2da05e),
                  child: Center(
                    child: Text(
                      "Search",
                      style: CustomTextStyles.subHeading.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  Widget sampleGST() {
    List gstins = gstUserDataMap.keys.toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sample GST Numbers",
          style: CustomTextStyles.subHeading,
        ),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: gstins.length,
            itemBuilder: (c, i) {
              return Text(
                gstins[i],
                style: CustomTextStyles.bodyText1,
              );
            })
      ],
    );
  }
}
