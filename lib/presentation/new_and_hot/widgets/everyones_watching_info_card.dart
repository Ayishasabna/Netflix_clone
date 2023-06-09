import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/infrastructure/api_key.dart';
import 'package:netflix_clone/models/movie_info.dart';
import 'package:netflix_clone/presentation/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widgets.dart';

class EveryonesWatchingInfoCard extends StatelessWidget {
  const EveryonesWatchingInfoCard({super.key, required this.movieInfo});
  final MovieInfoModel movieInfo;

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apiKey';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //IMAGE,
          VideoWidget(
            videoImage: imageUrl,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                CustomButtonWidget(
                  icon: Icons.share,
                  title: 'Share',
                  iconSize: 20,
                  textSize: 16,
                ),
                kWidth,
                CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                  iconSize: 20,
                  textSize: 16,
                ),
                kWidth,
                CustomButtonWidget(
                  icon: Icons.play_arrow,
                  title: "Play",
                  iconSize: 20,
                  textSize: 16,
                ),
                kWidth,
              ],
            ),
          ),
          kHeight,
          Text(
            movieInfo.originalTitle ?? 'No Title Found',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
          Text(
            movieInfo.overview,
            style: TextStyle(color: kGreyColor),
          ),
        ],
      ),
    );
  }
}
