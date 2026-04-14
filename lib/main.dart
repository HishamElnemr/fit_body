import 'package:fb_fitbody/core/constants/app_constants.dart';
import 'package:fb_fitbody/core/routes/app_routes.dart';
import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/core/services/getit_services.dart';
import 'package:fb_fitbody/core/services/hive_serices.dart';
import 'package:fb_fitbody/core/services/supbase_initialization.dart';
import 'package:fb_fitbody/core/theme/app_theme.dart';
import 'package:fb_fitbody/core/theme/cubit/change_theme_cubit.dart';
import 'package:fb_fitbody/core/theme/cubit/change_theme_state.dart';
import 'package:fb_fitbody/core/utils/shared_prefs.dart';
import 'package:fb_fitbody/features/cart/domain/repos/cart_repo.dart';
import 'package:fb_fitbody/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fb_fitbody/features/product/data/models/hive_product_model.dart';
import 'package:fb_fitbody/features/product/presentation/cubit/hive_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeSupabase();
  setup();

  await Hive.initFlutter();
  Hive.registerAdapter(HiveProductModelAdapter());
  await Hive.openBox<HiveProductModel>(hiveBoxName);
  await SharedPrefs.init();
  runApp(const QuickMart());
}

class QuickMart extends StatelessWidget {
  const QuickMart({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ChangeThemeCubit()),
        BlocProvider(
          create: (context) => CartCubit(cartRepo: getIt<CartRepo>()),
        ),
        BlocProvider(
          create: (context) => HiveCubit(hiveServices: getIt<HiveServices>()),
        ),
      ],
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: SharedPrefs.getBool('isDark')
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: RoutesName.splash,
          );
        },
      ),
    );
  }
}
