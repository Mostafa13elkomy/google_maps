import 'dart:html';
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
          padding: const EdgeInsetsDirectional.fromSTEB(70, 10, 70, 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.blue[100],
          ),
          child: Image.asset(
            'assets/images/WhatsApp Image 2023-12-17 at 11.34.54_ff9bddf6.jpg',
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
        Text(
          '01098253747',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Widget buildIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[100]),
              child: buildDrawerHeader(context),
            ),
          ),
          buildDrawerListItem(leadingIcon: Icons.person, title:'My Profile'),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(leadingIcon: Icons.history, title: 'Places History',
          onTap: () {},
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(leadingIcon: Icons.settings, title:'Setting'),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(leadingIcon: Icons.help, title: 'Help'),
          BlocProvider<PhoneAuthCubit>(create: (context) => phoneAuthCubit,
          child:buildDrawerListItem(leadingIcon: Icons.logout, title: 'Logout',
          trailing: const SizedBox(),
          color: Colors.red,
          onTap: () {
            phoneAuthCubit.logOut();
            Navigator.of(context).pushReplacementNamed(loginScreen);
          },
          ),
          ),
          const SizedBox(height: 100,),
            ListTile(
            leading: Text('Follow us',
            style: TextStyle(
              color: Colors.grey[600],
            ),),
          ),
          buildSocialMediaIcons(),
        ],
      ),
    );
  }
}
