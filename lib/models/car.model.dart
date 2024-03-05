/// A car.
class CarModel {
  /// Constructor for [CarModel].
  CarModel({
    required this.make,
    required this.model,
    required this.year,
    required this.price,
    required this.specs,
  });

  /// The make of the car.
  final String make;

  /// The model of the car.
  final String model;

  /// The year the car was made.
  final int year;

  /// The price of the car.
  final CarPriceModel price;

  /// The price of the car.
  final CarSpecsModel specs;

  /// Maps the class from a map of [String, dynamic].
  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        make: json['make'] as String,
        model: json['model'] as String,
        year: json['year'] as int,
        price: json['price'] as CarPriceModel,
        specs: json['specs'] as CarSpecsModel,
      );

  /// Maps the class to a map of [String, dynamic].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'make': make,
        'model': model,
        'year': year,
        'price': price,
        'specs': specs,
      };

  /// CopyWith method for [CarModel].
  CarModel copyWith({
    String? make,
    String? model,
    int? year,
    CarPriceModel? price,
    CarSpecsModel? specs,
  }) =>
      CarModel(
        make: make ?? this.make,
        model: model ?? this.model,
        year: year ?? this.year,
        price: price ?? this.price,
        specs: specs ?? this.specs,
      );
}

/// The price of the car.
class CarPriceModel {
  /// Constructor for [CarPriceModel].
  CarPriceModel({
    required this.amount,
    required this.currency,
  });

  /// The amount of the price.
  final int amount;

  /// The currency of the price.
  final String currency;

  /// Maps the class from a map of [String, dynamic].
  factory CarPriceModel.fromJson(Map<String, dynamic> json) => CarPriceModel(
        amount: json['amount'] as int,
        currency: json['currency'] as String,
      );

  /// Maps the class to a map of [String, dynamic].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'currency': currency,
      };

  /// CopyWith method for [CarPriceModel].
  CarPriceModel copyWith({
    int? amount,
    String? currency,
  }) =>
      CarPriceModel(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}

/// The price of the car.
class CarSpecsModel {
  /// Constructor for [CarSpecsModel].
  CarSpecsModel({
    required this.mileage,
    required this.color,
    required this.transmission,
    required this.fuelType,
    required this.bodyType,
    required this.engine,
    required this.interiorColor,
    required this.doors,
    required this.seats,
    required this.condition,
    required this.conditionDescription,
  });

  /// The mileage of the car.
  final int mileage;

  /// The color of the car.
  final String color;

  /// The transmission of the car.
  final String transmission;

  /// The fuel type of the car.
  final String fuelType;

  /// The body type of the car.
  final String bodyType;

  /// The engine of the car.
  final String engine;

  /// The interior color of the car.
  final String interiorColor;

  /// The number of doors of the car.
  final int doors;

  /// The number of seats of the car.
  final int seats;

  /// The condition of the car.
  final String condition;

  /// The condition description of the car.
  final String conditionDescription;

  /// Maps the class from a map of [String, dynamic].
  factory CarSpecsModel.fromJson(Map<String, dynamic> json) => CarSpecsModel(
        mileage: json['mileage'] as int,
        color: json['color'] as String,
        transmission: json['transmission'] as String,
        fuelType: json['fuel_type'] as String,
        bodyType: json['body_type'] as String,
        engine: json['engine'] as String,
        interiorColor: json['interior_color'] as String,
        doors: json['doors'] as int,
        seats: json['seats'] as int,
        condition: json['condition'] as String,
        conditionDescription: json['condition_description'] as String,
      );

  /// Maps the class to a map of [String, dynamic].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mileage': mileage,
        'color': color,
        'transmission': transmission,
        'fuel_type': fuelType,
        'body_type': bodyType,
        'engine': engine,
        'interior_color': interiorColor,
        'doors': doors,
        'seats': seats,
        'condition': condition,
        'condition_description': conditionDescription,
      };

  /// CopyWith method for [CarSpecsModel].
  CarSpecsModel copyWith({
    int? mileage,
    String? color,
    String? transmission,
    String? fuelType,
    String? bodyType,
    String? engine,
    String? interiorColor,
    int? doors,
    int? seats,
    String? condition,
    String? conditionDescription,
  }) =>
      CarSpecsModel(
        mileage: mileage ?? this.mileage,
        color: color ?? this.color,
        transmission: transmission ?? this.transmission,
        fuelType: fuelType ?? this.fuelType,
        bodyType: bodyType ?? this.bodyType,
        engine: engine ?? this.engine,
        interiorColor: interiorColor ?? this.interiorColor,
        doors: doors ?? this.doors,
        seats: seats ?? this.seats,
        condition: condition ?? this.condition,
        conditionDescription: conditionDescription ?? this.conditionDescription,
      );
}
