import 'package:capstone_project_villa/data/datasources/local/auth_local_datasource.dart';
import 'package:capstone_project_villa/data/models/response/profile_response_model.dart';
import 'package:capstone_project_villa/presentation/bloc/profile/profile_bloc.dart';
import 'package:capstone_project_villa/presentation/pages/authentication/login_page.dart';
import 'package:capstone_project_villa/presentation/pages/profile/widgets/edit_profile_page.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_dialog.dart';
import 'package:capstone_project_villa/presentation/pages/profile/widgets/custom_list_tile.dart';
import 'package:capstone_project_villa/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

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
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoaded) {
              final user = state.profileResponseModel.profileWithoutPassword;
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
                          user?.image.toString() ?? 'Kosong Broh',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Username
                  Text(
                    user?.nickname.toString() ?? '',
                    style: blackTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  const SizedBox(height: 5.0),

                  // Email
                  Text(
                    user?.email.toString() ?? '',
                    style:
                        greyTextStyle.copyWith(fontSize: 14, fontWeight: light),
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
                          text: 'Edit Profile',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfilePage(
                                  data: ProfileWithoutPassword(
                                    email: state.profileResponseModel
                                            .profileWithoutPassword?.email ??
                                        '',
                                    image: state.profileResponseModel
                                            .profileWithoutPassword?.image ??
                                        '',
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        // Security
                        CustomListTile(
                          icon: Iconsax.frame_4,
                          text: 'Security',
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
                          text: 'Help',
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
                          text: 'Language',
                          onTap: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => const CustomDialog(),
                            );
                          },
                        ),

                        // Dark Theme
                        CustomListTile(
                          icon: Iconsax.eye,
                          text: 'Dark Theme',
                          onTap: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => const CustomDialog(),
                            );
                          },
                        ),

                        // Logout
                        CustomListTile(
                          icon: Iconsax.logout,
                          text: 'Logout',
                          onTap: () async {
                            await AuthLocalDataSource().removeToken();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              LoginPage.routeName,
                              (route) => false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is ProfileLoading) {
              return Column();
            } else {
              return SizedBox();
            }
          },
        ),
      )),
    );
  }
}
