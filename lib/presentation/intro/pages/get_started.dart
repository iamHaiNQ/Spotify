import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class GetStartedPages extends StatelessWidget {
  const GetStartedPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 60,
              horizontal: 40,
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AppImages.introBG,
                    ))),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    AppVectors.logo,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Thưởng thức việc nghe nhạc',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffDADADA),
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Khám phá thế giới âm nhạc đa sắc màu và tận hưởng trải nghiệm nghe nhạc không giới hạn cùng ứng dụng của chúng tôi. Bắt đầu ngay hôm nay!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                BasicAppButton(
                  onPressed: () {},
                  title: 'Bắt đầu',
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          )
        ],
      ),
    );
  }
}
