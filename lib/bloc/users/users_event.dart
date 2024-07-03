import 'package:equatable/equatable.dart';

abstract class UsersEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class UsersFetched extends UsersEvent{}

class UsersRefresh extends UsersEvent{}