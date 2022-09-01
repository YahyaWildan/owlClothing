import 'package:flutter/material.dart';
import 'package:ocp/models/reward_model.dart';
import 'package:ocp/models/transaksi_reward_model.dart';
import 'package:ocp/shared/theme.dart';

class ItemTransaksiReward extends StatelessWidget {
  final TransaksiRewardModel transaksiReward;
  const ItemTransaksiReward(this.transaksiReward, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailPage(destinationModel),
        //   ),
        // );
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
          border: Border.all(
            color: kPrimaryColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kode : ${transaksiReward.reward.id}',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
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
                      image: NetworkImage(transaksiReward.reward.imageUrl),
                    ),
                  ),
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
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        // destinationModel.name,
                        'Harga Point : ${transaksiReward.reward.hargaPoint}',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        // destinationModel.name,
                        'Ukuran : ${transaksiReward.reward.ukuran}',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
