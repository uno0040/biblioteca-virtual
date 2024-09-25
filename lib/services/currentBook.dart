class CurrentBook {
    static String bookName = '';


  static void set(String name) {
    bookName = name;
    print("Definindo o livro atual: $bookName");
  }
  static String get() {
    print(bookName);
    return bookName;
  }

}