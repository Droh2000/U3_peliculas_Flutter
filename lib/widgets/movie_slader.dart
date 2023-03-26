import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementar media query (Sacar el tamano de la pantalla)
    final size = MediaQuery.of(context).size;

    return Container(
      // Tenga todo el ancho
      width: double.infinity,
      height: size.height * 0.3, // Alto del
      child: Column(
        // Orietacion
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'Populares',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Dar la separacion
          SizedBox(
            height: 5,
          ),
          // Expanded para que ocupe todod el tamano de la columa
          Expanded(
              child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) => _MoviePoster(),
          )),
        ],
      ),
    );
  }
}

// PAra movie poster
// Estamos hacciendo el carrusel de abajo
class _MoviePoster extends StatelessWidget {
  const _MoviePoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      child: Column(
        children: [
          // Para hacer tab (Nos mande a DetallesPEliculas)
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: null),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder:
                    NetworkImage('https://via.placeholder.com/300x400'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 130,
                height: 185,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Poneer el Texto (Primero ponemos la separacion)
          SizedBox(
            height: 5,
          ),
          // Si el texto es muy largo para que no de errro hay que ponerle ...
          const Text(
            'Lorem sesesessseseses jojojojoj sososososo sjojojojs sssososoos sjojojs sjsojsojoj sssososo hjbjhbjhbjhbjh bjhbjbjhbjhbjhbjbjh bhbjhbjhbjh',
            maxLines: 2, // Cuando se parta en 2
            overflow: TextOverflow.ellipsis, // Ponga ... cuando se corte
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
