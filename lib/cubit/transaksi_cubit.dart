import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ocp/models/transaksi_model.dart';
import 'package:ocp/services/transaksi_service.dart';

part 'transaksi_state.dart';

class TransaksiCubit extends Cubit<TransaksiState> {
  TransaksiCubit() : super(TransaksiInitial());

  //method
  void createTransaksi(TransaksiModel transaksi) async {
    try {
      emit(TransaksiLoading());
      await TransaksiService().createTransaksi(transaksi);
      emit(TransaksiSuccess([]));
    } catch (e) {
      emit(TransaksiFailed(e.toString()));
    }
  }

  void fetchTransaksi() async {
    try {
      emit(TransaksiLoading());
      List<TransaksiModel> transaksi =
          await TransaksiService().fetchTransaksi();
      emit(TransaksiSuccess(transaksi));
    } catch (e) {
      emit(TransaksiFailed(e.toString()));
    }
  }
}
