import 'package:doodleblue/model/business_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../controller/dashboard_detail_controller.dart';
import 'components/bigcardimage.dart';
import 'components/description.dart';

class DashboardDetails extends StatefulWidget {
  DashboardDetails({super.key, required this.id, required this.name});

  final String id;
  final String name;

  @override
  _DashboardDetailsState createState() => _DashboardDetailsState();
}

class _DashboardDetailsState extends StateMVC<DashboardDetails> {
  final DashBoardDetailsController _dashBoardDetailsController =
      DashBoardDetailsController();

  _DashboardDetailsState() : super(DashBoardDetailsController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _dashBoardDetailsController.globalkey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: SvgPicture.asset("assets/icons/search.svg"),
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     icon: SvgPicture.asset("assets/icons/cart.svg"),
        //     onPressed: () {},
        //   ),
        //   const SizedBox(width: defaultPadding / 2)
        // ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FutureBuilder(
                  future: _dashBoardDetailsController.getBusiness(widget.id),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.done:
                        BusinessDetails da =
                            _dashBoardDetailsController.businessDetails!;
                        return SizedBox(
                          height: size.height,
                          child: Stack(
                            children: <Widget>[
                              BigCardImageSlide(
                                images: da.photos,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    EdgeInsets.only(top: size.height * 0.23),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[Description(product: da)],
                                ),
                              ),

                              // ProductTitleWithImage(product: da)
                            ],
                          ),
                        );

                      default:
                        return const Center(child: CircularProgressIndicator());
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
