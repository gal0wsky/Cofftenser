import 'package:cofftenser/controllers/coffee_description_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'coffee_description_controller_test.mocks.dart';
@GenerateNiceMocks([MockSpec<AssetBundle>()])

void main() {
  MockAssetBundle _mockAssetBundle = MockAssetBundle();
  test("Load descriptions from file using mock test", () async {
    final result = await CoffeeDescriptionController.loadDescriptionsFromFile(_mockAssetBundle);

    verify(_mockAssetBundle.loadString('resources/descriptions.json')).called(1);
  });
}