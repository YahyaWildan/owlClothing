import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocp/cubit/transaksi_reward_cubit.dart';
import 'package:ocp/models/reward_model.dart';
import 'package:ocp/models/transaksi_model.dart';
import 'package:ocp/models/transaksi_reward_model.dart';
import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/product/checkout/widgets/itemBookingDetail.dart';
import 'package:ocp/ui/widget/app_button.dart';

class CheckoutDetailRewardPage extends StatelessWidget {
  final TransaksiRewardModel transaksiReward;
  const CheckoutDetailRewardPage(this.transaksiReward, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor.withOpacity(0.98),
      appBar: AppBar(
        title: Text(
          'Checkout Reward',
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // detailPemesan(),
            detailPesanan(),
            bookingNow(),
          ],
        ),
      ),
    );
  }

  Widget detailPesanan() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //foto
          headerPhoto(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Detail',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          ItemBookingDetails(
            title: 'Harga Point',
            valueTitle: transaksiReward.reward.hargaPoint.toString(),
            valueColor: kBlackColor,
          ),
          ItemBookingDetails(
            title: 'jumlah',
            valueTitle: transaksiReward.reward.jumlah.toString(),
            valueColor: kBlackColor,
          ),
          ItemBookingDetails(
            title: 'Ukuran',
            valueTitle: transaksiReward.reward.ukuran,
            valueColor: kBlackColor,
          ),
        ],
      ),
    );
  }

  Widget bookingNow() {
    return BlocConsumer<TransaksiRewardCubit, TransaksiRewardState>(
        listener: (context, state) {
      if (state is TransaksiRewardSuccess) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/main',
          (route) => false,
        );
      } else if (state is TransaksiRewardFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.error),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is TransaksiRewardLoading) {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 30),
          child: CircularProgressIndicator(),
        );
      }
      return Container(
        margin: EdgeInsets.all(16),
        child: AppButton(
          title: 'Tukar Sekarang',
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('Konfirmasi'),
                  content: Text(
                      "Apakah anda yakin ingin menukar point dengan ${transaksiReward.reward.namaBarang}?"),
                  actions: [
                    CupertinoDialogAction(
                      child: Text("Tidak"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text("Ya"),
                      onPressed: () {
                        context
                            .read<TransaksiRewardCubit>()
                            .createTransaksiReward(transaksiReward);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      );
    });
  }

  Widget headerPhoto() {
    return Row(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(transaksiReward.reward.imageUrl),
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // destinationModel.name,
                transaksiReward.reward.namaBarang,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
