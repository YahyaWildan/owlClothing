import 'package:equatable/equatable.dart';

class RewardModel extends Equatable {
  final String id;
  final int hargaPoint;
  final int jumlah;
  final String imageUrl;
  final String namaBarang;
  final String ukuran;

  RewardModel({
    required this.id,
    this.hargaPoint = 0,
    this.jumlah = 0,
    this.imageUrl = '',
    this.namaBarang = '',
    this.ukuran = '',
  });

  factory RewardModel.fromJson(String id, Map<String, dynamic> json) =>
      RewardModel(
        id: id,
        namaBarang: json['namaBarang'],
        imageUrl: json['imageUrl'],
        jumlah: json['jumlah'],
        hargaPoint: json['hargaPoint'],
        ukuran: json['ukuran'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'namaBarang': namaBarang,
        'imageUrl': imageUrl,
        'jumlah': jumlah,
        'hargaPoint': hargaPoint,
        'ukuran': ukuran,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        namaBarang,
        imageUrl,
        jumlah,
        hargaPoint,
        ukuran,
      ];
}
