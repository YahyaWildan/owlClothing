import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocp/models/reward_model.dart';
import 'package:ocp/services/reward_service.dart';

part 'reward_state.dart';

class RewardCubit extends Cubit<RewardState> {
  RewardCubit() : super(RewardInitial());

  void fetchReward() async {
    try {
      emit(RewardLoading());
      List<RewardModel> rewards = await RewardService().fetchReward();
      emit(RewardSuccess(rewards));
    } catch (e) {
      emit(RewardFail(e.toString()));
    }
  }
}
