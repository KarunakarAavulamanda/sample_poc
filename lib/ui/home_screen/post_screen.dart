import 'package:flutter/material.dart';
import 'package:sample_poc/ui/home_screen/post_fetched_widget.dart';
import 'package:sample_poc/ui/home_screen/stepper_service_request_widget.dart';
import 'package:sample_poc/ui/home_screen/user_fetched_widget.dart';

import '../counter_screen/counter_screen.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ICICI Sample POC'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First Row for Account Information Details and Table
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 40% Account Information Details
                Container(
                  width: (MediaQuery.of(context).size.width * 30) / 100,
                  height: 626,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    border: Border.all(color: Colors.black),
                  ),
                  child: const PostFetchedWidget(),
                ),
                const SizedBox(
                  width: 10,
                ), // Space between Account Information Details and Table
                Container(
                  height: 578,
                  width: (MediaQuery.of(context).size.width * 68) / 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: const UserFetchedWidget(),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 350,
              width: (MediaQuery.of(context).size.width * 100) / 100,
              decoration: BoxDecoration(
                color: Colors.green[100],
                border: Border.all(color: Colors.black),
              ),
              child: const MainPage(),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 350,
              width: (MediaQuery.of(context).size.width * 100) / 100,
              decoration: BoxDecoration(
                color: Colors.green[100],
                border: Border.all(color: Colors.black),
              ),
              child: const CounterScreen(),
            )

          ],
        ),
      ),
    );
  }
}
