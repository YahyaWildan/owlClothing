import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocp/cubit/reward_cubit.dart';
import 'package:ocp/models/reward_model.dart';
import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/product/point%20store/widgets/app_view_reward.dart';

class PointStorePage extends StatefulWidget {
  const PointStorePage({Key? key}) : super(key: key);

  @override
  State<PointStorePage> createState() => _PointStorePageState();
}

class _PointStorePageState extends State<PointStorePage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<RewardCubit>().fetchReward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RewardCubit, RewardState>(listener: (context, state) {
      if (state is RewardFail) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.error),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is RewardSuccess) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text(
              'Tukar Point',
            ),
            centerTitle: true,
            backgroundColor: kPrimaryColor,
          ),
          body: ListView(
            children: [
              produkReward(state.reward),
            ],
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  Widget produkReward(List<RewardModel> rewards) {
    return Column(
      children: rewards.map((RewardModel rewards) {
        return AppViewReward(rewards);
      }).toList(),
    );
  }
}
