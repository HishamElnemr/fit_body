import 'package:bloc/bloc.dart';

class QuantityCubit extends Cubit<int> {
  QuantityCubit() : super(1);

  void update(int quantity) => emit(quantity);

  void reset() => emit(1);

  int getQuantity() => state;
}
