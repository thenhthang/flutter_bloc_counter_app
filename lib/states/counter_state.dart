import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable{
  CounterState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class CounterStateInitial extends CounterState{}
class CounterStateLoading extends CounterState{}
class CounterStateSuccess extends CounterState{
  final int number;
  CounterStateSuccess({this.number});
  @override
  // TODO: implement props
  List<Object> get props => [number];
}