import 'package:facebook_interface/modelos/modelos.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'botao_imagem_perfil.dart';
import 'botao_menu.dart';
import 'navegacao_abas.dart';

class NavegacaoAbasDesktop extends StatelessWidget {

  final Usuario usuario;
  final List<IconData> icones;
  final int indiceAbaSelecionada;
  final Function(int) onTap;

  const NavegacaoAbasDesktop({
    Key? key,
    required this.usuario,
    required this.onTap,
    required this.icones,
    required this.indiceAbaSelecionada,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
            BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2 ),
            blurRadius: 4,
          )
        ]
      ),
      child: Row(
        children: [
          const Expanded(
              child: Text(
                "facebook",
                style: TextStyle(
                  color: PaletaCores.azulFacebook,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  letterSpacing: -1.2,
                ),
              ),
          ),
          Expanded(
              child: NavegacaoAbas(
                icones: icones,
                indiceAbaSelecionada: indiceAbaSelecionada,
                onTap: onTap,
                indicadorEmbaixo: true,
              )
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BataoImagemPerfil(
                    usuario: usuario,
                    onTap: (){},
                  ),
                  BotaoMenu(
                    icone: Icons.search,
                    iconeTamanho: 30,
                    onPressed: (){},
                  ),
                  BotaoMenu(
                    icone: LineIcons.facebookMessenger,
                    iconeTamanho: 30,
                    onPressed: (){},
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}
