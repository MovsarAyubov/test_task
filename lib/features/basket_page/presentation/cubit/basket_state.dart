// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../../core/models/order_model.dart';

class BasketState extends Equatable {
  final List<OrderModel> basket;
  const BasketState({
    this.basket = const [],
  });
  @override
  List<Object?> get props => [basket];

  BasketState copyWith({
    List<OrderModel>? basket,
  }) {
    return BasketState(
      basket: basket ?? this.basket,
    );
  }
}
