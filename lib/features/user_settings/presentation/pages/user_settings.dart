import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_blog/features/user_settings/presentation/pages/confirm_avatar.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/widgets/avatar_widget.dart';
import '../widgets/user_setting_button_widget.dart';
import '../bloc/user_settings_bloc.dart';
import '../widgets/log_out_button.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  void initState() {
    BlocProvider.of<UserSettingsBloc>(context).add(PreloadUserDataEvent(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder<UserSettingsBloc, UserSettingsStates>(builder: (context, state) {
        if (state is UserSettingsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ConfirmAvatarPick) {
          return ConfirmAvatarPage(avatar: state.avatar);
        }
        if (state is UserSettingsMainState) {
          return Material(
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Color(0xFFF2F2F6)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 45.h),
                  AvatarWidget(
                    text: '${state.firstName[0]}${state.secondName[0]}',
                    onTap: () {
                      BlocProvider.of<UserSettingsBloc>(context).add(PickAvataFromGallery());
                    },
                    avatarLink: state.avatarLink,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '${state.firstName} ${state.secondName}',
                    style: textStyles.headerText,
                  ),
                  SizedBox(height: 25.h),
                  UserSettingsButtonWidget(
                    icon: Icons.bookmark,
                    text: 'My authors',
                    onTap: () {
                      context.go('/profile_settings/my_authors');
                    },
                  ),
                  SizedBox(height: 10.h),
                  UserSettingsButtonWidget(
                    icon: Icons.folder,
                    text: 'My posts',
                    onTap: () {
                      context.go('/profile_settings/my_posts');
                    },
                  ),
                  SizedBox(height: 10.h),
                  UserSettingsButtonWidget(
                    icon: Icons.edit,
                    text: 'Edit profile',
                    onTap: () {
                      context.go('/profile_settings/edit_profile');
                    },
                  ),
                  SizedBox(height: 209.h),
                  const LogOutButton(),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
