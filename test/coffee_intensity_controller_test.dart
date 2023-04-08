import 'package:cofftenser/controllers/coffee_description_controller.dart';
import 'package:cofftenser/controllers/coffee_intensity_controller.dart';
import 'package:cofftenser/models/coffee_description.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  late CoffeeIntensityController _controller;

  setUp(() {
    final reallyLightDescription = CoffeeDescription(intensityName: "reallyLight", content: "reallyLight");
    final lightDescription = CoffeeDescription(intensityName: "light", content: "light");
    final regularDescription = CoffeeDescription(intensityName: "regular", content: "regular");
    final strongDescription = CoffeeDescription(intensityName: "strong", content: "strong");
    final reallyStrongDescription = CoffeeDescription(intensityName: "reallyStrong", content: "reallyStrong");
    final dangerousDescription = CoffeeDescription(intensityName: "dangerous", content: "dangerous");

    CoffeeDescriptionController.descriptions = RxList();

    CoffeeDescriptionController.descriptions.add(lightDescription);
    CoffeeDescriptionController.descriptions.add(reallyLightDescription);
    CoffeeDescriptionController.descriptions.add(regularDescription);
    CoffeeDescriptionController.descriptions.add(strongDescription);
    CoffeeDescriptionController.descriptions.add(reallyStrongDescription);
    CoffeeDescriptionController.descriptions.add(dangerousDescription);

    _controller = CoffeeIntensityController();
  });

  test("Create controller test", () {
    expect(_controller.intensityCategory.value, "Regular");
  });

  group("Changing water and coffee amounts tests", () {
    group("Changing coffee tests", () {
      test("Change coffee amount test", () {
        const coffeeAmount = 8.0;

        _controller.changeCoffeeAmount(coffeeAmount);

        expect(_controller.coffee.value, coffeeAmount);
      });

      group("Changing min & max coffee amount tests", () {
        test("Set minimum coffee amount test", () {
          const minCoffeeAmount = 80.0;

          _controller.setMinCoffee(minCoffeeAmount);

          expect(_controller.minCoffee.value, minCoffeeAmount);
        });

        test("Set maximum coffee amount test", () {
          const maxCoffeeAmount = 25.0;

          _controller.setMaxCoffee(maxCoffeeAmount);

          expect(_controller.maxCoffee.value, maxCoffeeAmount);
        });
      });
    });

    group("Changing water tests", () {
      test("Change water amount test", () {
        const waterAmount = 237.0;

        _controller.changeWaterAmount(waterAmount);

        expect(_controller.water.value, waterAmount);
      });

      group("Changing min & max water amount tests", () {
        test("Set minimum water amount test", () {
          const minWaterAmount = 120.0;

          _controller.setMinWater(minWaterAmount);

          expect(_controller.minWater.value, minWaterAmount);
        });

        test("Set maximum water amount test", () {
          const maxWaterAmount = 370.0;

          _controller.setMaxWater(maxWaterAmount);

          expect(_controller.maxWater.value, maxWaterAmount);
        });
      });
    });
  });

  test("Update information test", () {
    const coffee = 12.0;
    const water =  50.0;

    _controller.changeCoffeeAmount(coffee);
    _controller.changeWaterAmount(water);

    _controller.updateInformation();

    expect(_controller.intensityCategory.value, "Dangerous");
    expect(_controller.intensityDescription.value, "dangerous");
    expect(_controller.picture.value, "assets/dangerous.png");
  });
}