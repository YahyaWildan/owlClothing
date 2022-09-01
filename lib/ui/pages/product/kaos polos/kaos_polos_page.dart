import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/product/kaos%20polos/widgets/app_view_product.dart';
import 'package:ocp/ui/widget/app_cardview_product.dart';

class KaosPolosPage extends StatelessWidget {
  const KaosPolosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kaos Polos',
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                AppViewProduct(),
                AppViewProduct(),
                AppViewProduct(),
                AppViewProduct(),
                AppViewProduct(),
                AppViewProduct(),
                AppViewProduct(),
                AppViewProduct(),
                AppViewProduct(),
                AppViewProduct(),
                AppViewProduct(),
                AppViewProduct(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
