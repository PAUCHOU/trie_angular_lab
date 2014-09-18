WordControllers = angular.module("WordControllers", [])

class WordsCtrl
  
  constructor: (@scope, @http, @Word, @Trie)->
    console.log arguments
    console.log @Trie
    this.greeting = "hello world"
    @suggestions = []
    @Word.all()
      .success (data)=>
        @words = data
        @words.forEach (word)=>
          @Trie.learn(word.name)

  addWord: (newWord)->
    @Trie.learn newWord.name
    console.log @Trie
    @Word.create(newWord)
      .success (data)=>
        @words.push data
        @scope.newWord = {}
  complete: (prefix)->
    console.log(prefix)
    if prefix
      @suggestions = @Trie.autoComplete(prefix)
    else
      @suggestions = ""



WordControllers.controller("WordsCtrl", ["$scope", "$http", "Word", "Trie", WordsCtrl])


