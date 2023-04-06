import 'package:cofftenser/controllers/coffee_intensity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class IntensityCalculatorPage extends StatelessWidget {
  const IntensityCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CoffeeIntensityController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 16, 0),
      body: Center(
        child: Obx(() { 
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image depending of intensity
              Image(image: AssetImage(controller.picture.string)),
              // How intense coffee is
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text(controller.intensityCategory.string,
                  style: const TextStyle(
                    fontFamily: "Satisfy",
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              // Short description of intensity
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Flexible(
                  child: Text(controller.intensityDescription.string,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Heebo",
                      fontSize: 18,
                      fontWeight: FontWeight.normal
                    ),
                  )
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 60),
                child: Column(
                  children: [
                    // How much coffee user wants
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      // width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text("Coffee ${controller.coffee.value.toStringAsFixed(0)} g",
                              style: const TextStyle(
                                fontSize: 17
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Slider(
                              min: controller.minCoffee.value,
                              max: controller.maxCoffee.value,
                              value: controller.coffee.value,
                              inactiveColor: const Color.fromARGB(50, 255, 255, 255),
                              activeColor: const Color.fromARGB(255, 148, 42, 0),
                              onChanged: (value) {
                                controller.changeCoffeeAmount(value);
                                controller.calculateIntensity();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    // How much water user wants
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text("Water ${controller.water.value.toStringAsFixed(0)} ml",
                              style: const TextStyle(
                                fontSize: 17
                              )
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Slider(
                              min: controller.minWater.value,
                              max: controller.maxWater.value,
                              value: controller.water.value,
                              inactiveColor: const Color.fromARGB(50, 255, 255, 255),
                              activeColor: const Color.fromARGB(255, 148, 42, 0),
                              onChanged: (value) {
                                controller.changeWaterAmount(value);
                                controller.calculateIntensity();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
          }
        ),
      ),
    );
  }
}