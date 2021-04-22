enum Level{
  facil, medio, dificil, perito
}

extension LevelStringExt on String{
   Level get levelParse => 
  {
    "facil" : Level.facil, 
    "medio" : Level.medio, 
    "dificil" : Level.dificil, 
    "perito" : Level.perito, 
  }[this]!; // Esse finalzinho acessa esse parse atraves da chave e garante que nao é nulo
}// se vier facil devolva level,facil


extension LevelExt on Level{
   String get levelParse => 
  {
    Level.facil :  "facil",
    Level.medio : "medio",
    Level.dificil:  "dificil",
    Level.perito : "perito"
  }[this]!; // Esse finalzinho acessa esse parse atraves da chave e garante que nao é nulo
}