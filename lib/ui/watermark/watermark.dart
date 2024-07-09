import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_poc/bloc/water_mark/water_mark_bloc.dart';
import 'package:sample_poc/bloc/water_mark/water_mark_events.dart';
import 'package:sample_poc/bloc/water_mark/water_mark_states.dart';
import 'package:sample_poc/utils/enum.dart';
import 'package:sample_poc/widgets/water_mark_widget.dart';

class WatermarkFetchedWidgets extends StatefulWidget {
  const WatermarkFetchedWidgets({super.key});

  @override
  State<WatermarkFetchedWidgets> createState() =>
      _WatermarkFetchedWidgetsState();
}

class _WatermarkFetchedWidgetsState extends State<WatermarkFetchedWidgets> {
  @override
  void initState() {
    super.initState();
    context.read<WaterMarkBloc>().add(WatermarkFetched());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<WaterMarkBloc, WaterMarkStates>(
          builder: (context, state) {
            double height = constraints.maxHeight;
            double width = constraints.maxWidth;
            int noOfWatermarks = getNoOfWatermarks(height as int);
            if (state.apiStatus == ApiStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.apiStatus == ApiStatus.failed) {
              return Center(child: Text(state.message));
            } else {
              return watermark(
                height: height,
                width: width,
                numberOfWatermarks: noOfWatermarks,
                horizontalMultipleWatermarks: true,
                multipleWatermarks: true,
                watermarkText: state.postList.first.userId.toString(),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        DataTable(
                          columns: const [
                            DataColumn(label: Text('Id')),
                            DataColumn(label: Text('Title')),
                            DataColumn(label: Text('body')),
                          ],
                          rows: state.postList.take(10).map((post) {
                            return DataRow(cells: [
                              DataCell(Text(post.id.toString())),
                              DataCell(Text(post.title.toString())),
                              DataCell(Text(post.body.toString())),
                            ]);
                          }).toList(),
                        ),
                        if (state.apiStatus == ApiStatus.refresh)
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            child: const Center(
                                child: CircularProgressIndicator()),
                          ),
                      ],
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
}
