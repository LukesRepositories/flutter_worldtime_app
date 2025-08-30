class Quote {
  String? author;
  String? snippet;

  Quote({ String? authorArg, String? snippetArg }) {
    author = authorArg;
    snippet = snippetArg;
  }


  String getQuote() {
    String quote = "$snippet \n$author";
    return quote;
  }

}
