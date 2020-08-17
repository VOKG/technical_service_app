import 'package:flutter/material.dart';
import 'package:technical_service_app/Qrcode/qr_barcode_screen.dart';
import 'package:technical_service_app/UI/ExpansionPanelWidget.dart';
import 'DataTableWidget.dart';

class BottomTabbarExample extends StatefulWidget {
  const BottomTabbarExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomTabbarExampleState();
}

class _BottomTabbarExampleState extends State<BottomTabbarExample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  var kTabPages = <Widget>[
    ExpansionPanelWidget(),
    QRBarcodeScreen(),
  DataTableWidget(),
  ];
  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.assignment), text: 'Tab1'),
    Tab(icon: Icon(Icons.beenhere), text: 'Tab2'),
    Tab(icon: Icon(Icons.settings), text: 'Tab3'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: TabBarView(
        children: kTabPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.black54,
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}