import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/imagem_perfil.dart';
import 'package:facebook_interface/modelos/modelos.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class CardPost extends StatelessWidget {

  final Postagem postagem;

  const CardPost({
    Key? key,
    required this.postagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsivo.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: isDesktop ? 5 : 0
      ),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      )
          : null ,
      child:Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              //Cabeçalho
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Cabeçalho
                    CabecalhoPost(postagem: postagem),
                    //Descrição
                    Text(postagem.descricao)
                  ],
                ),
              ),

              //Imagem Postagem
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CachedNetworkImage(imageUrl:  postagem.urlImagem,),
              ),

              //Area de estátisticas
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: EstatisticasPost(
                  postagem: postagem,
                ),
              ),
            ],
          )
      )
      ,
    );
  }
}

class EstatisticasPost extends StatelessWidget {

  final Postagem postagem;

  const EstatisticasPost({
    Key? key,
    required this.postagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: PaletaCores.azulFacebook,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4,),
            Expanded(child:
              Text("${postagem.curtidas}",
                   style: TextStyle(
                     color: Colors.grey[700],
                   )
               ),
            ),
            Text("${postagem.comentarios} comentários",
                style: TextStyle(
                  color: Colors.grey[700],
                )
            ),
            SizedBox(width: 8,),
            Text("${postagem.compartilhamentos} compartilhamentos",
                style: TextStyle(
                  color: Colors.grey[700],
                )
            ),
          ],
        ),
        Divider(thickness: 1.2,),
        Row(
          children: [
              BotaoPost(
                  icone: Icon(
                    LineIcons.thumbsUpAlt,
                    color: Colors.grey[700],
                  ),
                  texto: "Curtir",
                  onTap: (){},
              ),
              BotaoPost(
                icone: Icon(
                  LineIcons.alternateCommentAlt,
                  color: Colors.grey[700],
                ),
                texto: "Comentar",
                onTap: (){},
              ),
              BotaoPost(
                icone: Icon(
                  LineIcons.share,
                  color: Colors.grey[700],
                ),
                texto: "Compartilhar",
                onTap: (){},
              ),
          ],
        ),
      ],
    );
  }
}

class BotaoPost extends StatelessWidget {

  final Icon icone;
  final String texto;
  final VoidCallback onTap;

  const BotaoPost({
    Key? key,
    required this.icone,
    required this.texto,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              icone,
              const SizedBox(width: 4,),
              Text(
                  texto,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  )
              ),
            ],
          ),
        )
      )
    );
  }
}


class CabecalhoPost extends StatelessWidget {

  final Postagem postagem;

  const CabecalhoPost({
    Key? key,
    required this.postagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagemPerfil(
          urlImagem: postagem.usuario.urlImagem,
          foiVisualizado: true,
        ),
        const SizedBox(width: 8,),
        // Informações usuario
        Expanded(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(postagem.usuario.nome,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text("${postagem.tempoAtras} - ",),
                  Icon(Icons.public, size: 12, color: Colors.grey[600],),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8,),
        //Botão opções
        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.more_horiz),
        )
      ],
    );
  }
}
