// Exemplo de como deve ficar a sua classe de Frase
class Frase {
  final String texto;
  final String autor;
  final String imagem; // <-- ADICIONE ESTE CAMPO
  bool liked;

  Frase({
    required this.texto,
    required this.autor,
    required this.imagem, // <-- OBRIGATÓRIO NO CONSTRUTOR
    this.liked = false,
  });

  void mudaLike() {
    liked = !liked;
  }
}

// Dentro do seu FraseControle, a lista de 5 frases deve conter os 5 links diferentes:
class FraseControle {
  int _index = 0;

  final List<Frase> _listaFrases = [
    Frase(
      texto: "A linha é um ponto que saiu para caminhar.",
      autor: "Paul Klee",
      imagem:
          "https://upload.wikimedia.org/wikipedia/commons/9/9e/Salvator_Rosa_-_Portrait_of_a_Philosopher_-_WGA20053.jpg",
    ),
    Frase(
      texto: "",
      autor: "Autor 2",
      imagem:
          "https://upload.wikimedia.org/wikipedia/commons/e/e2/Portrait_of_Niccol%C3%B2_Machiavelli_by_Santi_di_Tito.jpg?utm_source=pt.wikipedia.org&utm_campaign=imageinfo&utm_content=original",
    ),
    Frase(
      texto: "",
      autor: "Autor 3",
      imagem:
          "https://upload.wikimedia.org/wikipedia/commons/a/ac/Large_format_camera_lens.jpg?utm_source=pt.wikipedia.org&utm_campaign=imageinfo&utm_content=original",
    ),
    Frase(
      texto: "",
      autor: "Autor 4",
      imagem:
          "https://upload.wikimedia.org/wikipedia/commons/b/b8/Ursula_von_der_Leyen_presents_her_vision_to_MEPs_%2848298974857%29.jpg?utm_source=pt.wikipedia.org&utm_campaign=imageinfo&utm_content=original",
    ),
    Frase(
      texto: "",
      autor: "Autor 5",
      imagem:
          "https://upload.wikimedia.org/wikipedia/commons/0/09/AS08-13-2329.jpg?utm_source=pt.wikipedia.org&utm_campaign=imageinfo&utm_content=original",
    ),
  ];

  Frase get fraseAtual => _listaFrases[_index];

  void proximaFrase() {
    _index = (_index + 1) %
        _listaFrases.length; // Volta para a primeira quando chega na última
  }
}
