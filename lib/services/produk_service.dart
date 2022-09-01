import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ocp/models/produk_model.dart';

class ProdukService {
  CollectionReference _produkRef =
      FirebaseFirestore.instance.collection('produk');

  //method
  Future<List<ProdukModel>> fetchProduk() async {
    try {
      QuerySnapshot result = await _produkRef.get();

      //banyak data bikin list
      List<ProdukModel> produks = result.docs.map(
        (e) {
          return ProdukModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return produks;
    } catch (e) {
      throw e;
    }
  }
}
