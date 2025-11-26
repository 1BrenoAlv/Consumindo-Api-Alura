import 'dart:convert';

class BooksModel {
  final String title;
  final String author;
  final int yearPublicacao;
  final int numeroPage;       // ATRIBUTOS

  BooksModel({ // CONSTRUTOR
    required this.title, 
    required this.author,
    required this.yearPublicacao,
    required this.numeroPage,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel( // PEGA OS DADOS 
    title: json['title'],
    author: json['author'],
    yearPublicacao: json['year_of_publication'],
    numeroPage: json['number_of_pages'],
  );

  Map<String, dynamic> toJson() => { // ENVIA OS DADOS
    'title': title,
    'author': author,
    'year_of_publication': yearPublicacao,
    'number_of_pages': numeroPage,
  };
}

BooksModel booksModelFromJson(String str) =>  // CONVERTE JSON EM OBJ
    BooksModel.fromJson(jsonDecode(str));

String booksModelToJson(BooksModel data) => jsonEncode(data.toJson()); // CONVERTE OBJ EM JSON
