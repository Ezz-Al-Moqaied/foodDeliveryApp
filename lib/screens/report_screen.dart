import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/widgets/item_reports.dart';

class ReportsScreen extends StatelessWidget {
  ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 40, bottom: 15),
              child: Row(
                children: const [
                  Text(
                    "Reports",
                    style:
                        TextStyle(color: Colors.deepOrangeAccent, fontSize: 30),
                  ),
                  Spacer(),
                  Icon(
                    Icons.report_outlined,
                    size: 35,
                    color: Colors.deepOrangeAccent,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return defaultItemReports(today: "", date: "", total: "");
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: 5),
            )
          ],
        ),
      ),
    );
  }
}
