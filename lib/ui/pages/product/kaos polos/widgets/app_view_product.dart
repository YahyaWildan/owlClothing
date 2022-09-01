import 'package:flutter/material.dart';
import 'package:ocp/shared/theme.dart';

class AppViewProduct extends StatelessWidget {
  const AppViewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail_product');
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    // destinationModel.imageUrl,
                    'assets/image_tshirt_black.png',
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 8,
                right: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      'Kaos Polos Hitam ',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_right_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
