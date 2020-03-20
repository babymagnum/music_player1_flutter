import 'package:cached_network_image/cached_network_image.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/model/songs.dart';
import 'package:dribbble_clone/view/library/widgets/bottom_sheet_songs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaylistsView extends StatefulWidget {
  @override
  _PlaylistsViewState createState() => _PlaylistsViewState();
}

class _PlaylistsViewState extends State<PlaylistsView> with AutomaticKeepAliveClientMixin {

  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 0.55, initialPage: 0, keepPage: false);
  List<String> _listImages = [
    'https://d2tml28x3t0b85.cloudfront.net/tracks/artworks/001/068/945/original/a6703e.jpeg?1561539681',
    'https://d2tml28x3t0b85.cloudfront.net/tracks/artworks/001/068/945/original/a6703e.jpeg?1561539681',
    'https://d2tml28x3t0b85.cloudfront.net/tracks/artworks/001/068/945/original/a6703e.jpeg?1561539681',
    'https://d2tml28x3t0b85.cloudfront.net/tracks/artworks/001/068/945/original/a6703e.jpeg?1561539681',
    'https://d2tml28x3t0b85.cloudfront.net/tracks/artworks/001/068/945/original/a6703e.jpeg?1561539681',
  ];
  List<Songs> _listSongs = [
    Songs('Loco Contigo', 'https://d2tml28x3t0b85.cloudfront.net/tracks/artworks/001/068/945/original/a6703e.jpeg?1561539681', 'Dj Snake & J Balvin'),
    Songs('Milionaria', 'https://media.pitchfork.com/photos/5d1cf95f304621000999709d/1:1/w_160/Rosalia.jpg', 'Rosalia'),
    Songs('Meaning', 'https://24hourhiphop.com/wp-content/uploads/2020/02/maxresdefault-468.jpg', 'Con Altura'),
    Songs('Meaning', 'https://24hourhiphop.com/wp-content/uploads/2020/02/maxresdefault-468.jpg', 'Con Altura'),
    Songs('Meaning', 'https://24hourhiphop.com/wp-content/uploads/2020/02/maxresdefault-468.jpg', 'Con Altura'),
    Songs('Meaning', 'https://24hourhiphop.com/wp-content/uploads/2020/02/maxresdefault-468.jpg', 'Con Altura'),
    Songs('Meaning', 'https://24hourhiphop.com/wp-content/uploads/2020/02/maxresdefault-468.jpg', 'Con Altura'),
    Songs('Meaning', 'https://24hourhiphop.com/wp-content/uploads/2020/02/maxresdefault-468.jpg', 'Con Altura'),
  ];

  @override
  void initState() {
    Future.delayed(Duration.zero, () => _pageController.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.easeOut));

    super.initState();
  }

  _showBottomSheet() {
    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => BottomSheetSongs(listSongs: _listSongs)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20,),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: PageView.builder(
            itemCount: _listImages.length,
            controller: _pageController,
            onPageChanged: (value) => setState(() => _currentPage = value),
            itemBuilder: (_, index) => _carouselItem(index)
          ),
        )
      ],
    );
  }

  Widget _carouselItem(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, _) {
        double value = 1;

        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }

        return GestureDetector(
          onTap: () => _showBottomSheet(),
          child: Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) * MediaQuery.of(context).size.height * 0.3, width: Curves.easeOut.transform(value) * MediaQuery.of(context).size.height * 0.35 - 20,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  imageUrl: _listImages[index],
                  placeholder: (context, _) => Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: ThemeColor.lightGrey3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
