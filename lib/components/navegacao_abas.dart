import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class NavegacaoAbas extends StatelessWidget {

  final List<IconData> icones;
  final int indiceAbaSelecionada;
  final Function(int) onTap;
  final bool indicadorEmbaixo;

  const NavegacaoAbas({
    Key? key,
    required this.onTap,
    required this.icones,
    required this.indiceAbaSelecionada,
    this.indicadorEmbaixo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicator: BoxDecoration(
        border: indicadorEmbaixo
            ? const Border(
                  bottom: BorderSide(
                      color: PaletaCores.azulFacebook,
                      width: 3
                  )
              )
            : const Border(
                  top: BorderSide(
                      color: PaletaCores.azulFacebook,
                      width: 3
                  )
              )
      ),
      tabs: icones.asMap().map((indeice, icone){
        return MapEntry(indeice,  Tab(
          icon: Icon(
            icone,
            color: indiceAbaSelecionada == indeice
                ? PaletaCores.azulFacebook
                : Colors.black54,
            size: 30,
          ),
        ));
      }).values.toList(),
    );
  }
}