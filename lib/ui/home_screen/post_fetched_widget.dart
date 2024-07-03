import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_poc/bloc/posts/posts_bloc.dart';
import 'package:sample_poc/bloc/posts/posts_events.dart';
import 'package:sample_poc/bloc/posts/posts_states.dart';
import 'package:sample_poc/widgets/water_mark_widget.dart';
import 'package:sample_poc/utils/enum.dart';

class PostFetchedWidget extends StatefulWidget {
  const PostFetchedWidget({Key? key}) : super(key: key);

  @override
  State<PostFetchedWidget> createState() => _PostFetchedWidgetState();
}

class _PostFetchedWidgetState extends State<PostFetchedWidget> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        int noOfWatermarks = getNoOfWatermarks(height);

        return BlocBuilder<PostsBloc, PostsStates>(
          builder: (context, state) {
            if (state.apiStatus == ApiStatus.Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.apiStatus == ApiStatus.Failed) {
              return Center(child: Text(state.message));
            } else {
              return Watermark(
                height: height,
                width: width,
                numberOfWatermarks: noOfWatermarks,
                horizontalMultipleWatermarks: false,
                multipleWatermarks: true,
                watermarkText: '23456',
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<PostsBloc>().add(PostRefresh());
                              },
                              icon: Icon(Icons.refresh),
                            ),
                            Text('${state.timeTaken} sec'),
                          ],
                        ),
                        DataTable(
                          columns: const [
                            DataColumn(label: Text('Id')),
                            DataColumn(label: Text('Email')),
                          ],
                          rows: state.postList.map((post) {
                            return DataRow(cells: [
                              DataCell(Text(post.id.toString())),
                              DataCell(Text(post.email.toString())),
                            ]);
                          }).toList(),
                        ),
                      ],
                    ),
                    if (state.apiStatus == ApiStatus.Refresh)
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(child: CircularProgressIndicator()),
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
