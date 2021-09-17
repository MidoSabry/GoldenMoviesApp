import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/api_constant.dart';
import 'package:movie_app/constant/color_const.dart';
import 'package:movie_app/data/home/now_playing_respo.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/utils/apiutils/api_response.dart';
import 'package:movie_app/utils/widgethelper/widget_helper.dart';
import 'package:movie_app/view/details/detail_movie.dart';
import 'package:movie_app/view/widget/shimmer_view.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_builder/src/sizing_information.dart';
import 'package:scoped_model/scoped_model.dart';

class CarouselView extends StatelessWidget {
  SizingInformation sizeInfo;
  CarouselView(this.sizeInfo);

  @override
  Widget build(BuildContext context) {
    return Container(child: apiresponse());
  }

  Widget apiresponse() {
    return ScopedModelDescendant<MovieModel>(
      builder: (context, _, model) {
        var jsonResult = model.nowPlayingRespo;
        if (jsonResult.status == ApiStatus.COMPLETED)
          return CarouselSlider.builder(
            itemCount: jsonResult.data.results.length,
            itemBuilder: (BuildContext context, int itemIndex, int realIndex) =>
                getSliderItem(context, itemIndex,
                    jsonResult.data.results[itemIndex], sizeInfo),
            options: CarouselOptions(
              aspectRatio: 2.0,
//          enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
            ),
          );
        else
          return apiHandler(
              loading: ShimmerView(sizeInfo,
                  // height: sizeInfo.deviceScreenType == DeviceScreenType.desktop
                  //     ? 380
                  //     : 170,
                  viewType: ShimmerView.VIEW_CASOSAL),
              response: jsonResult);
//         return ShimmerView(sizeInfo,height: sizeInfo.deviceScreenType == DeviceScreenType.desktop?380:170, viewType: ShimmerView.VIEW_CASOSAL);
      },
    );
  }

  Widget getSliderItem(BuildContext context, int itemIndex,
      NowPlayResult result, SizingInformation sizeInfo) {
    String tag = result.original_title + "Carosal" + itemIndex.toString();
    String img = (sizeInfo.deviceScreenType == DeviceScreenType.desktop
            ? ApiConstant.IMAGE_ORIG_POSTER
            : ApiConstant.IMAGE_POSTER) +
        result.backdrop_path;
    final size = MediaQuery.of(context).size;
    return fullListImage(
        name: result.original_title,
        image: img,
        tag: tag,
        size: size,
        onTap: () {
          navigationPush(
            context,
            DetailsMovieScreen(result.original_title, img,
                result.original_title, itemIndex, result.id, tag),
          );
        });
  }
}

Widget fullListImage(
    {String name, String image, String tag, Size size, Function onTap}) {
  return Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Hero(
                tag: tag,
                child: Container(
                    width: size.width, child: getCacheImage(url: image))),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  name == null ? "" : name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned.fill(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        splashColor: ColorConst.SPLASH_COLOR,
                        onTap: () => onTap()))),
          ],
        )),
  );
}
