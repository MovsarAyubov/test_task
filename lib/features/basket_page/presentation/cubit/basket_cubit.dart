import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/features/dishes_page/domain/entities/dish_entity.dart';

import '../../../../core/models/order_model.dart';
import 'basket_state.dart';

@LazySingleton()
class BasketCubit extends Cubit<BasketState> {
  BasketCubit() : super(const BasketState());

  int returnAmount(int id) {
    return state.basket.firstWhere((element) => element.id == id).orderAmount;
  }

  bool isInBasket(int id) {
    return state.basket.any((element) => element.id == id);
  }

  void addToBasket(DishEntity dish) {
    var newItemInBasket = OrderModel(
        id: dish.id,
        name: dish.name,
        price: dish.price,
        weight: dish.weight,
        description: dish.description,
        imageUrl: dish.imageUrl,
        tegs: dish.tegs);
    var basket = List<OrderModel>.from(state.basket)..add(newItemInBasket);
    emit(BasketState(basket: basket));
  }

  void deleteFromBasket(int id) {
    var basket = List<OrderModel>.from(state.basket)
      ..removeWhere((item) => item.id == id);
    emit(BasketState(basket: basket));
  }

  void increaseAmountInBasket(int id) {
    var basketList = List<OrderModel>.from(state.basket).map((item) {
      return item.id == id
          ? item.copyWith(orderAmount: item.orderAmount + 1)
          : item;
    }).toList();
    emit(BasketState(basket: basketList));
  }

  void decrementAmountInBasket(int id) {
    final basketList = List<OrderModel>.from(state.basket).map((item) {
      if (item.id == id) {
        return item.copyWith(orderAmount: item.orderAmount - 1);
      } else {
        return item;
      }
    }).toList();
    emit(BasketState(basket: basketList));
    if (state.basket.firstWhere((element) => element.id == id).orderAmount ==
        0) {
      deleteFromBasket(id);
    }
  }

  int basketCost() {
    int cost = 0;
    for (var item in state.basket) {
      cost = cost + (item.orderAmount * item.price);
    }
    return cost;
  }
}
