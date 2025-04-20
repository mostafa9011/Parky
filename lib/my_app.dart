import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parky/features/auth/presentation/cubit/auth_cubit.dart';
import 'config/routes/page_name.dart';
import 'config/routes/route_manager.dart';
import 'config/themes/themes.dart';
import 'core/utils/widgets/di/di.dart';
import 'features/home/domain/usecases/get_parkings_use_case.dart';
import 'features/home/presentation/cubit/home_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(370, 700),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(
              sl.get<GetParkingsUseCase>(),
            ),
          ),
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          themeMode: ThemeMode.light,
          navigatorKey: RouteManager.navigatorKey,
          initialRoute: PageName.splash,
          onGenerateRoute: RouteManager.onGenerateRoute,
        ),
      ),
    );
  }
}
