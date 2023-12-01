import 'package:PointCollector/widgets/buy_tab.dart';
import 'package:PointCollector/widgets/overview_tab.dart';
import 'package:flutter/material.dart';
import 'package:PointCollector/models/business_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';
import '../widgets/redeem_tab.dart';

class DetailScreen extends ConsumerWidget {
  late final Business business;
  late final Product product;

  DetailScreen({required this.business});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.blue, width: 3),
              ),
            ),
            labelColor: Colors.blue, // Set the color of the selected tab label
            unselectedLabelColor:
                Colors.grey, // Set the color of unselected tab labels
            labelStyle: TextStyle(
                fontSize: 16,
                fontWeight:
                    FontWeight.bold), // Set the style of the selected tab label
            unselectedLabelStyle: TextStyle(
                fontSize: 14), // Set the style of unselected tab labels
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Buy'),
              Tab(text: 'Redeem'),
            ],
          ),
          Column(
            children: [
              Image.asset(
                business.image,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                height: 150,
              ),
              SizedBox.fromSize(size: Size(0, 20)),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text("Point Count: ",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    Center(
                        child: Text("${business.points}",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue))),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                OverviewTab(business: business),
                BuyTab(business: business),
                RedeemTab(business: business),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
