import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps/constants/my_constants.dart';
import 'package:google_maps/constants/my_strings.dart';
import 'package:google_maps/features/otp_screen/manager/cubit/phone_auth_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  Widget buildDrawerHeader(context) {
    return Column(
      children: [
        Container(
          height: 144,
          padding: const EdgeInsetsDirectional.fromSTEB(70, 10, 70, 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.blue[100],
          ),
          child: Image.asset(
            'assets/images/komi13.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Text(
          'Mostafa Elkomy',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        BlocProvider<PhoneAuthCubit>(
          create: (context) => phoneAuthCubit,
          child: Text(
            '${phoneAuthCubit.getLoggedUser().phoneNumber}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget buildDrawerListItem(
      {required IconData leadingIcon,
      required String title,
      Widget? trailing,
      Function()? onTap,
      Color? color}) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: color ?? MyColors.blue,
      ),
      title: Text(title),
      trailing: trailing ??
          const Icon(
            Icons.arrow_right,
            color: MyColors.blue,
          ),
      onTap: onTap,
    );
  }

  Widget buildDrawerListItemsDivider() {
    return const Divider(
      height: 0,
      thickness: 1,
      indent: 18,
      endIndent: 24,
    );
  }

  void _launchURL(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  Widget buildIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Icon(
        icon,
        color: MyColors.blue,
        size: 35,
      ),
    );
  }

  Widget buildSocialMediaIcons() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16),
      child: Row(
        children: [
          buildIcon(FontAwesomeIcons.facebook,
              'https://www.facebook.com/mustafa.elkomy.58/'),
          const SizedBox(
            width: 15,
          ),
          buildIcon(FontAwesomeIcons.linkedin,
              'https://www.linkedin.com/in/mostafaelkomy13/'),
          const SizedBox(
            width: 20,
          ),
          buildIcon(FontAwesomeIcons.telegram, 'https://t.me/Mostafa13elkomy'),
        ],
      ),
    );
  }

  Widget buildLogoutBlocProvider(context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: BlocProvider<PhoneAuthCubit>(
        create: (context) => phoneAuthCubit,
        child: buildDrawerListItem(
          leadingIcon: Icons.logout,
          title: 'Logout',
          trailing: const SizedBox(),
          color: Colors.red,
          onTap: () {
            phoneAuthCubit.logOut();
            Navigator.of(context).pushReplacementNamed(loginScreen);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 280,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[100]),
              child: buildDrawerHeader(context),
            ),
          ),
          buildDrawerListItem(leadingIcon: Icons.person, title: 'My Profile'),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.history,
            title: 'Places History',
            onTap: () {},
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(leadingIcon: Icons.settings, title: 'Setting'),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(leadingIcon: Icons.help, title: 'Help'),
          buildLogoutBlocProvider(context),
          const SizedBox(
            height: 130,
          ),
          ListTile(
            leading: Text(
              'Follow us',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ),
          buildSocialMediaIcons(),
          const SizedBox(
            height: 2,
          )
        ],
      ),
    );
  }
}
