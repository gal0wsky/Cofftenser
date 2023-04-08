import 'dart:convert';
import 'package:cofftenser/models/coffee_description.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CoffeeDescriptionController extends GetxController {
  static RxList<CoffeeDescription> descriptions = <CoffeeDescription>[].obs;

  CoffeeDescriptionController._();

  static Future<bool> loadDescriptionsFromFile(AssetBundle assetBundle) async {
    final String descriptionsJson = await assetBundle.loadString('resources/descriptions.json');

    if (descriptionsJson.isEmpty) {
      return false;
    }

    final decodedDescriptions = json.decode(descriptionsJson);

    for (final item in decodedDescriptions) {
      final description = CoffeeDescription.fromJson(item);
      descriptions.add(description);
    }

    return descriptions.isNotEmpty;
  }
}