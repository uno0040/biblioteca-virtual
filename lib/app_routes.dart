import 'package:application_muito_foda/Pages/adminPages/HomeAdmin.dart';
import 'package:application_muito_foda/Pages/adminPages/InfAdmin.dart';
import 'package:application_muito_foda/Pages/userPages/detailsUser.dart';
//import 'package:application_muito_foda/Pages/userPages/userhistoric.dart';
import 'package:flutter/material.dart';
import 'package:application_muito_foda/Pages/cadastro.dart';
import 'package:application_muito_foda/Pages/create_user_account.dart';
import 'package:application_muito_foda/Pages/emprestimo.dart';
import 'package:application_muito_foda/Pages/login_screen.dart';
import 'package:application_muito_foda/Pages/edit_password.dart';
import 'package:application_muito_foda/Pages/main_admin_screen.dart';
import 'package:application_muito_foda/Pages/main_user_screen.dart';

import 'Pages/userPages/lendBook.dart';

class App_routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Login_screen.id:
        debugPrint("Entrou no switch case");
        return MaterialPageRoute(builder: (_) => const Login_screen());

      case Edit_password.id:
        return MaterialPageRoute(builder: (_) => const Edit_password());

      case Create_user_account.id:
        return MaterialPageRoute(builder: (_) => const Create_user_account());

      case Main_user_screen.id:
        return MaterialPageRoute(builder: (_) => const Main_user_screen());

      case Admin_screen.id:
        return MaterialPageRoute(builder: (_) => const Admin_screen());

      case CadastroPage.id:
        return MaterialPageRoute(builder: (_) => const CadastroPage());

      case EmprestimoPage.id:
        return MaterialPageRoute(builder: (_) => const EmprestimoPage());
      case Lendbook.id:
        return MaterialPageRoute(builder: (_)=> const Lendbook()); 
        
      //case UserHistoric.id:
      //  return MaterialPageRoute(builder: (_)=> const UserHistoric());
      
      case HomeAdmin.id:
        return MaterialPageRoute(builder: (_)=> const HomeAdmin());
      
      case InfAdmin.id:
        return MaterialPageRoute(builder: (_)=> const InfAdmin());
      case DetailsUser.id:
        final userEmail = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => DetailsUser(userEmail: userEmail));

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('Something went wrong')),
                ));
    }
  }
}
