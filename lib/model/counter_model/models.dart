import 'package:equatable/equatable.dart';

class Counter extends Equatable {
  final int value;

  const Counter({this.value = 0});

  Counter copyWith({int? value}) {
    return Counter(value: value ?? this.value);
  }

  Map<String, dynamic> toJson() {
    return {'value': value};
  }

  factory Counter.fromJson(Map<String, dynamic> json) {
    return Counter(value: json['value']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [value];
}
