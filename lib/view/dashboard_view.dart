import 'package:doodleblue/model/business_model.dart' as f;
import 'package:doodleblue/utils/constant.dart';
import 'package:doodleblue/view/dashboard_detail.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../controller/dashboard_controller.dart';
import 'components/businesscardui.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends StateMVC<DashboardView> {
  final DashBoardController _dashBoardController = DashBoardController();

  _DashboardViewState() : super(DashBoardController());

  @override
  void initState() {
    super.initState();
    _dashBoardController.scrollController.addListener(scrolllistener);
    fetchDataoflist();
  }

  void fetchDataoflist() async {
    await _dashBoardController.getBusiness(_dashBoardController.currentpage);
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> scrolllistener() async {
    if (_dashBoardController.scrollController.position.pixels ==
        _dashBoardController.scrollController.position.maxScrollExtent) {
      setState(() {
        _dashBoardController.isLoadingMode = true;
      });
      _dashBoardController.currentpage = _dashBoardController.currentpage + 1;
      await _dashBoardController.getBusiness(_dashBoardController.currentpage);
      setState(() {
        _dashBoardController.isLoadingMode = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _dashBoardController.globalkey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "Doodle Blue",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: (_dashBoardController.welcomeBusiness?.businesses.isNotEmpty ??
                false)
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _dashBoardController.isLoadingMode
                    ? _dashBoardController.welcomeBusiness!.businesses.length +
                        1
                    : _dashBoardController.welcomeBusiness!.businesses.length,
                controller: _dashBoardController.scrollController,
                itemBuilder: (context, index) {
                  // print(_dashBoardController.welcomeBusiness!.businesses[index]);
                  if (index <
                      _dashBoardController.welcomeBusiness!.businesses.length) {
                    return Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Card(
                        elevation: 2,
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: BusinessCardUI(
                              images: [
                                _dashBoardController.welcomeBusiness!
                                        .businesses[index].imageUrl ??
                                    ''
                              ],
                              name: _dashBoardController.welcomeBusiness!
                                      .businesses[index].name ??
                                  '',
                              rating: _dashBoardController.welcomeBusiness!
                                      .businesses[index].rating ??
                                  0,
                              numOfRating: _dashBoardController.welcomeBusiness!
                                      .businesses[index].reviewCount ??
                                  0,
                              distance: _dashBoardController.welcomeBusiness!
                                      .businesses[index].distance ??
                                  0,
                              address: [
                                _dashBoardController.welcomeBusiness!
                                        .businesses[index].location?.address1 ??
                                    '',
                                _dashBoardController.welcomeBusiness!
                                        .businesses[index].location?.city ??
                                    '',
                                _dashBoardController.welcomeBusiness!
                                        .businesses[index].location?.country ??
                                    ''
                              ],
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DashboardDetails(
                                      id: _dashBoardController.welcomeBusiness!
                                              .businesses[index].id ??
                                          '',
                                      name: _dashBoardController
                                              .welcomeBusiness!
                                              .businesses[index]
                                              .name ??
                                          '',
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })
            : Center(child: CircularProgressIndicator()));
  }
}
