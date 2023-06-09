import 'package:flutter/material.dart';
import 'package:prueba_application/src/domain/models/tours_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../helpers/configuration_helper.dart';
import '../../helpers/text_helper.dart';

class DetailsTourPage extends StatefulWidget {
   static const routeName = '/details';
  const DetailsTourPage({super.key});

  @override
  State<DetailsTourPage> createState() => _DetailsTourPageState();
}

class _DetailsTourPageState extends State<DetailsTourPage> {
  late Size size;
  late List<String> items;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    final Tours tour = ModalRoute.of(context)!.settings.arguments as Tours;
    items = tour.excluded.split('\n').where((item) => item.isNotEmpty).toList();

    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                coverImageCard(pictureUrl: tour.pictureUrl),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sectionTemplate(
                          title: 'Conoce ${tour.name}',
                          content: informationTours(
                              time: '${tour.maxDuration.toString()} Minutos',
                              address: tour.address,
                              price: tour.price.toString()),
                          fontSize: 28),
                      sectionTemplate(
                        title: 'Qué harás!',
                        content: description(description: tour.description),
                      ),
                      sectionTemplate(
                        title: 'Qué llevar:',
                        content: whatToBring(),
                      ),
                      sectionTemplate(
                        title: 'No Incluye',
                        content: notIncluyed(),
                      ),
                      sectionTemplate(
                        title: 'Punto de Encuentro',
                        content: meetingPoint(direction: tour.address),
                      ),
                      sectionTemplate(
                        title: 'Fechas Disponibles',
                        content: dateDisponibility(
                            startDate:
                                DateFormat('hh:mm a').format(tour.startDate),
                            endDate: DateFormat('hh:mm a').format(tour.endDate),
                            price: tour.price.toString()),
                      ),
                      sectionTemplate(
                        title: 'Operador',
                        content: operator(
                            urlImg: tour.tourOperator.pictureUrl,
                            name: tour.tourOperator.name.name),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//Todo Widget coverImage
  Widget coverImageCard({required String pictureUrl}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: pictureUrl,
          child: SizedBox(
            width: size.width,
            height: 610,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              child: FadeInImage(
                placeholderErrorBuilder: (context, error, stackTrace) {
                  return Text(
                    'Error al cargar la imagen',
                    style: getStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                },
                placeholder: const AssetImage('assets/img/loading2.gif'),
                image: NetworkImage(pictureUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          width: size.width,
          height: 610,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 0.6),
              colors: [
                Color.fromRGBO(0, 0, 0, 0),
                Color.fromRGBO(0, 0, 0, 0.6),
              ],
              stops: [0.0416, 0.6549],
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 17,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/vector/arrow_back.svg',
              width: 32,
              height: 34,
            ),
          ),
        ),
        Positioned(
          top: 15,
          right: 17,
          child: SvgPicture.asset(
            'assets/vector/shared.svg',
            width: 32,
            height: 34,
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
      ],
    );
  }

//Todo:Widget sectionTemplate
  Widget sectionTemplate(
      {required String title, double fontSize = 20, required Widget content}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: getStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          overflow: TextOverflow.clip,
        ),
        const SizedBox(
          height: 5,
        ),
        content,
        const SizedBox(
          height: 30,
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: OpColor.textColorBlack.withOpacity(0.1),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

//Todo:informationTours
  Widget informationTours(
      {required String address, required String time, required String price}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tour Por la ciudad',
          style: getStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: size.width,
          child: Wrap(
            runSpacing: 10,
            spacing: 20,
            children: [
              item(name: address, url: 'assets/vector/location-marker.svg'),
              item(name: time, url: 'assets/vector/time.svg'),
              item(
                  name: '$price Costo por persona',
                  url: 'assets/vector/usd.svg')
            ],
          ),
        ),
      ],
    );
  }

// Widget informationTours
  Widget item({required String name, required String url}) {
    return SizedBox(
      width: size.width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            url,
            width: 16,
            height: 18,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              name,
              style: getStyle(fontSize: 12, fontWeight: FontWeight.normal),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

//Todo:description
  Widget description({required String description}) {
    return Text(
      description,
      style: getStyle(fontSize: 14, fontWeight: FontWeight.normal),
    );
  }

  //Todo:what to bring
  Widget whatToBring() {
    return Column(
      children: [
        itemsCheck(option: 'Lorem ipsum'),
        itemsCheck(option: 'Lorem ipsum'),
        itemsCheck(option: 'Lorem ipsum')
      ],
    );
  }

  //Todo:notIncluyed

  Widget notIncluyed() {
    return Column(children: items.map((e) => itemsCheck(option: e)).toList());
  }
  //Todo:meetingPoint

  Widget meetingPoint({required String direction}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        itemsCheck(
          option: direction,
          icon: 'assets/vector/location-marker.svg',
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/vector/google_maps.svg',
                width: size.width,
                height: 271,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Sed ut perspiciatis unde omnis iste natus voluptatemnesciunt. Neque porro quisquam  consectetur, adipisci veli.',
                  style: getStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        button(onPressed: () {}, name: 'Ver más', width: size.width),
      ],
    );
  }

//Todo:dateDisponibility
  Widget dateDisponibility(
      {required String startDate,
      required String endDate,
      required String price}) {
    return Column(
      children: [
        SizedBox(
          width: size.width,
          height: 200,
          child: Center(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 30,
                  crossAxisCount: 1),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  height: 223,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1,
                          color: OpColor.textColorBlack.withOpacity(0.1))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Martes\n',
                                style: getStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '28 de Mayo',
                                style: getStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Inicia a las $startDate y termina a las $endDate',
                          style: getStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cupos disponibles 2',
                              style: getStyle(fontSize: 12),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  '\$$price Usd',
                                  style: getStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset(
                                  'assets/vector/profile 2.svg',
                                  width: 14,
                                  height: 14,
                                ),
                              ],
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: button(
                              onPressed: () {},
                              name: 'Ver fecha',
                              height: 36,
                              color: OpColor.colorProgressIndicator,
                              colorText: OpColor.textColorWhite,
                              isVisibleBorder: false),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        button(
            onPressed: () {},
            name: 'Ver fechas disponibles',
            width: size.width),
      ],
    );
  }

//Todo Operator
  Widget operator({required String name, required String urlImg}) {
    return Container(
      width: size.width,
      height: 270,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1, color: OpColor.textColorBlack.withOpacity(0.1))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  maxRadius: 30,
                  backgroundImage: NetworkImage(urlImg),
                ),
                const SizedBox(
                  width: 14,
                ),
                Text(
                  name,
                  style: getStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium...',
              style: getStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Leer Más',
                style: getStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    lineText: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valoraciones',
                      style:
                          getStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4.5',
                          style: getStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reseñas',
                      style:
                          getStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '224 Reseñas',
                      style:
                          getStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  //itemsCheck
  Widget itemsCheck(
      {required String option, String icon = 'assets/vector/check.svg'}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: SvgPicture.asset(
              icon,
              width: 17,
              height: 17,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              option,
              style: getStyle(fontSize: 14),
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }

//Button
  Widget button(
      {required Function()? onPressed,
      required String name,
      double width = 139,
      double height = 54,
      Color color = OpColor.textColorWhite,
      bool isVisibleBorder = true,
      Color colorText = OpColor.textColorBlack}) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: isVisibleBorder
              ? const BorderSide(
                  color: Colors.black,
                  width: 1.0,
                )
              : const BorderSide(),
        ),
        onPressed: onPressed,
        child: Text(
          name,
          style: getStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: colorText),
        ),
      ),
    );
  }
}
