import 'package:bloc/bloc.dart';
import 'package:sample_poc/bloc/users/users_event.dart';
import 'package:sample_poc/bloc/users/users_state.dart';
import 'package:sample_poc/repositary/users_repository/users_repository.dart';
import 'package:sample_poc/utils/enum.dart';


class UsersBloc extends Bloc<UsersEvent, UsersStates> {

  UsersRepository usersRepository = UsersRepository();

  UsersBloc() : super(const UsersStates()) {
    on<UsersFetched>(fetchUsersApi);
    on<UsersRefresh>(refreshUsersApi);
  }

  void fetchUsersApi(UsersFetched event, Emitter<UsersStates> emit)async{
    emit(state.copyWith(apiStatus: ApiStatus.loading,message: '',postList: [],timeTaken: 0.00));
    await usersRepository.fetchUsers().then((value){
      emit(state.copyWith(
        apiStatus: ApiStatus.success,
        postList: value['data'],
        timeTaken: value['timeTaken'],
      ));

    }).onError((error,stackTrace) {
      // print(error.toString() + 'aa');
      // print(stackTrace.toString() + 'bbr');
      emit(state.copyWith(apiStatus: ApiStatus.failed,message: error.toString(),timeTaken: 0.00));
    });
  }
  void refreshUsersApi(UsersRefresh event, Emitter<UsersStates> emit)async{
    emit(state.copyWith(apiStatus: ApiStatus.refresh,message: '',postList: [],timeTaken: 0.00));
    await usersRepository.fetchUsers().then((value){
      emit(state.copyWith(
        apiStatus: ApiStatus.success,
        postList: value['data'],
        timeTaken: value['timeTaken'],
      ));

    }).onError((error,stackTrace) {
      // print(error.toString() + 'aa');
      // print(stackTrace.toString() + 'bbr');
      emit(state.copyWith(apiStatus: ApiStatus.failed,message: error.toString(),timeTaken: 0.00));
    });
  }

}
