import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocp/cubit/transaksi_cubit.dart';
import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/product/transaksi/widgets/item_transaksi.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({Key? key}) : super(key: key);

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TransaksiCubit>().fetchTransaksi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransaksiCubit, TransaksiState>(
      builder: (context, state) {
        if (state is TransaksiLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransaksiSuccess) {
          if (state.transaksi.length == 0) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Transaksi',
                ),
                backgroundColor: kPrimaryColor,
              ),
              body: Center(
                child: Text(
                  'Anda Belum Melakukan Transaksi',
                  style: blackTextStyle,
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: kBackgroundColor,
              appBar: AppBar(
                title: Text(
                  'Transaksi',
                ),
                backgroundColor: kPrimaryColor,
              ),
              body: ListView.builder(
                itemCount: state.transaksi.length,
                itemBuilder: (context, index) {
                  return ItemTransaksi(state.transaksi[index]);
                },
              ),
            );
          }
        }
        return Center(
          child: Text(
            state.toString(),
          ),
        );
      },
    );
  }
}
