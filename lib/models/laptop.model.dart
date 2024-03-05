/// The laptop schema defines the structure of a laptop.
class LaptopModel {
  /// Constructor for [LaptopModel].
  LaptopModel({
    required this.brand,
    required this.model,
    required this.processor,
    required this.ram,
    required this.storage,
    required this.operatingSystem,
    required this.screenSize,
  });

  /// The brand of the laptop.
  final String brand;

  /// The model of the laptop.
  final String model;

  /// The processor of the laptop.
  final String processor;

  /// The RAM size of the laptop in gigabytes.
  final int ram;

  /// The storage details of the laptop.
  final LaptopStorageModel storage;

  /// The operating system of the laptop.
  final LaptopOperatingSystemEnum operatingSystem;

  /// The screen size of the laptop in inches.
  final num screenSize;

  /// Maps the class from a map of [String, dynamic].
  factory LaptopModel.fromJson(Map<String, dynamic> json) => LaptopModel(
        brand: json['brand'] as String,
        model: json['model'] as String,
        processor: json['processor'] as String,
        ram: json['ram'] as int,
        storage: json['storage'] as LaptopStorageModel,
        operatingSystem: json['operating_system'] as LaptopOperatingSystemEnum,
        screenSize: json['screen_size'] as num,
      );

  /// Maps the class to a map of [String, dynamic].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'brand': brand,
        'model': model,
        'processor': processor,
        'ram': ram,
        'storage': storage,
        'operating_system': operatingSystem,
        'screen_size': screenSize,
      };

  /// CopyWith method for [LaptopModel].
  LaptopModel copyWith({
    String? brand,
    String? model,
    String? processor,
    int? ram,
    LaptopStorageModel? storage,
    LaptopOperatingSystemEnum? operatingSystem,
    num? screenSize,
  }) =>
      LaptopModel(
        brand: brand ?? this.brand,
        model: model ?? this.model,
        processor: processor ?? this.processor,
        ram: ram ?? this.ram,
        storage: storage ?? this.storage,
        operatingSystem: operatingSystem ?? this.operatingSystem,
        screenSize: screenSize ?? this.screenSize,
      );
}

/// The storage details of the laptop.
class LaptopStorageModel {
  /// Constructor for [LaptopStorageModel].
  LaptopStorageModel({
    required this.capacity,
    required this.type,
  });

  /// The storage capacity of the laptop in gigabytes.
  final int capacity;

  /// The type of storage (e.g., SSD, HDD).
  final String type;

  /// Maps the class from a map of [String, dynamic].
  factory LaptopStorageModel.fromJson(Map<String, dynamic> json) =>
      LaptopStorageModel(
        capacity: json['capacity'] as int,
        type: json['type'] as String,
      );

  /// Maps the class to a map of [String, dynamic].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'capacity': capacity,
        'type': type,
      };

  /// CopyWith method for [LaptopStorageModel].
  LaptopStorageModel copyWith({
    int? capacity,
    String? type,
  }) =>
      LaptopStorageModel(
        capacity: capacity ?? this.capacity,
        type: type ?? this.type,
      );
}

enum LaptopOperatingSystemEnum { windows, macOS, linux }
