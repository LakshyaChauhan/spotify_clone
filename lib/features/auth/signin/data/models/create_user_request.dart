class CreateUserRequest {
  String fullName;
  String email;
  String password;
  CreateUserRequest({
    required this.email,
    required this.password,
    required this.fullName,
  });
}
