import 'package:flutter/material.dart';
import 'package:application_muito_foda/Objects/books.dart';

BookObject BookSearch(String s, int numDeLivros, List<BookObject> Livros) {
  for (int i = 0; i < numDeLivros; i++) {
    if (Livros[i].title == s) {
      return Livros[i];
    }
    if (Livros[i].author == s) {
      return Livros[i];
    }
    if (Livros[i].illustrator == s) {
      return Livros[i];
    }
    if (Livros[i].publisher == s) {
      return Livros[i];
    }
  }
  return Livros[0];
}
