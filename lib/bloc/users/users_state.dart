import 'package:equatable/equatable.dart';
import 'package:sample_poc/model/users_model/users_model.dart';
import 'package:sample_poc/utils/enum.dart';
//import '../../model/post_model/post_model.dart';

class UsersStates extends Equatable{

  final ApiStatus apiStatus;
  final List<UsersModel> postList;
  final String message;
  final double timeTaken;

  const UsersStates({
    this.message = '',
    this.postList = const <UsersModel>[],
    this.apiStatus = ApiStatus.loading,
    this.timeTaken = 0.00,
  });

  UsersStates copyWith({ApiStatus? apiStatus,List<UsersModel>? postList,String? message,double? timeTaken}){
    return UsersStates(
        message: message ?? this.message,
        postList: postList ?? this.postList,
        apiStatus: apiStatus ?? this.apiStatus,
        timeTaken: timeTaken ?? this.timeTaken
    );
  }

  @override
  // TODOimplement props
  List<Object?> get props => [apiStatus,postList,message,timeTaken];
}