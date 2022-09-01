import 'package:equatable/equatable.dart';
import 'package:ocp/models/reward_model.dart';

class TransaksiRewardModel extends Equatable {
  final String id;
  final RewardModel reward;

  TransaksiRewardModel({
    this.id = '',
    required this.reward,
  });

  factory TransaksiRewardModel.fromJson(String id, Map<String, dynamic> json) =>
      TransaksiRewardModel(
        reward: RewardModel.fromJson(json['reward']['id'], json['reward']),
        id: id,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        reward,
      ];
}
