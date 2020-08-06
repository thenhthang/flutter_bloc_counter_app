import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable{
  CounterEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class IncrementEvent extends CounterEvent{
  final int number;
  IncrementEvent({this.number});
  @override
  // TODO: implement props
  List<Object> get props => [number];
}
class DecrementEvent extends CounterEvent{
  final int number;
  DecrementEvent({this.number});
  @override
  // TODO: implement props
  List<Object> get props => [number];
}