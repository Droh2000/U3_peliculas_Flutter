import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:u3_peliculas/widgets/movie_slader.dart';
import 'package:u3_peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Recibir argumentos (Asi es como se pasan los argumentos de una pantalla a otra)
    // No puede ser nulo ? y debemos agregar una condicional con ??
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'Sin nombre';

    return Scaffold(
      body: CustomScrollView(
        // Vamos a ahcerlo personalizado
        slivers: [
          // Son widets con un comportamieito
          const _CustmoAppbar(),
          SliverList(
              delegate: SliverChildListDelegate([
            const _PosterAndTitle(),
            const _Overview(),
            const CastingCards(),
          ])),
        ],
      ),
    );
  }
}

class _CustmoAppbar extends StatelessWidget {
  const _CustmoAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true, // PAra que no desparessca (Si no que se haga chica)
      // Widget para que se ajuste al tamano
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        // Eliminar el paddin (Es el epsaico feoc que sale abajo del titulo
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          // El titulo en la parte de abajo al centor
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text(
            'Movie. title',
            style: TextStyle(fontSize: 18),
          ),
        ), // Esto es lo que va dentro dle appvar
        background: const FadeInImage(
          placeholder: NetworkImage('https://via.placeholder.com/300x400'),
          image: NetworkImage('https://via.placeholder.com/300x400'),
          fit: BoxFit.cover, // Rellene todo el espacio
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        // Este esta arriba de la pelicula
        top: 20,
      ),
      padding: const EdgeInsets.symmetric(
        // este de las orillas
        horizontal: 20,
      ),
      // Renglones para poner las coasuna al lado de otra
      child: Row(
        // Vamos a dividir la fila en hijos
        children: [
          // El primer hijo va a ser una imagen con bordes redondesdos
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: NetworkImage('https://via.placeholder.com/300x400'),
              image: NetworkImage('https://via.placeholder.com/300x400'),
              fit: BoxFit.cover,
              height: 150.0, // Hacer mas pequena la imagen
            ),
          ),
          // Agregar contenido al lado de la imagen
          // Dentro del ROW ponemos un Columan (Poner el titurlo y subtitulo y estrellas como hijo al lado de la imagen)
          const SizedBox(
            width: 20,
          ), // Espacio del ancho
          // Para que toda la columna se expanda en todo el espacio sobrante
          Expanded(
            child: Column(
              // Para que todo este justiicado a la izquierda
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'movie.title',
                  style: TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Text(
                  'movie.title.original',
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                // Agregamos otro ROW para las Estrellas
                Row(
                  children: [
                    Icon(
                      Icons.star_outline,
                      size: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '*',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: const Text(
        'HOLA NO SE QUE PONER YA HABKE SENNJE SLEM krkmfrer ferferf ,dmfmffnf ffmfnfnf fmfmfmfnf fnfdndnf ffnfnf f f f fnfnf  fnfnfnf ffnfnfnf f f f fnf fnfnf fnf, ededewdwed, ewdwedwedwededewdwedwedweded,wedwedwerfrmkmvjnajvhakfjfirhgirnfbgweffe,mrjfjfjfjfjfjfjfjfjf,rllrlrlrlrlrlrllr\n\n\n fmfmfmfmfmmfmf mrmrmrmrmmr fffmfmfmfmm dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddfferferferferfrferererf HOLA NO SE QUE PONER YA HABKE SENNJE SLEM krkmfrer ferferf ,dmfmffnf ffmfnfnf fmfmfmfnf fnfdndnf ffnfnf f f f fnfnf  fnfnfnf ffnfnfnf f f f fnf fnfnf fnf, ededewdwed, ewdwedwedwededewdwedwed',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
