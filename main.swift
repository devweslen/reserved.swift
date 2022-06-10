func getWord(_ words: [String]) -> String {
  let index = Int.random(in: 0..<words.count)

  return words[index]
}

func printDiscoved(_ discoveredCharacters: [String]){
  print("\nPalavra: ", terminator:" ")
  for char in discoveredCharacters {
    print(char, terminator:" ")
  }
}

func getIndexLetterrInWord(_ letter: Character, _ word: String) -> [Int] {
  let newArray = Array(word) 
  var indexes: [Int] = []

  var count = 0
  
  for (index, char) in newArray.enumerated() {
    if(String(char) == String(letter)){
      indexes.insert(index, at: count)
      count += 1
    } 
  }
  
  return indexes
}

func gameIsFinished(discoved: [String], word: String, attempts: Int) -> Bool {
  return discoved.filter({ $0 != "_" }).count == word.count || attempts == 0
}

func main(){
  print("reserved.swift")
  print("Bora descobrir uma nova palavra reservada do swift?")
  
  let words = [
    "class",	
    "deinit",	
    "enum",	
    "extension",
    "func",	
    "import",	
    "Init",	
    "internal",
    "let",	
    "operator",	
    "protocol",	
    "public",	
    "static",
    "subscript",
    "typealias",	
    "var",
    "struct"
  ]

  let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

  let wordSelected = getWord(words).lowercased()
  var discoveredCharacters: [String] = wordSelected.map { _ in "_" }

  var attempts = 10
  
  printDiscoved(discoveredCharacters)
  
  var isFinished = false
  
  while !isFinished {
    print("\nRestam \(attempts) tentativa(s)")
    print("\nChute:", terminator: " ")
    var text = readLine() ?? ""
    text = text.lowercased()
  
    if(words.contains(text) || (text.count == 1 && alphabet.contains(text))) {
      for letter in text {
        let indexes = getIndexLetterrInWord(letter, wordSelected)
        if(indexes.count != 0){
          for currentIndex in indexes {
            discoveredCharacters[currentIndex] = String(letter)
          }
        }
      }
      attempts -= 1
    } else {
      print("\nInvalido, tente uma palavra reservada ou uma letra!")
    }
    
    printDiscoved(discoveredCharacters)
  
    isFinished = gameIsFinished(
      discoved: discoveredCharacters,
      word: wordSelected,
      attempts: attempts
    )
  }

  if(discoveredCharacters.filter({ $0 != "_" }).count == wordSelected.count){
    print("\nParabéns, acertou a palavra!")
  } else if(discoveredCharacters.filter({ $0 != "_" }).count != wordSelected.count && attempts == 0) {
    print("\nQue pena, acabou suas tentativas!")
    print("\nA palavra era \(wordSelected)")
  }
}

main()