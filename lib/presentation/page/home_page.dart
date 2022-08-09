import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sales/presentation/page/webview.dart';

import '../utils/constants.dart';
import '../utils/utility.dart';
import '../wigets/home_page_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey webViewKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));
  late PullToRefreshController pullToRefreshController;

  double progress = 0;
  final urlController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                SvgPicture.asset("assets/svg/rectangle_orange.svg",
                    width: size.width, fit: BoxFit.fill),
                SvgPicture.asset("assets/svg/Vector.svg",
                    width: size.width, fit: BoxFit.fill),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Utility.customeSizebox(height: size.height * 0.08),
                        Image.asset(
                          "assets/png/ps_logo_new.png",
                          scale: 1.2,
                          alignment: Alignment.center,
                        ),
                        Utility.customeSizebox(height: size.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TabCardView(
                                svgicon: "assets/svg/Group2.svg",
                                size: size,
                                lable: ConstantsData.shoplable,
                                iconData: Icons.shopping_cart_outlined,
                                onPressed: () async {
                                  navigationWebPage(context,
                                      url: ConstantsData.urlShopPage);
                                }),
                            TabCardView(
                                svgicon: "assets/svg/Group1.svg",
                                size: size,
                                lable: ConstantsData.myacclable,
                                iconData: Icons.account_circle_outlined,
                                onPressed: (() {
                                  navigationWebPage(context,
                                      url: ConstantsData.urlmyAccount);
                                })),
                          ],
                        ),
                        Utility.customeSizebox(height: 30),
                        Text(ConstantsData.fproductlable,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: ConstantsData.whitecolor,
                                    fontSize: 16,
                                    height: 1.5,
                                    fontWeight: FontWeight.w700))),
                        Utility.customeSizebox(height: size.height * 0.04),
                        Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: urlController,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Enter Value";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      color: ConstantsData.blackcommancolor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 1.5),
                                  contentPadding: const EdgeInsets.all(16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  hintText: ConstantsData.searchHintLbl,
                                  hintStyle: TextStyle(
                                      fontSize: 15,
                                      color: ConstantsData.blackcommancolor,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: ConstantsData.primaryorangcolor,
                                    size: 35,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white),
                            )),
                        Utility.customeSizebox(height: size.height * 0.03),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: ConstantsData.blackcommancolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: Size(size.width, 50)),
                            onPressed: () {
                              final form = _formKey.currentState;
                              if (form != null) {
                                if (form.validate()) {
                                  final urlserch =
                                      ConstantsData.urlFindproduct +
                                          urlController.text;
                                  navigationWebPage(context, url: urlserch);
                                }
                              }
                            },
                            child: Text(
                              ConstantsData.serchlbl,
                              style: TextStyle(
                                  color: ConstantsData.whitecolor,
                                  fontSize: 15,
                                  height: 1.5,
                                  fontWeight: FontWeight.w700),
                            ))
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigationWebPage(BuildContext context, {required String url}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebviewPage(url: url),
        ));
  }
}
