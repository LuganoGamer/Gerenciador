import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/Home/LoginPage.dart';
import 'package:flutter_application_1/home/Home/register/register_page.dart';
import 'package:flutter_application_1/home/second_page/resumo_page/resumo_page.dart';
import 'package:flutter_application_1/home/second_page/home_2/resumo_gastos_page.dart';
import 'package:flutter_application_1/home/second_page/icon_tela/delet/delet_page.dart';
import 'package:flutter_application_1/home/second_page/icon_tela/edit/edit_page.dart';
import 'package:flutter_application_1/home/second_page/icon_tela/inserir/inserir_page.dart';
import 'package:flutter_application_1/model/ValorModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ValorModel>(
      create: (context) => ValorModel(0),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle seus Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: Loginpage(),
      initialRoute: '/login',
      routes: {
        '/login' : (_) => Loginpage(),
        '/register' : (_) => RegisterPage(),
        '/resumo' : (_) => ResumoGastosPage(),
        '/inserir' : (_) => InserirPage(),
        '/edit' : (_) => EditPage(),
        '/delet' : (_) => DeletPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Loginpage(),
    const ResumoGastosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Resumo',
          ),
        ],
      ),
    );
  }
}