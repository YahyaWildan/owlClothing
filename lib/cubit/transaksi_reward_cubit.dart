import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ocp/models/transaksi_reward_model.dart';
import 'package:ocp/services/transaksi_reward_service.dart';

part 'transaksi_reward_state.dart';

class TransaksiRewardCubit extends Cubit<TransaksiRewardState> {
  TransaksiRewardCubit() : super(TransaksiRewardInitial());

  void createTransaksiReward(TransaksiRewardModel reward) async {
    try {
      emit(TransaksiRewardLoading());
      await TransaksiRewardService().createTransaksiReward(reward);
      emit(TransaksiRewardSuccess([]));
    } catch (e) {
      emit(TransaksiRewardFailed(e.toString()));
    }
  }

  void fetchTransaksiReward() async {
    try {
      emit(TransaksiRewardLoading());
      List<TransaksiRewardModel> reward =
          await TransaksiRewardService().fetchTransaksiReward();
      emit(TransaksiRewardSuccess(reward));
    } catch (e) {
      emit(TransaksiRewardFailed(e.toString()));
    }
  }
}
