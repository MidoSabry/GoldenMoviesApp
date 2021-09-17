import 'package:flutter/material.dart';
import 'package:movie_app/constant/api_constant.dart';
import 'package:movie_app/constant/color_const.dart';
import 'package:movie_app/constant/string_const.dart';
import 'package:movie_app/utils/widgethelper/oval-right-clipper.dart';
import 'package:movie_app/utils/widgethelper/widget_helper.dart';
import 'package:movie_app/view/listing/movie_list_screen.dart';
import 'package:movie_app/view/other/about_us_screen.dart';
import 'package:movie_app/view/other/feedback_screen.dart';
import 'package:movie_app/view/other/help_screen.dart';
import 'package:movie_app/view/other/invite_friend_screen.dart';

import 'package:share/share.dart';

import '../profile_screen.dart';
import 'home_screen.dart';

class NavDrawer extends StatelessWidget {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return _buildDrawer();
  }

  _buildDrawer() {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: ColorConst.WHITE_BG_COLOR,
              boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        icon: Icon(
                          Icons.close,
                        ),
                        onPressed: () => Navigator.of(_context).pop()),
                  ),
                  SizedBox(height: 30.0),
                  _buildRow(Icons.home, "Home"),
                  _buildDivider(),
                  _buildRow(Icons.category, "Category"),
                  _buildDivider(),
                  _buildRow(Icons.local_movies, "Tranding Movie",
                      showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.movie_filter, "Popular Movie",
                      showBadge: false),
                  _buildDivider(),
                  _buildRow(Icons.movie, "Upcoming Movie", showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.share, "Share App"),
                  _buildDivider(),
                  _buildRow(Icons.exit_to_app, "Exit"),
                  _buildDivider(),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: ColorConst.GREY_COLOR,
    );
  }

  Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: () => _navigateOnNextScreen(title),
        child: Row(children: [
          Icon(
            icon,
            color: ColorConst.BLACK_COLOR,
          ),
          SizedBox(width: 10.0),
          getTxtColor(
              msg: title,
              txtColor: ColorConst.BLACK_COLOR,
              fontSize: 16,
              fontWeight: FontWeight.w600),
          Spacer(),
          if (showBadge)
            Material(
              color: ColorConst.APP_COLOR,
              elevation: 2.0,
              // shadowColor: ColorConst.APP_COLOR,
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                width: 10,
                height: 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorConst.APP_COLOR,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            )
        ]),
      ),
    );
  }

  void _navigateOnNextScreen(String title) {
    Navigator.of(_context).pop();
    switch (title) {
      case "Home":
        // navigationPush(_context, CategoryMovie());
        break;
      case "Category":
        navigationPush(
            _context, MovieListScreen(apiName: ApiConstant.GENRES_LIST));
        break;
      case "Tranding Movie":
        navigationPush(_context,
            MovieListScreen(apiName: ApiConstant.TRENDING_MOVIE_LIST));
        break;
      case "Popular Movie":
        navigationPush(
            _context, MovieListScreen(apiName: ApiConstant.POPULAR_MOVIES));
        break;
      case "Upcoming Movie":
        navigationPush(
            _context, MovieListScreen(apiName: ApiConstant.UPCOMING_MOVIE));
        break;

      case "Share App":
        final RenderBox box = _context.findRenderObject();
        Share.share(
            '*${StringConst.APP_NAME}*\n${StringConst.SHARE_DETAILS}\n${StringConst.PLAYSTORE_URL}',
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        break;
      case "Feedback":
        return navigationPush(_context, FeedbackScreen());
      case "Help us":
        return navigationPush(_context, HelpScreen());
      case "Invite Friend":
        return navigationPush(_context, InviteFriend());
      case "About us":
        return navigationPush(_context, AboutUsScreen());
      case "Exit":
        onWillPop(_context);
        break;
    }
  }
}
