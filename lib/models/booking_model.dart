import 'package:equatable/equatable.dart';
import 'package:ocp/models/produk_model.dart';
import 'package:ocp/models/user_model.dart';

class BookingModel extends Equatable {
  final ProdukModel produk;
  final int jmlBarang;
  final String ukuranBarang;
  final int totalHarga;

  BookingModel({
    required this.produk,
    this.jmlBarang = 0,
    this.ukuranBarang = '',
    this.totalHarga = 0,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        produk,
        jmlBarang,
        ukuranBarang,
        totalHarga,
      ];
}
