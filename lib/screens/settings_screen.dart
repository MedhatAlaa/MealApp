import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final List carousalItems = [
    'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Information about the owner of the app',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.pink),
                color: Colors.grey,
              ),
              child: ListView(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      'assets/images/FB_IMG_1652118388438.jpg',
                      height: 300.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  buildRow('Name :', 'Medhat Alaa Shehata'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  buildRow('Phone :', '01144162596'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  buildRow('Jop :', 'Software Engineering '),
                  const SizedBox(
                    height: 10.0,
                  ),
                  buildRow('Age :', '22'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  buildRow('Country :', 'Egypt'),
                  const SizedBox(
                    height: 100.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            //This section related with the app information
            Text(
              'Information about the application',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.pink),
                color: Colors.grey,
              ),
              child: ListView(
                children: [
                  CarouselSlider(
                    items: carousalItems.map((item) {
                      return ClipRRect(
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      aspectRatio: 1.0,
                      autoPlay: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.easeOutSine,
                      height: 250.0,
                      reverse: false,
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage: true,
                      initialPage: 0,
                      autoPlayInterval: const Duration(seconds: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  buildRow('Name :', 'Meal App'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  buildRow('Description :', 'Cooking up!'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  buildRow('Jop :', 'How to Cook '),
                  const SizedBox(
                    height: 10.0,
                  ),
                  buildRow('Date :', '7/7/2022'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  buildRow('Made By:', 'Medhat Alaa'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  buildRow('Country :', 'Egypt'),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Go to login screen ',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routName);
              },
              child: const Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildRow(String text1, String text2) {
  return Container(
    padding: const EdgeInsets.all(5.0),
    height: 28.0,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.amberAccent,
    ),
    child: Row(
      children: [
        Text(text1),
        const SizedBox(
          width: 5.0,
        ),
        Text(text2),
      ],
    ),
  );
}
