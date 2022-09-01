import 'package:flutter_bloc/flutter_bloc.dart';

class SizeCubit extends Cubit<List<String>> {
  SizeCubit() : super([]);

  void selectSize(String id) {
    print('prev size : $state');
    if (!isSelected(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    print('new size : $state');
    emit(List.from(state));
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);
    print('index $index');
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }
}
