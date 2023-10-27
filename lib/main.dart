import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Manejo de alertas o mensajes',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final successAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Transaccion completada exitosamente!',
          autoCloseDuration: const Duration(seconds: 5),
          showConfirmBtn: false,
        );
      },
      title: 'Squickalert',
      text: 'Squickalert de mensaje correcto',
      leadingImage: 'assets/success.gif',
    );

    final errorAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Error',
          text: 'Algo salio mal ',
          backgroundColor: Colors.red,
          titleColor: Colors.white,
          textColor: Colors.white,
        );
      },
      title: 'Squickalert',
      text: 'Un squickalert de error',
      leadingImage: 'assets/error.gif',
    );

    final showSnackBar = buildButton(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Mensajes de notificación!'),
            duration: Duration(seconds: 4),
          ),
        );
      },
      title: 'SnackBar',
      text: 'Notificación de SnackBar',
      leadingImage: 'assets/snackbar.gif',
    );

    final showToast = buildButton(
      onTap: () {
        Fluttertoast.
        showToast(
          msg: ' mensaje de toast!',
          backgroundColor: Color.fromARGB(255, 2, 1, 19),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
      title: 'Toast',
      text: 'Mensaje de  toast',
      leadingImage: 'assets/toast.gif',
    );

    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: Text(

          " Manejo de alertas o mensajes. Como por ejemplo con quickalert, SnackBar y toast",
          style: Theme.of(context).textTheme.titleMedium,
          
         ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          successAlert,
          const SizedBox(height: 20),
          errorAlert,
          const SizedBox(height: 20),
          showSnackBar,
          const SizedBox(height: 20),
          showToast,
        ],
      ),
    );
  }

  Card buildButton({
    required onTap,
    required title,
    required text,
    required leadingImage,
  }) {
    return Card(
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            leadingImage,
          ),
        ),
        title: Text(title ?? ""),
        subtitle: Text(text ?? ""),
        trailing: const Icon(
          Icons.keyboard_arrow_right_rounded,
        ),
      ),
    );
  }
}
