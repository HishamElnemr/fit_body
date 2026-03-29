import 'package:bloc/bloc.dart';

class CartCounterCubit extends Cubit<double> {
  CartCounterCubit({required double initialTotalPrice})
    : super(initialTotalPrice);

  void updateTotalPrice(int quantity, double price) {
    emit(quantity * price);
  }
}
