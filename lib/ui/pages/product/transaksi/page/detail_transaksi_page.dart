import 'package:flutter/material.dart';
import 'package:ocp/models/transaksi_model.dart';
import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/product/transaksi/widgets/item_detail_transaksi.dart';

class DetailTransaksiPage extends StatelessWidget {
  final TransaksiModel transaksi;
  const DetailTransaksiPage(this.transaksi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor.withOpacity(0.98),
      appBar: AppBar(
        title: Text(
          'Detail Transaksi',
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        children: [
          ItemDetailTransaksi(transaksi),
        ],
      ),
    );
  }
}
