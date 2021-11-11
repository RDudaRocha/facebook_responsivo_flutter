import 'package:facebook_interface/components/navegacao_abas.dart';
import 'package:facebook_interface/components/navegacao_abas_desktop.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'home.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  final List<Widget> _telas = [
    Home(),
    Scaffold(
      backgroundColor: Colors.green,
    ),
    Scaffold(
      backgroundColor: Colors.yellow,
    ),
    Scaffold(
      backgroundColor: Colors.purple,
    ),
    Scaffold(
      backgroundColor: Colors.black54,
    ),
    Scaffold(
      backgroundColor: Colors.orange,
    ),
  ];

  List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,
  ];

  int _indiceAbaSelecionada = 0;

  @override
  Widget build(BuildContext context) {

    final bool isDesktop = Responsivo.isDesktop(context);
    Size tamanho = MediaQuery.of(context).size;

    return DefaultTabController(
        length: _icones.length,
        child: Scaffold(
          appBar: isDesktop
              ? PreferredSize(
                    preferredSize: Size(tamanho.width, 100),
                    child: NavegacaoAbasDesktop(
                      usuario: usuarioAtual,
                      icones: _icones,
                      indiceAbaSelecionada: _indiceAbaSelecionada,
                      onTap: (indice){
                        setState(() {
                          _indiceAbaSelecionada = indice;
                        });
                      },
                    ),
                )
              : null,
          body: TabBarView(

            //Desabilitar a opção de navegação
            // de arrastar para o lado
            //physics: NeverScrollableScrollPhysics(),

            children: _telas,
          ),
          bottomNavigationBar: isDesktop ? null : NavegacaoAbas(
            icones: _icones,
            indiceAbaSelecionada: _indiceAbaSelecionada,
              onTap: (indice){
                  setState(() {
                    _indiceAbaSelecionada = indice;
                  });
              },
          ),
        )
    );
  }
}
