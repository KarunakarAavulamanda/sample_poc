import 'package:equatable/equatable.dart';

abstract class WaterEvent extends Equatable {
  @override
  List<Object?> get props => [];

}

class WatermarkFetched extends WaterEvent {}
