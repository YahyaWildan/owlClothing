part of 'reward_cubit.dart';

abstract class RewardState extends Equatable {
  const RewardState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RewardInitial extends RewardState {}

class RewardLoading extends RewardState {}

class RewardSuccess extends RewardState {
  final List<RewardModel> reward;

  RewardSuccess(this.reward);

  @override
  // TODO: implement props
  List<Object?> get props => [reward];
}

class RewardFail extends RewardState {
  final String error;
  RewardFail(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
