import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ocp/models/produk_model.dart';
import 'package:ocp/services/produk_service.dart';

part 'produk_state.dart';

class ProdukCubit extends Cubit<ProdukState> {
  ProdukCubit() : super(ProdukInitial());

  void fetchProduk() async {
    try {
      emit(ProdukLoading());
      List<ProdukModel> produks = await ProdukService().fetchProduk();
      emit(ProdukSuccess(produks));
    } catch (e) {
      emit(ProdukFail(e.toString()));
    }
  }
}
