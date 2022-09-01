import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocp/cubit/auth_cubit.dart';
import 'package:ocp/cubit/page_cubit.dart';
import 'package:ocp/cubit/produk_cubit.dart';
import 'package:ocp/cubit/reward_cubit.dart';
import 'package:ocp/cubit/size_cubit.dart';
import 'package:ocp/cubit/transaksi_cubit.dart';
import 'package:ocp/cubit/transaksi_reward_cubit.dart';
import 'package:ocp/shared/theme.dart';
import 'package:ocp/ui/pages/home/home_page.dart';
import 'package:ocp/ui/pages/main/main_page.dart';
import 'package:ocp/ui/pages/product/kaos%20polos/kaos_polos_page.dart';
import 'package:ocp/ui/pages/product/point%20store/page/daftar_tukar_point_page.dart';
import 'package:ocp/ui/pages/product/transaksi/page/detail_transaksi_page.dart';
import 'package:ocp/ui/pages/product/transaksi/page/transaksi_page.dart';
import 'package:ocp/ui/pages/splash%20screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:ocp/ui/pages/user/login/login_page%20.dart';
import 'package:ocp/ui/pages/user/register/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ProdukCubit()),
        BlocProvider(create: (context) => SizeCubit()),
        BlocProvider(create: (context) => TransaksiCubit()),
        BlocProvider(create: (context) => RewardCubit()),
        BlocProvider(create: (context) => TransaksiRewardCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/main': (context) => MainPage(),
          '/kaos_polos_page': (context) => KaosPolosPage(),
          '/transaksi_page': (context) => TransaksiPage(),
          '/daftar_tukar_point': (context) => DaftarTukarPointPage(),
        },
      ),
    );
  }
}
