/// The customer schema defines the structure of a customer.
class CustomerModel {
  /// Constructor for [CustomerModel].
  CustomerModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.address,
    this.hobbies,
  });

  /// The first name of the customer.
  final String firstName;

  /// The last name of the customer.
  final String lastName;

  /// The email address of the customer.
  final String email;

  /// The phone number of the customer.
  final String phoneNumber;

  /// The address of the customer.
  final CustomerAddressModel? address;

  /// The hobbies of the customer.
  final List<CustomerHobbyModel?>? hobbies;

  /// Maps the class from a map of [String, dynamic].
  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
        email: json['email'] as String,
        phoneNumber: json['phone_number'] as String,
        address: json['address'] as CustomerAddressModel?,
        hobbies: json['hobbies'] as List<CustomerHobbyModel?>?,
      );

  /// Maps the class to a map of [String, dynamic].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone_number': phoneNumber,
        'address': address,
        'hobbies': hobbies,
      };

  /// CopyWith method for [CustomerModel].
  CustomerModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    CustomerAddressModel? address,
    List<CustomerHobbyModel?>? hobbies,
  }) =>
      CustomerModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        hobbies: hobbies ?? this.hobbies,
      );
}

/// The address of the customer.
class CustomerAddressModel {
  /// Constructor for [CustomerAddressModel].
  CustomerAddressModel({
    required this.street,
    required this.city,
    required this.zipCode,
    required this.residencyType,
  });

  /// The street address of the customer.
  final String street;

  /// The city of the customer.
  final String city;

  /// The ZIP code of the customer.
  final String zipCode;

  /// The residency type of the customer.
  final CustomerAddressResidencyTypeEnum residencyType;

  /// Maps the class from a map of [String, dynamic].
  factory CustomerAddressModel.fromJson(Map<String, dynamic> json) =>
      CustomerAddressModel(
        street: json['street'] as String,
        city: json['city'] as String,
        zipCode: json['zip_code'] as String,
        residencyType:
            json['residency_type'] as CustomerAddressResidencyTypeEnum,
      );

  /// Maps the class to a map of [String, dynamic].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'street': street,
        'city': city,
        'zip_code': zipCode,
        'residency_type': residencyType,
      };

  /// CopyWith method for [CustomerAddressModel].
  CustomerAddressModel copyWith({
    String? street,
    String? city,
    String? zipCode,
    CustomerAddressResidencyTypeEnum? residencyType,
  }) =>
      CustomerAddressModel(
        street: street ?? this.street,
        city: city ?? this.city,
        zipCode: zipCode ?? this.zipCode,
        residencyType: residencyType ?? this.residencyType,
      );
}

/// The residency type of the customer.
enum CustomerAddressResidencyTypeEnum {
  /// villa
  villa,

  /// apartment
  apartment,

  /// condo
  condo,

  /// townhouse
  townhouse,
}

/// null
class CustomerHobbyModel {
  /// Constructor for [CustomerHobbyModel].
  CustomerHobbyModel({
    required this.name,
    this.description,
  });

  /// The name of the hobby.
  final String name;

  /// The description of the hobby.
  final String? description;

  /// Maps the class from a map of [String, dynamic].
  factory CustomerHobbyModel.fromJson(Map<String, dynamic> json) =>
      CustomerHobbyModel(
        name: json['name'] as String,
        description: json['description'] as String?,
      );

  /// Maps the class to a map of [String, dynamic].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'description': description,
      };

  /// CopyWith method for [CustomerHobbyModel].
  CustomerHobbyModel copyWith({
    String? name,
    String? description,
  }) =>
      CustomerHobbyModel(
        name: name ?? this.name,
        description: description ?? this.description,
      );
}
