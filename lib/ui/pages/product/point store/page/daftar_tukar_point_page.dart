import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocp/cubit/transaksi_reward_cubit.dart';
import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/product/point%20store/widgets/item_transaksi_reward.dart';

class DaftarTukarPointPage extends StatefulWidget {
  const DaftarTukarPointPage({Key? key}) : super(key: key);

  @override
  State<DaftarTukarPointPage> createState() => _DaftarTukarPointPageState();
}

class _DaftarTukarPointPageState extends State<DaftarTukarPointPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TransaksiRewardCubit>().fetchTransaksiReward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransaksiRewardCubit, TransaksiRewardState>(
      builder: (context, state) {
        if (state is TransaksiRewardLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransaksiRewardSuccess) {
          if (state.transaksiReward.length == 0) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Daftar Tukar Point',
                ),
                backgroundColor: kPrimaryColor,
              ),
              body: Center(
                child: Text(
                  'Anda Belum Melakukan Tukar Point',
                  style: blackTextStyle,
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: kBackgroundColor,
              appBar: AppBar(
                title: Text(
                  'Daftar Tukar Point',
                ),
                backgroundColor: kPrimaryColor,
              ),
              body: ListView.builder(
                itemCount: state.transaksiReward.length,
                itemBuilder: (context, index) {
                  return ItemTransaksiReward(state.transaksiReward[index]);
                },
              ),
            );
          }
        }
        return Center(
          child: Text(
            state.toString(),
          ),
        );
      },
    );
  }
}
