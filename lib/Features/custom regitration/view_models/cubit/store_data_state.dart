part of 'store_data_cubit.dart';

@immutable
abstract class StoreDataState {}

class StoreDataInitial extends StoreDataState {}

class StoreDataILoading extends StoreDataState {}

class StoreDataSuccess extends StoreDataState {}

class StoreDataFailure extends StoreDataState {
  final String errMessage;

  StoreDataFailure({required this.errMessage});
}
