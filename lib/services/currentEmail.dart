
class CurrentEmail {
    static String _email = '';
    static String _senha ='';


  static void set(String email) {
    _email = email;
    print(_email);
  }
  static String get() {
    print(_email);
    return _email;
  }

  static void setSenha(String senha){
    _senha = senha;
    print(_senha);
  }

  static String getSenha(){
    print(_senha);
    return _senha;
  }
  

}