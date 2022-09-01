import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ocp/cubit/size_cubit.dart';
import 'package:ocp/models/produk_model.dart';
import 'package:ocp/models/transaksi_model.dart';
import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/product/booking/widgets/app_size_item.dart';
import 'package:ocp/ui/pages/product/checkout/page/checkout_page.dart';
import 'package:ocp/ui/widget/app_button.dart';

class BookingDetailPage extends StatelessWidget {
  final ProdukModel produk;
  const BookingDetailPage(this.produk, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor.withOpacity(0.98),
      appBar: AppBar(
        title: Text(
          'Pilih Ukuran',
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // detailPemesan(),
            SizedBox(
              height: 6,
            ),
            detailBarang(),
            btnPesanSekarang(),
          ],
        ),
      ),
    );
  }

  Widget detailBarang() {
    return BlocBuilder<SizeCubit, List<String>>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            16,
          ),
          color: kWhiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(produk.imageUrl),
                        // image: AssetImage('assets/image_tshirt_black.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          produk.namaBarang,
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 16,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              'Jumlah',
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: light,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              '1 Buah',
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: light,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              'Ukuran',
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: light,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text('S'),
                            AppSizeItem(
                              id: 'S',
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text('M'),
                            AppSizeItem(
                              id: 'M',
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text('L'),
                            AppSizeItem(
                              id: 'L',
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text('XL'),
                            AppSizeItem(
                              id: 'XL',
                            ),
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              'Total ',
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: light,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Flexible(
                              child: Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                ).format(produk.harga),
                                style: primaryTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                ),
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget btnPesanSekarang() {
    return BlocBuilder<SizeCubit, List<String>>(builder: (context, state) {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        padding: EdgeInsets.all(16),
        child: AppButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutPage(
                  TransaksiModel(
                    produk: produk,
                    jumlahBarang: 1,
                    ukuran: state.join(''),
                    point: 50,
                    totalBayar: produk.harga,
                  ),
                ),
              ),
            );
          },
          title: 'Continue to Checkout',
        ),
      );
    });
  }
}
