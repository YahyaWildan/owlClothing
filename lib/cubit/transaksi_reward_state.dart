part of 'transaksi_reward_cubit.dart';

abstract class TransaksiRewardState extends Equatable {
  const TransaksiRewardState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TransaksiRewardInitial extends TransaksiRewardState {}

class TransaksiRewardLoading extends TransaksiRewardState {}

class TransaksiRewardSuccess extends TransaksiRewardState {
  final List<TransaksiRewardModel> transaksiReward;
  TransaksiRewardSuccess(this.transaksiReward);
  @override
  // TODO: implement props
  List<Object?> get props => [transaksiReward];
}

class TransaksiRewardFailed extends TransaksiRewardState {
  final String error;
  TransaksiRewardFailed(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
