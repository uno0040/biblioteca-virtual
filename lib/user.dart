class User{
  //informações pessoais
  static String name = '';
  static String email = '';
  static String password = '';
  static String phone = '';
  static String birth = '';

  // Informações de endereço do usuário
  static String cep = '';
  static String street = '';
  static String neighborhood = '';
  static String number = '';
  static String city = '';

   
   static void setUser(
    String _name,
    String _email,
    String _password,
    String _phone,
    String _birth,
    String _cep,
    String _street,
    String _neighborhood,
    String _number,
    String _city,
  ) {
    name = _name;
    email = _email;
    password = _password;
    phone = _phone;
    birth = _birth;
    cep = _cep;
    street = _street;
    neighborhood = _neighborhood;
    number = _number;
    city = _city;
  }

   static List<String> getAllInfo() {
    print([
      name,
      email,
      password,
      phone,
      birth,
      cep,
      street,
      neighborhood,
      number,
      city,
    ]);
    return [
      name,
      email,
      password,
      phone,
      birth,
      cep,
      street,
      neighborhood,
      number,
      city,
    ];

  }

}