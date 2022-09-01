import 'package:equatable/equatable.dart';

class ProdukModel extends Equatable {
  final String id;
  final String namaBarang;
  final String deskripsi;
  final String imageUrl;
  final String bahan;
  final String gayaPakaian;
  final String kondisi;
  final double rating;
  final int harga;
  final int point;

  ProdukModel({
    required this.id,
    this.namaBarang = '',
    this.deskripsi = '',
    this.imageUrl = '',
    this.bahan = '',
    this.gayaPakaian = '',
    this.kondisi = '',
    this.rating = 0.0,
    this.harga = 0,
    this.point = 0,
  });

  //method
  factory ProdukModel.fromJson(String id, Map<String, dynamic> json) =>
      ProdukModel(
        id: id,
        namaBarang: json['namaBarang'],
        deskripsi: json['deskripsi'],
        imageUrl: json['imageUrl'],
        bahan: json['bahan'],
        gayaPakaian: json['gayaPakaian'],
        kondisi: json['kondisi'],
        rating: json['rating'].toDouble(),
        harga: json['harga'],
        point: json['point'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'namaBarang': namaBarang,
        'deskripsi': deskripsi,
        'imageUrl': imageUrl,
        'bahan': bahan,
        'gayaPakaian': gayaPakaian,
        'kondisi': kondisi,
        'rating': rating,
        'harga': harga,
        'point': point,
      };

  @override
  List<Object?> get props => [
        id,
        namaBarang,
        deskripsi,
        imageUrl,
        bahan,
        gayaPakaian,
        kondisi,
        rating,
        harga,
        point,
      ];
}
