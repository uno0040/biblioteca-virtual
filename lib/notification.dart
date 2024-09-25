// ignore_for_file: prefer_const_constructors
/*
import 'package:application_muito_foda/main.dart';

class NotificationLogic {
  static void notificacao7dias() async {
    await MyApp.initializeNotifications();
    DateTime dataAtual = DateTime.now();
    DateTime dataDaVariavel = DateTime(2023, 11, 29); // Substitua pela sua data

    Duration diferenca = dataDaVariavel.difference(dataAtual);
    bool esta7DiasAntes = diferenca.inDays == 7;

    if (esta7DiasAntes) {
      await MyApp.showNotification(
          'Há coisas que são preciosas por não durarem',
          'Com esta bela frase do livro Retrato, de Dorian Grey, te avisamos que falta apenas 7 dias para que você possa devolver o livro que pegou emprestado!');
    }
  }

  static void notificacaoUltimoDia() async {
    await MyApp.initializeNotifications();
    DateTime dataAtual = DateTime.now();
    DateTime dataDaVariavel = DateTime(2023, 11, 29); // Substitua pela sua data

    bool mesmoDiaMesAno = dataAtual.day == dataDaVariavel.day &&
        dataAtual.month == dataDaVariavel.month &&
        dataAtual.year == dataDaVariavel.year;

    if (mesmoDiaMesAno) {
      await MyApp.showNotification(
          'Tudo o que temos de decidir é o que fazer com o tempo que nos é dado.',
          'Com essa abertura de J.R.R. Tolkien em Senhor dos Anéis, te informamos que hoje é  o último dia para qur você possa devolver o livro que pegou emprestado, então corre lá!');
    }
  }

  static void devolucaoAtrasada() async {
    await MyApp.initializeNotifications();
    DateTime dataAtual = DateTime.now();
    DateTime dataDaVariavel = DateTime(2023, 11, 29); // Substitua pela sua data

    // Verifica se a data atual é posterior à data da variável
    bool dataAtualPosterior = dataAtual.isAfter(dataDaVariavel);

    if (dataAtualPosterior) {
      // Calcular as datas para 1, 15 dias, 1, 2 e 3 meses após a data da variável
      DateTime data1dia = dataDaVariavel.add(Duration(days: 1));
      DateTime data15Dias = dataDaVariavel.add(Duration(days: 15));
      DateTime data1Mes = dataDaVariavel.add(Duration(days: 30));
      DateTime data2Meses = dataDaVariavel.add(Duration(days: 60));
      DateTime data3Meses = dataDaVariavel.add(Duration(days: 90));

      // Verificar se a data atual está dentro desses intervalos
      if (dataAtual.isAfter(data1dia)) {
        await MyApp.showNotification(
            'Tudo depende do tipo de lente que você utiliza para ver as coisas.',
            'Como Jostein Gaarder diz em O Mundo de Sofia, dizemos que você está atrasado em devolver o livro que pegou emprestado, já está na hora de devolver hein!');
      } else if (dataAtual.isAfter(data15Dias)) {
        await MyApp.showNotification('Título', 'Mensagem 15 dias após atraso');
      } else if (dataAtual.isAfter(data1Mes)) {
        await MyApp.showNotification('Título', 'Mensagem 1 mês após atraso');
      } else if (dataAtual.isAfter(data2Meses)) {
        await MyApp.showNotification('Título', 'Mensagem 2 meses após atraso');
      } else if (dataAtual.isAfter(data3Meses)) {
        await MyApp.showNotification('Título', 'Mensagem 3 meses após atraso');
      }
    }
  }
}
*/