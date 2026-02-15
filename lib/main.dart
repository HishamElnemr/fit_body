import 'package:fb_fitbody/core/routes/app_routes.dart';
import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/core/services/getit_services.dart';
import 'package:fb_fitbody/core/theme/app_theme.dart';
import 'package:fb_fitbody/core/theme/cubit/change_theme_cubit.dart';
import 'package:fb_fitbody/core/theme/cubit/change_theme_state.dart';
import 'package:fb_fitbody/core/utils/shared_prefs.dart';
import 'package:fb_fitbody/features/cart/domain/repos/cart_repo.dart';
import 'package:fb_fitbody/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
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
