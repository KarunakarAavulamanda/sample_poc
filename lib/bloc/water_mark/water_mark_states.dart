import 'package:equatable/equatable.dart';
import 'package:sample_poc/model/water_mark_model/water_mark_model.dart';
import 'package:sample_poc/utils/enum.dart';

class WaterMarkStates extends Equatable {
  final ApiStatus apiStatus;
  final List<WaterMarkModel> postList;
  final String message;

  const WaterMarkStates({
    this.message = '',
    this.postList = const <WaterMarkModel>[],
    this.apiStatus = ApiStatus.loading,
  });

  WaterMarkStates copyWith({ApiStatus? apiStatus, List<WaterMarkModel>? postList, String? message}) {
    return WaterMarkStates(
      message: message ?? this.message,
      postList: postList ?? this.postList,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [apiStatus, postList, message];
}
