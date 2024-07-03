import 'package:bloc/bloc.dart';
//import 'package:equatable/equatable.dart';
//import 'package:meta/meta.dart';
import 'package:sample_poc/bloc/users/users_event.dart';
import 'package:sample_poc/bloc/users/users_state.dart';
import 'package:sample_poc/repositary/users_repository/users_repository.dart';
import 'package:sample_poc/utils/enum.dart';


class UsersBloc extends Bloc<UsersEvent, UsersStates> {

  UsersRepository usersRepository = UsersRepository();

  UsersBloc() : super(UsersStates()) {
    on<UsersFetched>(fetchUsersApi);
    on<UsersRefresh>(refreshUsersApi);
  }

  void fetchUsersApi(UsersFetched event, Emitter<UsersStates> emit)async{
    emit(state.copyWith(apiStatus: ApiStatus.Loading,message: '',postList: [],timeTaken: 0.00));
    await usersRepository.fetchUsers().then((value){
      emit(state.copyWith(
        apiStatus: ApiStatus.Success,
        postList: value['data'],
        timeTaken: value['timeTaken'],
      ));

    }).onError((error,stackTrace) {
      print(error.toString() + 'aa');
      print(stackTrace.toString() + 'bbr');
      emit(state.copyWith(apiStatus: ApiStatus.Failed,message: error.toString(),timeTaken: 0.00));
    });
  }
  void refreshUsersApi(UsersRefresh event, Emitter<UsersStates> emit)async{
    emit(state.copyWith(apiStatus: ApiStatus.Refresh,message: '',postList: [],timeTaken: 0.00));
    await usersRepository.fetchUsers().then((value){
      emit(state.copyWith(
        apiStatus: ApiStatus.Success,
        postList: value['data'],
        timeTaken: value['timeTaken'],
      ));

    }).onError((error,stackTrace) {
      print(error.toString() + 'aa');
      print(stackTrace.toString() + 'bbr');
      emit(state.copyWith(apiStatus: ApiStatus.Failed,message: error.toString(),timeTaken: 0.00));
    });
  }

}
