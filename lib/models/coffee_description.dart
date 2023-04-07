class CoffeeDescription {
  late String intensityName;
  late String content;

  CoffeeDescription({
    required this.intensityName,
    required this.content
  });

  Map<String, dynamic> toJson() {
    return {
      "intensityName": intensityName,
      "content": content
    };
  }

  static CoffeeDescription fromJson(Map<String, dynamic> json) {
    return CoffeeDescription(intensityName: json["intensityName"], content: json["content"]);
  }
}