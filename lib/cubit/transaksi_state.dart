part of 'transaksi_cubit.dart';

abstract class TransaksiState extends Equatable {
  const TransaksiState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TransaksiInitial extends TransaksiState {}

class TransaksiLoading extends TransaksiState {}

class TransaksiSuccess extends TransaksiState {
  final List<TransaksiModel> transaksi;
  TransaksiSuccess(this.transaksi);
  @override
  // TODO: implement props
  List<Object?> get props => [transaksi];
}

class TransaksiFailed extends TransaksiState {
  final String error;
  TransaksiFailed(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
