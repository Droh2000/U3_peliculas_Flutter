import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:u3_peliculas/models/models.dart';

// Configurar nuestro provedro de servicios para que consuma el JSON (En este caso solo es 1 que es Movie DB)
class MoviesProvider extends ChangeNotifier {
  // Hereda de eso para que siempre este escuchando de cambios (Este documento se conesctando con la API)

  // Query parameters (Que salen a consumir el endpoint) El resultado lo vimos en el THUNDER (Por eso sabemos lo que nececitamos)
  // Copiamos y oegamos el enlavce de tio GET (Enpoint)
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '4f303256b6eaec295542d6a8800ddf63';
  String _languaje = 'es-MX';

  // Para recibir una lisra de peliculas
  List<Movie> onGetNowPlaying = [];

  MoviesProvider() {
    print('Movies Provider Inicializado');
    getNowPlaying(); // Salga la respuesta en la consola como JSON
  }

/* ESTO ES LO QUE VAMOS A MANDAR EN LOS CARRUSELS DE IMAGENES */
  // Todos los endpoint que sonsumamos los ponemos como meotdo
  // Asyncrono porque esrpera una respeusta
  getNowPlaying() async {
    // Url BAsse a donde se dirgie, EL endpoint que nececitamos (Es lo que sta despues de /3/now_playing)
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      // Pasar los parametros que tenemos en el Query Parameter (Con el mismo nombre que tienen en este mapa)
      // El tercero es la paginacion en 1
      'api_key': _apiKey, 'languaje': _languaje, 'page': '1'
    });

    // llamos el endpoint (Este es get)
    final response = await http.get(url);

    // No queremos el json AHOR queremos tomar los datos (Tomamos estos para deserializarlos)
    final nowPalyingResponse = NowPalyingResponse.fromRawJson(
        response.body); // aqui tenemos todas las peliculas en forma de mapa

    //print(response.body);
    //print(nowPalyingResponse.results[0].title);
    onGetNowPlaying = nowPalyingResponse.results;
    // Le comunica a todos los widgets que estan escuchando que se cambio la data por lo tanto se redibujan
    notifyListeners();
    return onGetNowPlaying;
  }

  getOneMovie() async {
    // Url BAsse es al ultimo la ID de una pelicula
    var url = Uri.https(_baseUrl, '3/movie/315162',
        {'api_key': _apiKey, 'languaje': _languaje, 'page': '1'});

    // llamos el endpoint (Este es get)
    final response = await http.get(url);

    //print(response.body);
  }

  // Actores
  getActors() async {
    final url = Uri.https(_baseUrl, '3/movie/315162/credits',
        {'api_key': _apiKey, 'language': _languaje});

    // llamamos al servicio y obtenemos la respuesta
    final response = await http.get(url);
    // Como lo de arriba viene en un String lo decodificamos
    final decodedData = json.decode(response
        .body); // El string plano es el body de la respuesta y lo convierte a un MAPA

    // Solo nos interesa regresar los actores
  }
}  


// Consumir una y los actores (Que sea vea al Imprimir el JSON)
