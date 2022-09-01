import 'package:equatable/equatable.dart';
import 'package:ocp/models/produk_model.dart';

class TransaksiModel extends Equatable {
  final String id;
  final ProdukModel produk;
  final String ukuran;
  final int jumlahBarang;
  final int totalBayar;
  final int point;

  TransaksiModel({
    this.id = '',
    required this.produk,
    this.ukuran = '',
    this.jumlahBarang = 0,
    this.totalBayar = 0,
    this.point = 0,
  });

  factory TransaksiModel.fromJson(String id, Map<String, dynamic> json) =>
      TransaksiModel(
        produk: ProdukModel.fromJson(json['produk']['id'], json['produk']),
        id: id,
        ukuran: json['ukuran'],
        jumlahBarang: json['jumlahBarang'],
        totalBayar: json['totalBayar'],
        point: json['point'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        produk,
        ukuran,
        jumlahBarang,
        totalBayar,
        point,
      ];
}
