import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ocp/cubit/auth_cubit.dart';
import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/profile/widgets/app_menu_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is AuthFail) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.error),
          ),
        );
      } else if (state is AuthInitial) {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: defaultMargin,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    imageProfile(),
                    detailProfile(),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text('Konfirmasi'),
                              content: Text("Apakah anda yakin ingin logout?"),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("Tidak"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text("Ya"),
                                  onPressed: () {
                                    context.read<AuthCubit>().signOut();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.logout,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                pointDetail(),
                AppMenuItem(
                  onPressed: () {
                    Navigator.pushNamed(context, '/transaksi_page');
                  },
                  title: 'Daftar Transaksi',
                ),
                AppMenuItem(
                  onPressed: () {
                    Navigator.pushNamed(context, '/daftar_tukar_point');
                  },
                  title: 'Daftar Tukar Point',
                ),
                // AppMenuItem(
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/kaos_polos_page');
                //   },
                //   title: 'Ulasan',
                // ),
                // SizedBox(
                //   height: 32,
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }

  // Widget backNavigation() {
  Widget imageProfile() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.brown.shade400,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        image: DecorationImage(
          // image: NetworkImage(destinationModel.imageUrl),
          image: AssetImage('assets/default.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget detailProfile() {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is AuthSuccess) {
        return Container(
          margin: EdgeInsets.only(
            left: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.user.name,
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 18,
                ),
              ),
              Text(
                state.user.phone,
                style: blackTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 12,
                ),
              ),
              Text(
                state.user.email,
                style: blackTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      } else {
        return SizedBox();
      }
    });
  }

  Widget pointDetail() {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is AuthSuccess) {
        return Container(
          margin: EdgeInsets.only(
            top: 16,
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Point',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kWhiteColor,
                  border: Border.all(
                    color: kPrimaryColor,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${state.user.point}',
                    style: blackTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: bold,
                    ),
                  ),
                ),
              ),
              Text(
                'Aktivitas Saya',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
        );
      } else {
        return SizedBox();
      }
    });
  }
}
