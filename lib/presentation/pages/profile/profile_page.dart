import 'package:capstone_project_villa/presentation/bloc/auth/auth_bloc.dart';
import 'package:capstone_project_villa/presentation/bloc/profile/profile_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/authentication/login_page.dart';
import 'package:capstone_project_villa/presentation/pages/profile/widgets/custom_shimmer.dart';
import 'package:capstone_project_villa/presentation/pages/profile/widgets/edit_profile_page.dart';
import 'package:capstone_project_villa/presentation/pages/profile/widgets/locale_dialog.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_dialog.dart';
import 'package:capstone_project_villa/presentation/pages/profile/widgets/custom_list_tile.dart';
import 'package:capstone_project_villa/common/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../bloc/theme/theme_bloc.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(ProfileGetUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        ThemeData currentTheme =
            (state is ThemeUpdated) ? state.themeData : ThemeData.light();
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoaded) {
                  final user = state.profileResponseModel;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image
                      Container(
                        margin: const EdgeInsets.only(top: 76, bottom: 29),
                        width: 152,
                        height: 152,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              user.image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Username
                      Text(
                        user.nickname.toString(),
                        style: currentTheme == ThemeData.light()
                            ? blackTextStyle.copyWith(
                                fontSize: 24, fontWeight: semiBold)
                            : whiteTextStyle.copyWith(
                                fontSize: 24, fontWeight: semiBold),
                      ),
                      const SizedBox(height: 5.0),

                      // Email
                      Text(
                        user.email.toString(),
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                      ),

                      const SizedBox(
                        height: 10.0,
                      ),

                      // Divider
                      Divider(
                        color: white70Color,
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            // Edit Profile
                            CustomListTile(
                              icon: Iconsax.user,
                              text: 'edit_profile'.tr(),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditProfilePage(data: user),
                                  ),
                                );
                              },
                            ),

                            // Security
                            CustomListTile(
                              icon: Iconsax.frame_4,
                              text: 'security'.tr(),
                              onTap: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => const CustomDialog(),
                                );
                              },
                            ),

                            // Help
                            CustomListTile(
                              icon: Iconsax.info_circle,
                              text: 'help'.tr(),
                              onTap: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => const CustomDialog(),
                                );
                              },
                            ),

                            // Language
                            CustomListTile(
                              icon: Iconsax.translate,
                              text: 'language'.tr(),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('select_language'.tr()),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            LanguageOption(
                                              languageCode: 'en',
                                              languageNation: 'US',
                                              languageText: 'english'.tr(),
                                            ),
                                            LanguageOption(
                                              languageCode: 'id',
                                              languageNation: 'ID',
                                              languageText: 'indonesian'.tr(),
                                            ),
                                            LanguageOption(
                                              languageCode: 'es',
                                              languageNation: 'ES',
                                              languageText: 'spanish'.tr(),
                                            ),
                                            LanguageOption(
                                              languageCode: 'pt',
                                              languageNation: 'PT',
                                              languageText: 'portuguese'.tr(),
                                            ),
                                            LanguageOption(
                                              languageCode: 'ko',
                                              languageNation: 'KR',
                                              languageText: 'korean'.tr(),
                                            ),
                                            LanguageOption(
                                              languageCode: 'zh',
                                              languageNation: 'CN',
                                              languageText: 'china'.tr(),
                                            ),
                                            LanguageOption(
                                              languageCode: 'it',
                                              languageNation: 'IT',
                                              languageText: 'italia'.tr(),
                                            ),
                                            LanguageOption(
                                              languageCode: 'fr',
                                              languageNation: 'FR',
                                              languageText: 'french'.tr(),
                                            ),
                                            LanguageOption(
                                              languageCode: 'de',
                                              languageNation: 'DE',
                                              languageText: 'netherland'.tr(),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                // context.setLocale(Locale('id', 'ID'));
                              },
                            ),

                            // Dark Theme
                            CustomListTile(
                              icon: Iconsax.eye,
                              text: 'dark_theme'.tr(),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Select Theme'.tr()),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          title: Text('Light Theme'.tr()),
                                          onTap: () {
                                            _changeTheme(
                                                context, ThemeType.light);
                                          },
                                        ),
                                        ListTile(
                                          title: Text('Dark Theme'.tr()),
                                          onTap: () {
                                            _changeTheme(
                                                context, ThemeType.dark);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),

                            // Logout
                            BlocConsumer<AuthBloc, AuthState>(
                              listener: (context, state) {
                                if (state is AuthSuccessLogout) {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    LoginPage.routeName,
                                    (route) => false,
                                  );
                                }
                              },
                              builder: (context, state) {
                                return CustomListTile(
                                  icon: Iconsax.logout,
                                  text: 'logout'.tr(),
                                  onTap: () {
                                    context
                                        .read<AuthBloc>()
                                        .add(AuthLogoutEvent());
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is ProfileLoading) {
                  return ShimmerProfile();
                } else {
                  return SizedBox();
                }
              },
            ),
          )),
        );
      },
    );
  }

  void _changeTheme(BuildContext context, ThemeType themeType) {
    BlocProvider.of<ThemeBloc>(context).add(ChangeTheme(themeType));
    Navigator.pop(context);
  }
}
