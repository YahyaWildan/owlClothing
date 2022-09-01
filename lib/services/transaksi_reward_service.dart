import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ocp/models/transaksi_reward_model.dart';

class TransaksiRewardService {
  CollectionReference _transaksiRewardReference =
      FirebaseFirestore.instance.collection('transaksiReward');

  Future<void> createTransaksiReward(
      TransaksiRewardModel transaksiReward) async {
    try {
      _transaksiRewardReference.add({
        'reward': transaksiReward.reward.toJson(),
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransaksiRewardModel>> fetchTransaksiReward() async {
    try {
      QuerySnapshot result = await _transaksiRewardReference.get();

      //banyak data bikin list
      List<TransaksiRewardModel> transaksi = result.docs.map(
        (e) {
          return TransaksiRewardModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return transaksi;
    } catch (e) {
      throw e;
    }
  }
}
