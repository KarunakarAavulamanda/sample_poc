import 'package:bloc/bloc.dart';
import 'package:sample_poc/bloc/water_mark/water_mark_events.dart';
import 'package:sample_poc/bloc/water_mark/water_mark_states.dart';
import 'package:sample_poc/repositary/water_mark_repositary/water_mark_repositary.dart';
import 'package:sample_poc/utils/enum.dart';

class WaterMarkBloc extends Bloc<WaterEvent, WaterMarkStates> {
 WaterMarkRepositary waterMarkRepositary = WaterMarkRepositary();

  WaterMarkBloc() : super(const WaterMarkStates()) {
    on<WatermarkFetched>(_fetchWatermarks);
  }

  Future<void> _fetchWatermarks(WatermarkFetched event, Emitter<WaterMarkStates> emit) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading, message: '', postList: []));
    try {
      final response = await waterMarkRepositary.fetchComments();
      emit(state.copyWith(
        apiStatus: ApiStatus.success,
        postList: response['data'],
      ));
    } catch (error) {
      emit(state.copyWith(apiStatus: ApiStatus.failed, message: error.toString()));
    }
  }


}
