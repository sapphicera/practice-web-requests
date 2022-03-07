require 'http'

run = true

while true
  system "clear"

  if user_word.upcase == 'Q'
    break
  end

  print "enter a word: "
  input_word = gets.chomp()

  word_definitions = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=false&sourceDictionaries=all&useCanonical=false&includeTags=false&api_key=22bf12vddbpizrmyfs90cf695e9j4u1seq52o4klisqmqn6v2").parse(:json)

  word_pronounciations = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/pronunciations?useCanonical=false&sourceDictionary=ahd-5&typeFormat=IPA&limit=1&api_key=22bf12vddbpizrmyfs90cf695e9j4u1seq52o4klisqmqn6v2").parse(:json)

  word_topexample = HTTP.get("").parse(:json)

  input_definition = word_definitions[0]["text"]
  input_pronounciation = word_pronounciations[0]["raw"]
  input_topexample = ""


  puts "#{input_word.capitalize}'s definition is: #{input_definition}."
  puts "The adh-5 correct pronounciation for #{input_word.capitalize} is: #{}"
  puts "The top example is: (its 0 raw)"

end