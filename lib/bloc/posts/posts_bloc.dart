import 'package:bloc/bloc.dart';
//import 'package:equatable/equatable.dart';
//import 'package:meta/meta.dart';
import 'package:sample_poc/bloc/posts/posts_events.dart';
import 'package:sample_poc/bloc/posts/posts_states.dart';
import 'package:sample_poc/repositary/post_repositary/post_reposiyary.dart';
import 'package:sample_poc/utils/enum.dart';

class PostsBloc extends Bloc<PostsEvent, PostsStates> {
  PostRepository postRepository = PostRepository();

  PostsBloc() : super(PostsStates()) {
    on<PostFetched>(fetchPostApi);
    on<PostRefresh>(refreshPostApi);
  }

  void fetchPostApi(PostFetched event, Emitter<PostsStates> emit) async {
    emit(state.copyWith(
        apiStatus: ApiStatus.Loading,
        message: '',
        postList: [],
        timeTaken: 0.00));
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
        apiStatus: ApiStatus.Success,
        postList: value['data'],
        timeTaken: value['timeTaken'],
      ));
    }).onError((error, stackTrace) {
      print(error.toString() + 'aa');
      print(stackTrace.toString() + 'bbr');
      emit(state.copyWith(
          apiStatus: ApiStatus.Failed,
          message: error.toString(),
          timeTaken: 0.00));
    });
  }

  void refreshPostApi(PostRefresh event, Emitter<PostsStates> emit) async {
    emit(state.copyWith(
        apiStatus: ApiStatus.Refresh,
        message: '',
        postList: [],
        timeTaken: 0.00));
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
        apiStatus: ApiStatus.Success,
        postList: value['data'],
        timeTaken: value['timeTaken'],
      ));
    }).onError((error, stackTrace) {
      print(error.toString() + 'aa');
      print(stackTrace.toString() + 'bbr');
      emit(state.copyWith(
          apiStatus: ApiStatus.Failed,
          message: error.toString(),
          timeTaken: 0.00));
    });
  }
}
