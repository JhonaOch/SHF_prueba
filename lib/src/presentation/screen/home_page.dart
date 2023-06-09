import 'package:flutter/material.dart';
import 'package:prueba_application/src/domain/models/tours_model.dart';
import 'package:prueba_application/src/presentation/providers/login_provider.dart';
import 'package:prueba_application/src/presentation/providers/tour_provider.dart';
import 'package:provider/provider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prueba_application/src/presentation/screen/details_tour_page.dart';
import 'widget/button_navigation.dart';

import '../../helpers/configuration_helper.dart';
import '../../helpers/text_helper.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ToursProvider>(context, listen: false).getAllTours();
    });
    super.initState();
  }

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Consumer<ToursProvider>(
        builder: (context, value, child) {
          List<Tours> data = value.tours;
          return value.status == TourStatus.loading ||
                  value.status == TourStatus.initial
              ? const Center(
                  child: CircularProgressIndicator(
                    color: OpColor.colorProgressIndicator,
                  ),
                )
              : value.status == TourStatus.success
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 15.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Consumer<LoginProvider>(
                            builder: (context, value, child) => Text(
                              'Hola ¡${value.user!.displayName}!',
                              style: getStyle(fontSize: 16),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            '¿Dónde te Gustaría ir?',
                            style: getStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          search(),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                              child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                Tours oneTours = data[index];

                                return card(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        DetailsTourPage.routeName,
                                        arguments: oneTours,
                                      );
                                    },
                                    name: oneTours.name,
                                    description: oneTours.description,
                                    price: oneTours.price.toString(),
                                    pictureUrl: oneTours.pictureUrl,
                                    isVisibleOutstanding: true,
                                    iSVisibleOperator: false,
                                    heightCard: 357.88);
                              } else {
                                Tours tours = data[index];

                                return card(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        DetailsTourPage.routeName,
                                        arguments: tours,
                                      );
                                    },
                                    name: tours.name,
                                    description: tours.description,
                                    price: tours.price.toString(),
                                    pictureUrl: tours.pictureUrl,
                                    heightCard: 229,
                                    isVisibleOutstanding: false,
                                    urlImgOperator:
                                        tours.tourOperator.pictureUrl);
                              }
                            },
                          ))
                        ],
                      ),
                    )
                  : Center(
                      child: Text(
                        'Error en la conexion',
                        style:
                            getStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
        },
      ),
      backgroundColor: OpColor.backgroundColor,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    ));
  }

//Todo:Widget Search
  Widget search() {
    return Container(
      width: size.width,
      height: 56,
      decoration: BoxDecoration(
          border: Border.all(
            color: OpColor.textColorBlack.withOpacity(0.5),
            width: 0.5,
          ),
          color: OpColor.textColorBlack.withOpacity(0.01),
          borderRadius: BorderRadius.circular(36)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/vector/search.svg',
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explora Todas tus opciones',
                          style: getStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            itemSearch(title: 'Cualquier Lugar • '),
                            itemSearch(title: 'Cualquier Semana'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SvgPicture.asset(
                  'assets/vector/filter.svg',
                  width: 29.5,
                  height: 30.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//Child widget
  Widget itemSearch({required String title}) {
    return Text(
      title,
      style: getStyle(
          fontSize: 10, color: OpColor.textColorBlack.withOpacity(0.5)),
    );
  }
//Todo:Widget Card

  Widget card(
      {required String name,
      required String description,
      required String price,
      required String pictureUrl,
      required Function()? onTap,
      required bool isVisibleOutstanding,
      required double heightCard,
      String urlImgOperator = '',
      bool iSVisibleOperator = true}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: OpColor.backgroundColor,
        margin: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: pictureUrl,
                child: coverImageCard(
                    pictureUrl: pictureUrl,
                    isVisibleOutstanding: isVisibleOutstanding,
                    heightCard: heightCard,
                    urlImgOperator: urlImgOperator,
                    isVisibleOperator: iSVisibleOperator)),
            const SizedBox(
              height: 20,
            ),
            informationCard(name: name, description: description, price: price),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget coverImageCard(
      {required String pictureUrl,
      bool isVisibleOutstanding = false,
      double heightCard = 229,
      required String urlImgOperator,
      bool isVisibleOperator = true}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size.width,
          height: heightCard,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: FadeInImage(
              placeholderErrorBuilder: (context, error, stackTrace) {
                return Text(
                  'Error al cargar la imagen',
                  style: getStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              },
              imageErrorBuilder: (context, error, stackTrace) {
                return Text(
                  'Error al cargar la imagen',
                  style: getStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              },
              placeholder: const AssetImage('assets/img/loading2.gif'),
              image: NetworkImage(pictureUrl ??
                  'https://www.bcm-institute.org/wp-content/uploads/2020/11/No-Image-Icon.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          child: DotsIndicator(
            dotsCount: 4,
            position: 0,
            decorator: DotsDecorator(
              color: OpColor.textColorWhite.withOpacity(0.5),
              activeColor: OpColor.textColorWhite,
              size: const Size.square(10.0),
              activeSize: const Size(30.0, 8.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        if (isVisibleOutstanding)
          Positioned(
            top: 15,
            left: 17,
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                  color: OpColor.orangeColor,
                  borderRadius: BorderRadius.circular(42)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/vector/destacado.svg',
                      width: 14,
                      height: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Destacado',
                      style: getStyle(
                          color: OpColor.textColorWhite,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (isVisibleOperator)
          Positioned(
            left: 17,
            bottom: 40,
            child: Card(
              margin: EdgeInsets.zero,
              color: OpColor.textColorWhite,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  maxRadius: 20,
                  backgroundImage: NetworkImage(urlImgOperator),
                ),
              ),
            ),
          ),
        Positioned(
          top: 15,
          right: 17,
          child: SvgPicture.asset(
            'assets/vector/Corazon.svg',
            width: 34,
            height: 34,
          ),
        )
      ],
    );
  }

  Widget informationCard(
      {required String name,
      required String description,
      required String price}) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width * 0.8,
            child: Text(
              name,
              style: getStyle(fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '4.5',
                style: getStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const Icon(
                Icons.star,
                size: 15,
                color: Colors.amber,
              )
            ],
          )
        ],
      ),
      Text(
        description,
        style: getStyle(
            color: OpColor.textColorBlack.withOpacity(0.6),
            fontSize: 12,
            fontWeight: FontWeight.normal),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      Row(
        children: [
          Text(
            '\$$price',
            style: getStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '(Por persona)',
              style: getStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: OpColor.textColorBlack.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
