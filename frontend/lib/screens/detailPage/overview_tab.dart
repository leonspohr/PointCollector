import 'package:PointCollector/models/business_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverviewTab extends ConsumerWidget {
  final Business business;

  OverviewTab({required this.business});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      return Column(
        children: [
        SizedBox.fromSize(size: Size(0, 20)),
        Center(child: Text(business.name, style: TextStyle(fontSize: 25,
            fontWeight: FontWeight.bold))),
        SizedBox.fromSize(size: Size(0, 20)),
        Center(child: Text(business.address, style: TextStyle(fontSize: 20))),
        Center(child: Text(business.zipCode, style: TextStyle(fontSize: 20))),
      ],
    );
  }
}
