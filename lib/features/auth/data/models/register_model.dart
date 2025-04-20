class RegisterModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String licensePlate;
  final String carModel;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.licensePlate,
    required this.carModel,
  });

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'license_plate': licensePlate,
        'car_model': carModel,
      };
}
