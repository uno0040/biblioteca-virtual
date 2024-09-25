// ignore_for_file: prefer_const_constructors

import 'package:application_muito_foda/Pages/main_user_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:application_muito_foda/App_routes.dart';
import 'Pages/login_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:background_fetch/background_fetch.dart';
import 'notification.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: '',
  //     appId: '',
  //     messagingSenderId: '',
  //     projectId: '',
  //     authDomain: '',
  //     storageBucket: '',
  //   ),
  // );

  // INSIRA A CHAVE DO SEU FIREBASE ACIMA

  // Solicitar permissão para notificações
  //await MyApp().solicitarPermissaoNotificacoes();

  // Inicializa a função para notificações
  //await MyApp.initializeNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Login_screen.id,
      onGenerateRoute: App_routes.generateRoute,
    );
  }
  /*
  Future<void> solicitarPermissaoNotificacoes() async {
    var status = await Permission.notification.request();

    if (status.isGranted) {
      // Permissão concedida, você pode enviar notificações

      // Lógica para ativar notificações quando os requisitos forem atendidos
      await initializeNotifications();

      // Lógica para iniciar o esquema de rodar em segundo plano
      await iniciarRodarEmSegundoPlano();
    } else {
      // Permissão negada
    }
  }

  static Future<void> initializeNotifications() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> iniciarRodarEmSegundoPlano() async {
    // Configuração da inicialização do background_fetch
    await BackgroundFetch.configure(
      BackgroundFetchConfig(
        minimumFetchInterval: 15, // Intervalo mínimo em minutos
        stopOnTerminate: false,
        enableHeadless: true,
        startOnBoot: true,
      ),
      (String taskId) async {
        // Lógica para verificar e enviar notificações
        NotificationLogic.notificacao7dias();
        NotificationLogic.notificacaoUltimoDia();
        NotificationLogic.devolucaoAtrasada();

        BackgroundFetch.finish(taskId);
      },
    );
  }

  static Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id', // Substitua com um ID exclusivo para o seu canal
      'your_channel_name', // Substitua com um nome exclusivo para o seu canal
      channelDescription:
          'your_channel_description', // Substitua com uma descrição exclusiva para o seu canal
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await FlutterLocalNotificationsPlugin().show(
      0, // ID da notificação, você pode usar um valor diferente para cada notificação
      title,
      body,
      platformChannelSpecifics,
    );
  }
  */
}
