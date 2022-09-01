import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ocp/models/transaksi_model.dart';
import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/product/transaksi/page/detail_transaksi_page.dart';
import 'package:ocp/ui/widget/app_button.dart';

class ItemTransaksi extends StatelessWidget {
  final TransaksiModel transaksi;
  const ItemTransaksi(this.transaksi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailTransaksiPage(transaksi),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
        ),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: kPrimaryColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(transaksi.produk.imageUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        transaksi.produk.namaBarang,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      Text(
                        '${transaksi.jumlahBarang} Barang',
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Belanja',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: 'IDR ',
                        decimalDigits: 0,
                      ).format(transaksi.totalBayar),
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                AppButton(
                  title: 'Beri Ulasan',
                  onPressed: () {},
                  width: 150,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
