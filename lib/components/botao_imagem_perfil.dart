import 'package:facebook_interface/components/imagem_perfil.dart';
import 'package:facebook_interface/modelos/modelos.dart';
import 'package:flutter/material.dart';

class BataoImagemPerfil extends StatelessWidget {

  final Usuario usuario;
  final VoidCallback onTap;

  const BataoImagemPerfil({
    Key? key,
    required this.usuario,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImagemPerfil(urlImagem: usuario.urlImagem, foiVisualizado: true,),
          SizedBox(width: 4,),
          Flexible(
              child: Text(
                usuario.nome,
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
          )
        ],
      ),
    );
  }
}
