import 'package:equatable/equatable.dart';
import 'package:sample_poc/utils/enum.dart';
import '../../model/post_model/post_model.dart';

class PostsStates extends Equatable{

  final ApiStatus apiStatus;
  final List<PostModel> postList;
  final String message;
  final double timeTaken;

  const PostsStates({
    this.message = '',
    this.postList = const <PostModel>[],
    this.apiStatus = ApiStatus.loading,
    this.timeTaken = 0.00,
  });

  PostsStates copyWith({ApiStatus? apiStatus,List<PostModel>? postList,String? message,double? timeTaken}){
    return PostsStates(
      message: message ?? this.message,
      postList: postList ?? this.postList,
      apiStatus: apiStatus ?? this.apiStatus,
      timeTaken: timeTaken ?? this.timeTaken
    );
  }

  @override
  //implement props
  List<Object?> get props => [apiStatus,postList,message,timeTaken];
}