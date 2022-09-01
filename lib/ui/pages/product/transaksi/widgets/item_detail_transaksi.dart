import 'package:flutter/material.dart';
import 'package:ocp/models/transaksi_model.dart';
import 'package:ocp/ui/pages/product/booking/widgets/app_item_detail.dart';

class ItemDetailTransaksi extends StatelessWidget {
  final TransaksiModel transaksi;
  const ItemDetailTransaksi(this.transaksi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(transaksi.produk.imageUrl),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 16,
              left: 32,
              right: 32,
            ),
            child: Column(
              children: [
                AppItemDetail(title: 'Id Transaksi', value: transaksi.id),
                SizedBox(
                  height: 6,
                ),
                AppItemDetail(
                    title: 'Nama Barang', value: transaksi.produk.namaBarang),
                SizedBox(
                  height: 6,
                ),
                AppItemDetail(
                    title: 'Jumlah', value: transaksi.jumlahBarang.toString()),
                SizedBox(
                  height: 6,
                ),
                AppItemDetail(title: 'Ukuran', value: transaksi.ukuran),
                SizedBox(
                  height: 6,
                ),
                AppItemDetail(
                    title: 'Total Harga', value: 'Rp. ${transaksi.totalBayar}'),
                SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
