import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/widgets/buttons.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Internet Ultra Cepat',
    'Kenyamanan Sebagai Prioritas',
    '24 / 7 / 365 Customer Support',
    'Saatnya #SamaPermana',
  ];

  List<String> subtitles = [
    'Dengan mengutamakan\nlayanan ultra cepat\ndan dapat dihandalkan',
    'Menyediakan kenyamanan dan\nakses tanpa batas yang\nmenunjang informasi yang tiada henti',
    'Memiliki tim yang baik dan kompeten\nagar memenuhi rasa aman\ndan nyaman sebagai prioritas kami',
    '“ Kami Hadir Untuk\nKenyamanan Internet Rumah\ndan Bisnis Anda ”',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 39,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    items: [
                      Image.asset(
                        'assets/img_onboarding1.png',
                        height: 331,
                      ),
                      Image.asset(
                        'assets/img_onboarding2.png',
                        height: 331,
                      ),
                      Image.asset(
                        'assets/img_onboarding3.png',
                        height: 331,
                      ),
                      Image.asset(
                        'assets/img_onboarding4.png',
                        height: 331,
                      ),
                    ],
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 331,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(
                          () {
                            currentIndex = index;
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 121,
                  ),
                  Column(
                    children: [
                      Text(
                        titles[currentIndex],
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        subtitles[currentIndex],
                        textAlign: TextAlign.center,
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: currentIndex == 3 ? 17 : 24,
                      ),
                      currentIndex == 3
                          ? Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  child: CustomFilledButton(
                                    title: 'Daftar',
                                    onPressed: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        '/sign-up',
                                        (route) => false,
                                      );
                                    },
                                  ),
                                ),
                                CustomTextButton(
                                  title: 'Masuk',
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/sign-in',
                                      (route) => false,
                                    );
                                  },
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 12,
                                      height: 12,
                                      margin: const EdgeInsets.only(
                                        right: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currentIndex == 0
                                            ? lightGreenColor
                                            : lightBackgroundColor,
                                      ),
                                    ),
                                    Container(
                                      width: 12,
                                      height: 12,
                                      margin: const EdgeInsets.only(
                                        right: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currentIndex == 1
                                            ? lightGreenColor
                                            : lightBackgroundColor,
                                      ),
                                    ),
                                    Container(
                                      width: 12,
                                      height: 12,
                                      margin: const EdgeInsets.only(
                                        right: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currentIndex == 2
                                            ? lightGreenColor
                                            : lightBackgroundColor,
                                      ),
                                    ),
                                    Container(
                                      width: 12,
                                      height: 12,
                                      margin: const EdgeInsets.only(
                                        right: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currentIndex == 3
                                            ? lightGreenColor
                                            : lightBackgroundColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  child: CustomFilledButton(
                                    title: 'Selanjutnya',
                                    onPressed: () {
                                      carouselController.nextPage();
                                    },
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
