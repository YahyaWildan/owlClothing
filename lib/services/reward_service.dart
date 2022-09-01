import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ocp/models/reward_model.dart';

class RewardService {
  CollectionReference _rewardReference =
      FirebaseFirestore.instance.collection('reward');

  Future<List<RewardModel>> fetchReward() async {
    try {
      QuerySnapshot result = await _rewardReference.get();

      //banyak data bikin list
      List<RewardModel> rewards = result.docs.map(
        (e) {
          return RewardModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return rewards;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createTransaksiReward(RewardModel reward) async {
    try {
      _rewardReference.add({
        'id': reward.id,
        'namaBarang': reward.namaBarang,
        'imageUrl': reward.imageUrl,
        'hargaPoint': reward.hargaPoint,
        'jumlah': reward.jumlah,
        'ukuran': reward.ukuran,
      });
    } catch (e) {
      throw e;
    }
  }
}
