import 'package:flutter_bloc/flutter_bloc.dart';

class PageCubit extends Cubit<int> {
  PageCubit() : super(0);

  //Method
  void setPage(int newPage) {
    emit(newPage);
  }
}
