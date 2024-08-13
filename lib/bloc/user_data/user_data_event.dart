part of 'user_data_bloc.dart';

abstract class UserDataEvent {}

class PlaceOrder extends UserDataEvent {
  final OrderModel orderData;
  final BuildContext context;

  PlaceOrder(this.orderData, this.context);
}
