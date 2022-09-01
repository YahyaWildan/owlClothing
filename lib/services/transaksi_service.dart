import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ocp/models/transaksi_model.dart';

class TransaksiService {
  CollectionReference _transaksiReference =
      FirebaseFirestore.instance.collection('transaksi');

  Future<void> createTransaksi(TransaksiModel transaksi) async {
    try {
      _transaksiReference.add({
        'produk': transaksi.produk.toJson(),
        'ukuran': transaksi.ukuran,
        'jumlahBarang': transaksi.jumlahBarang,
        'totalBayar': transaksi.totalBayar,
        'point': transaksi.point,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransaksiModel>> fetchTransaksi() async {
    try {
      QuerySnapshot result = await _transaksiReference.get();

      //banyak data bikin list
      List<TransaksiModel> transaksi = result.docs.map(
        (e) {
          return TransaksiModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return transaksi;
    } catch (e) {
      throw e;
    }
  }
}
