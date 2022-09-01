import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ocp/cubit/transaksi_cubit.dart';
import 'package:ocp/models/transaksi_model.dart';
import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/product/checkout/widgets/itemBookingDetail.dart';
import 'package:ocp/ui/widget/app_button.dart';

class CheckoutPage extends StatelessWidget {
  final TransaksiModel transaksi;
  const CheckoutPage(this.transaksi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor.withOpacity(0.98),
      appBar: AppBar(
        title: Text(
          'Checkout',
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

  Widget bookingNow() {
    return BlocConsumer<TransaksiCubit, TransaksiState>(
        listener: (context, state) {
      if (state is TransaksiSuccess) {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      } else if (state is TransaksiFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.error),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is TransaksiLoading) {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 30),
          child: CircularProgressIndicator(),
        );
      }
      return Container(
        margin: EdgeInsets.all(16),
        child: AppButton(
            title: 'Booking Now',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text('Konfirmasi'),
                    content: Text(
                        "Apakah anda yakin ingin membeli ${transaksi.produk.namaBarang}?"),
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
                              .read<TransaksiCubit>()
                              .createTransaksi(transaksi);
                        },
                      ),
                    ],
                  );
                },
              );
            }),
      );
    });
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
            'Booking Details',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          ItemBookingDetails(
              title: 'Jumlah',
              valueTitle: transaksi.jumlahBarang.toString(),
              valueColor: kBlackColor),
          ItemBookingDetails(
              title: 'Ukuran',
              valueTitle: transaksi.ukuran,
              valueColor: kBlackColor),
          ItemBookingDetails(
              title: 'point',
              valueTitle: transaksi.point.toString(),
              valueColor: kBlackColor),
          ItemBookingDetails(
            title: 'Total',
            valueTitle: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaksi.totalBayar),
            valueColor: kPrimaryColor,
          ),
        ],
      ),
    );
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
              image: NetworkImage(transaksi.produk.imageUrl),
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
                transaksi.produk.namaBarang,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/icon_star.png',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    // destinationModel.rating.toString(),
                    transaksi.produk.rating.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
