import 'package:bloc/bloc.dart';

class CartCounterCubit extends Cubit<double> {
  CartCounterCubit() : super(0);


  void updateTotalPrice(int quantity, double price) {
    emit(quantity * price);
  }
}
