import 'package:cofftenser/controllers/coffee_description_controller.dart';
import 'package:cofftenser/pages/intensity_calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 16, 0),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  const Image(
                    image: AssetImage('assets/homePageImage.png'),
                    fit: BoxFit.fill,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.488,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Color.fromARGB(168, 48, 20, 1),
                            Color.fromARGB(250, 38, 16, 0),
                          ],
                          stops: [
                            0.74,
                            0.86,
                            0.9
                          ]),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  const Text(
                    "Cofftenser",
                    style: TextStyle(
                      fontSize: 74,
                      fontFamily: 'Caveat',
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: const Text(
                      "Perfectly intense coffee\nfor you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 50),
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 60,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Color.fromARGB(255, 148, 42, 0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                                )
                              ),
                        ),
                        onPressed: () async {
                          final areDescriptionsLoaded = 
                            await CoffeeDescriptionController.loadDescriptionsFromFile(rootBundle);
                          if (areDescriptionsLoaded) {
                            Get.to(const IntensityCalculatorPage());
                          }
                          else {
                            Get.defaultDialog(
                              title: "Something went wrong",
                              middleText: "We can't open the intensity calculator. Please restart the app and try again.",
                              backgroundColor: const Color.fromARGB(255, 38, 16, 0),
                              titleStyle: const TextStyle(
                                fontFamily: "Heebo",
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              ),
                              middleTextStyle: const TextStyle(
                                fontFamily: "Heebo",
                                fontSize: 20
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
