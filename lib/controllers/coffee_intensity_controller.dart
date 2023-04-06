import 'package:get/state_manager.dart';

class CoffeeIntensityController extends GetxController {
  final coffee = 6.0.obs;
  final minCoffee = 6.0.obs;
  final maxCoffee = 30.0.obs;

  final water = 100.0.obs;
  final minWater = 30.0.obs;
  final maxWater = 300.0.obs;

  final intensityCategory = "Really strong".obs;
  final intensityDescription = "This type of coffee is really intense. It's almost like an espresso. Condenssed shot gives you strike for the day".obs;
  final picture = 'assets/reallyStrongCoffee.png'.obs;

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

  void calculateIntensity() {
    // TODO: Calculate new coffee intensity, change category, desc & image
  }
}