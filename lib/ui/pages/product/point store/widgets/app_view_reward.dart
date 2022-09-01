import 'package:flutter/material.dart';
import 'package:ocp/models/reward_model.dart';
import 'package:ocp/models/transaksi_reward_model.dart';
import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/product/point%20store/page/checkout_detail_reward.dart';
import 'package:ocp/ui/widget/app_button.dart';

class AppViewReward extends StatelessWidget {
  final RewardModel reward;
  const AppViewReward(this.reward, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckoutDetailRewardPage(
              TransaksiRewardModel(reward: reward),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // image: NetworkImage(destinationModel.imageUrl),
                  image: NetworkImage(reward.imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // destinationModel.name,
                    reward.namaBarang,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    // destinationModel.name,
                    'Harga Point : ${reward.hargaPoint.toString()}',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            // AppButton(
            //   width: 70,
            //   title: 'Tukar',
            //   onPressed: () {
            //     showDialog(
            //       context: context,
            //       builder: (context) {
            //         return CupertinoAlertDialog(
            //           title: Text('Konfirmasi'),
            //           content: Text(
            //               "Apakah anda yakin ingin melanjutkan menukar point dengan ${reward.namaBarang}?"),
            //           actions: [
            //             CupertinoDialogAction(
            //               child: Text("Tidak"),
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               },
            //             ),
            //             CupertinoDialogAction(
            //               child: Text("Ya"),
            //               onPressed: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) =>
            //                          CheckoutDetailRewardPage(destinationModel),
            //                   ),
            //                 );
            //               },
            //             ),
            //           ],
            //         );
            //       },
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
