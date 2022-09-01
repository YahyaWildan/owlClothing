import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ocp/models/produk_model.dart';
import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/product/booking/booking_detail_page.dart';
import 'package:ocp/ui/pages/product/widgets/app_spesifikasi_produk.dart';
import 'package:ocp/ui/widget/app_button.dart';

class DetailProductPage extends StatelessWidget {
  final ProdukModel produk;
  const DetailProductPage(this.produk, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Detail Produk',
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(context),
            Positioned(
              bottom: 16,
              right: 16,
              child: AppButton(
                title: 'Booking',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingDetailPage(produk),
                    ),
                  );
                },
                width: 170,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget backgroundImage() {
    return Container(
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(produk.imageUrl),
          // image: AssetImage('assets/image_tshirt_red.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget customShadow() {
    return Container(
      width: double.infinity,
      height: 214,
      margin: const EdgeInsets.only(top: 236),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kWhiteColor.withOpacity(0),
            Colors.black.withOpacity(0.95),
          ],
        ),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      child: Column(
        children: [
          //Note : title
          Container(
            margin: EdgeInsets.only(top: 256),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        produk.namaBarang,
                        style: whiteTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      produk.rating.toString(),
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Note: Description
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Note : Spesifikasi Produk
                Text(
                  'Spesifikasi Produk',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                AppSpesifikasiProduk(
                    title: 'Kondisi', valueTitle: produk.kondisi),
                AppSpesifikasiProduk(title: 'Bahan', valueTitle: produk.bahan),
                AppSpesifikasiProduk(
                    title: 'Gaya Pakaian', valueTitle: produk.gayaPakaian),
                SizedBox(
                  height: 6,
                ),
                //Note About

                Text(
                  'Deskripsi Produk',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "${produk.namaBarang} \n\n ${produk.deskripsi}}",
                  style: blackTextStyle.copyWith(
                    height: 2,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ),
          //Note: Price & Book Button
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 30,
            ),
            width: double.infinity,
            child: Row(
              children: [
                // Price
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(produk.harga),
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                // Note Book
              ],
            ),
          ),
        ],
      ),
    );
  }
}
