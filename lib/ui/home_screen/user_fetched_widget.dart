import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_poc/bloc/users/users_bloc.dart';
import 'package:sample_poc/bloc/users/users_event.dart';
import 'package:sample_poc/bloc/users/users_state.dart';
import 'package:sample_poc/widgets/water_mark_widget.dart';
import 'package:sample_poc/utils/enum.dart';

class UserFetchedWidget extends StatefulWidget {
  const UserFetchedWidget({super.key});

  @override
  State<UserFetchedWidget> createState() => _UserFetchedWidgetState();
}

class _UserFetchedWidgetState extends State<UserFetchedWidget> {
  @override
  void initState() {
    super.initState();
    context.read<UsersBloc>().add(UsersFetched());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<UsersBloc, UsersStates>(
          builder: (context, state) {
            double height = constraints.maxHeight;
            double width = constraints.maxWidth;
            int noOfWatermarks = 0;
            noOfWatermarks = getNoOfWatermarks(height as int);
            if (state.apiStatus == ApiStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.apiStatus == ApiStatus.failed) {
              return Center(child: Text(state.message));
            } else {
              return watermark(
                numberOfWatermarks: noOfWatermarks,
                horizontalMultipleWatermarks: true,
                multipleWatermarks: true,
                watermarkText: state.postList.isNotEmpty
                    ? state.postList.first.username.toString()
                    : '',
                height: height,
                width: width,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 100.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _showDataPopup(state.postList);
                                },
                                child: const Text('Service Request'),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<UsersBloc>().add(UsersRefresh());
                              },
                              icon: const Icon(Icons.refresh),
                            ),
                            Text('${state.timeTaken} sec'),
                          ],
                        ),
                        DataTable(
                          columns: const [
                            DataColumn(label: Text('Id')),
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('FName')),
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('LastName')),
                          ],
                          rows: state.postList.map((user) {
                            return DataRow(cells: [
                              DataCell(Text(user.id.toString())),
                              DataCell(Text(user.name.toString())),
                              DataCell(Text(user.username.toString())),
                              DataCell(Text(user.email.toString())),
                              DataCell(Text(user.username.toString())),
                            ]);
                          }).toList(),
                        ),
                      ],
                    ),
                    if (state.apiStatus == ApiStatus.refresh)
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }

  void _showDataPopup(List<dynamic> dataList) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width * 0.5;
        int noOfWatermarks = getNoOfWatermarks(height as int);
        return BlocBuilder<UsersBloc, UsersStates>(builder: (context, state) {
          return AlertDialog(
            insetPadding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.7),
            title: const Text('Service Request'),
            content: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.3, // Adjust the width as needed
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Add watermark here
                    watermark(
                      height: height,
                      width: width,
                      multipleWatermarks: true,
                      watermarkText: state.postList.isNotEmpty
                          ? state.postList.first.username.toString()
                          : '',
                      horizontalMultipleWatermarks: false,
                      numberOfWatermarks: noOfWatermarks,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          final item = dataList[index];
                          return ListTile(
                            title: Text(item.email.toString()),
                            subtitle: Text(item.name.toString()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
      },
    );
  }
}
