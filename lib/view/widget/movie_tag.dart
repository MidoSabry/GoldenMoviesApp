import 'package:flutter/widgets.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:movie_app/constant/color_const.dart';
import 'package:movie_app/constant/string_const.dart';
import 'package:movie_app/data/details/movie_details_respo.dart';
import 'package:movie_app/utils/widgethelper/widget_helper.dart';
import 'package:movie_app/view/listing/movie_list_screen.dart';
import 'package:movie_app/view/widget/shimmer_view.dart';

import 'package:responsive_builder/responsive_builder.dart';

class MovieTag extends StatelessWidget {
  const MovieTag({
    Key key,
    @required List<Genres> items,
    @required SizingInformation sizes,
    Color textColor,
    Color borderColor,
  })  : _items = items,
        sizeInfo = sizes,
        _textColor = textColor,
        _borderColor = borderColor,
        super(key: key);

  final List<Genres> _items;
  final Color _textColor;
  final Color _borderColor;
  final SizingInformation sizeInfo;
  @override
  Widget build(BuildContext context) {
    if (_items == null)
      // return  ShimmerView.movieDetailsTag();
      return sizeInfo.deviceScreenType == DeviceScreenType.desktop
          ? Container()
          : ShimmerView.movieDetailsTag();
    else
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Tags(
          itemCount: _items.length, // required
          itemBuilder: (int index) {
            final item = _items[index];
            return ItemTags(
                key: Key(index.toString()),
                index: index,
                // required
                title: item.name,
                color: ColorConst.WHITE_COLOR,
                active: false,
                textStyle: TextStyle(fontSize: 12),
                elevation: 0,
                textColor: ColorConst.APP_COLOR,
                border: Border.all(
                  color: ColorConst.APP_COLOR,
                ),
                onLongPressed: null,
                onPressed: (datte) => navigationPush(
                    context,
                    MovieListScreen(
                        apiName: StringConst.MOVIE_CATEGORY,
                        dynamicList: item.name,
                        movieId: item.id)));
          },
        ),
      );
  }
}
