import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:capstone_project_villa/presentation/bloc/auth/auth_bloc.dart';
import 'package:capstone_project_villa/presentation/bloc/bookmark/bookmark_bloc.dart';
import 'package:capstone_project_villa/presentation/bloc/detail/detail_vila_bloc.dart';
import 'package:capstone_project_villa/presentation/bloc/history/history_bloc.dart';
import 'package:capstone_project_villa/presentation/bloc/home/home_bloc.dart';
import 'package:capstone_project_villa/presentation/bloc/profile/profile_bloc.dart';
import 'package:capstone_project_villa/presentation/bloc/search/search_bloc.dart';
import 'package:capstone_project_villa/presentation/bloc/theme/theme_bloc.dart';
import 'package:capstone_project_villa/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/authentication/login_page.dart';
import 'package:capstone_project_villa/presentation/pages/authentication/register_page.dart';
import 'package:capstone_project_villa/presentation/pages/authentication/widgets/forgot_page.dart';
import 'package:capstone_project_villa/presentation/pages/bookmark/bookmark_page.dart';
import 'package:capstone_project_villa/presentation/pages/category/category_vila_page.dart';
import 'package:capstone_project_villa/presentation/pages/detail/detail_page.dart';
import 'package:capstone_project_villa/presentation/pages/history/history_page.dart';
import 'package:capstone_project_villa/presentation/pages/home/home_page.dart';
import 'package:capstone_project_villa/presentation/pages/navbar/bottom_navbar.dart';
import 'package:capstone_project_villa/presentation/pages/profile/profile_page.dart';
import 'package:capstone_project_villa/presentation/pages/search/search_page.dart';
import 'package:capstone_project_villa/presentation/pages/splash/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  initializeDateFormatting('id_ID', null).then((value) async {
    runApp(
      EasyLocalization(
        supportedLocales: [
          Locale('en', 'US'),
          Locale('id', 'ID'),
          Locale('es', 'ES'),
          Locale('pt', 'PT'),
          Locale('ko', 'KR'),
          Locale('zh', 'CN'),
          Locale('it', 'IT'),
          Locale('fr', 'FR'),
          Locale('de', 'DE'),
        ],
        path: 'assets/i18n',
        // fallbackLocale: Locale('en', 'US'),
        // startLocale: Locale('en', 'US'),
        child: MyApp(sharedPreferences: sharedPreferences),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  final SharedPreferences? sharedPreferences;

  const MyApp({Key? key, this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(sharedPreferences!),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider<DetailVilaBloc>(
          create: (context) => DetailVilaBloc(),
        ),
        BlocProvider<BookmarkBloc>(
          create: (context) => BookmarkBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(),
        ),
        BlocProvider<HistoryBloc>(
          create: (context) => HistoryBloc(),
        ),
        BlocProvider<TransactionBloc>(
          create: (context) => TransactionBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Azure Voyage',
            theme: state is ThemeUpdated ? state.themeData : ThemeData.light(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => const SplashScreen(),
              LoginPage.routeName: (context) => const LoginPage(),
              RegisterPage.routeName: (context) => const RegisterPage(),
              BottomNavbarPage.routeName: (context) => const BottomNavbarPage(),
              HomePage.routeName: (context) => const HomePage(),
              ProfilePage.routeName: (context) => const ProfilePage(),
              SearchPage.routeName: (context) => const SearchPage(),
              DetailPage.routeName: (context) => DetailPage(
                  id: ModalRoute.of(context)!.settings.arguments as int),
              ForgotPage.routeName: (context) => ForgotPage(),
              CategoryVilaPage.routeName: (context) => CategoryVilaPage(),
              HistoryPage.routeName: (context) => HistoryPage(),
              BookmarkPage.routeName: (context) => BookmarkPage(),
            },
          );
        },
      ),
    );
  }
}
