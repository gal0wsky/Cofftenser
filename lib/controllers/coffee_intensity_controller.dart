import 'package:cofftenser/controllers/coffee_description_controller.dart';
import 'package:cofftenser/models/intensity.dart';
import 'package:get/get.dart';

class CoffeeIntensityController extends GetxController {
  final Rx<Intensity> _intensity = Intensity.regular.obs;

  final coffee = 6.0.obs;
  final minCoffee = 6.0.obs;
  final maxCoffee = 30.0.obs;

  final water = 100.0.obs;
  final minWater = 30.0.obs;
  final maxWater = 300.0.obs;

  final intensityCategory = "Regular".obs;
  final intensityDescription = "This is regular coffee. Great for the start of every morning. Perfect for the little boost while working or studying.".obs;
  final picture = 'assets/regular.png'.obs;

  CoffeeIntensityController() {
    intensityCategory(Intensity.regular.name.capitalize);

    final descriptionContent = CoffeeDescriptionController.descriptions[_intensity.value.index].content;
    intensityDescription(descriptionContent);

    picture('assets/${_intensity.value.name}.png');
  }

  void changeCoffeeAmount(double newCoffeeAmount) {
    coffee(newCoffeeAmount);
  }

  void setMinCoffee(double newAmount) {
    minCoffee(newAmount);
  }

  void setMaxCoffee(double newAmount) {
    maxCoffee(newAmount);
  }

  void changeWaterAmount(double newWaterAmount) {
    water(newWaterAmount);
  }

  void setMinWater(double newAmount) {
    minWater(newAmount);
  }

  void setMaxWater(double newAmount) {
    maxWater(newAmount);
  }

  void updateInformation() {
    _intensity(_calculateIntensity());

    _updatePicturePath();
    _updateCategory();
    _updateDescription();
  }

  Intensity _calculateIntensity() {
    final coffeeToWaterRatio = coffee.value / water.value;
    Intensity intensity = Intensity.regular;
    
    if (coffeeToWaterRatio <= 1/19) {
      intensity = Intensity.superLight;
    }
    else if (coffeeToWaterRatio <=  1/18) {
      intensity = Intensity.light;
    }
    else if (coffeeToWaterRatio <= 1/16) {
      intensity = Intensity.regular;
    }
    else if (coffeeToWaterRatio <= 1/15) {
      intensity = Intensity.strong;
    }
    else if (coffeeToWaterRatio <= 1/14) {
      intensity = Intensity.reallyStrong;
    }
    else {
      intensity = Intensity.dangerous;
    }

    return intensity;
  }

  void _updatePicturePath() {
    picture('assets/${_intensity.value.name}.png');
  }

  void _updateCategory() {
    String newCategory = "Regular";

    switch (_intensity.value) {
      case Intensity.superLight:
        newCategory = "Super light";
        break;
      case Intensity.light:
        newCategory = "Light";
        break;
      case Intensity.regular:
        newCategory = "Regular";
        break;
      case Intensity.strong:
        newCategory = "Strong";
        break;
      case Intensity.reallyStrong:
        newCategory = "Really strong";
        break;
      case Intensity.dangerous:
        newCategory = "Dangerous";
        break;
    }

    intensityCategory(newCategory);
  }

  void _updateDescription() {
    String newDescription = CoffeeDescriptionController.descriptions[_intensity.value.index].content;

    intensityDescription(newDescription);
  }
}