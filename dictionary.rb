require './lib/term.rb'


@current_term = nil

def main_menu
  loop do
    puts "[== Dictionary ==]\n"
    puts "[s] Search your dictionary"
    puts "[c] Create a term and definition"
    puts "[l] List the words in your dictionary"
    puts "[n] Add a new definition to a word"
    puts "[r] Remove a definition"
    puts "[u] Update a definition"
    puts "[d] Get definitions of words"
    puts "[x] Exit"
    menu_choice = gets.chomp
    if menu_choice == "s"
      term_search
    elsif menu_choice == "c"
      create_word
    elsif menu_choice == "l"
      list_words_with_index
    elsif menu_choice == "n"
      add_definition
    elsif menu_choice == "r"
      remove_definition
    elsif menu_choice == "u"
      update_definition
    elsif menu_choice == "d"
      get_definition
    elsif menu_choice == "x"
      puts "Syonara"
      exit
    else
      puts "Invalid Choice."
    end
  end
end

def term_search
  puts "Please input the word you would like to search for:"
  word_input = gets.chomp
  @current_term = Term.search(word_input)
  if @current_term == nil
    puts "This term is not found in your dictionary"
  else
    puts "\n#{@current_term.word}: #{@current_term.definition}\n\n"
  end
end

def create_word
  puts "Enter the term to add to the dictionary"
  word_input = gets.chomp
  puts "Give that word a definition"
  word_definition = gets.chomp
  Term.new(word_input, word_definition).save
  @current_term = Term.all.last
  puts "#{@current_term.word} entered into dictionary"
end

def list_words_with_index
  system("clear")
  puts "Here are the words in your dictionary"
  Term.all.each_with_index do |collection, index|
    puts "[#{index + 1}] #{collection.word}"
  end
  puts "\n"
end

def get_definition
  list_words_with_index
  puts "\nWhich word do you want to see?"
  word_choice = gets.chomp.to_i
  @current_term = Term.all[word_choice - 1]
  @current_term.definition.each_with_index do |definition, index|
    puts "[#{index + 1}] #{definition}"
  end
end

def add_definition
  list_words_with_index
  puts "Which word would you like to add a definition to?"
  word_choice = gets.chomp.to_i
  @current_term = Term.all[word_choice -1]
  puts "What is the new definition you would like to add?"
  new_definition = gets.chomp
  @current_term.definition_add(new_definition)
end

def remove_definition
  list_words_with_index
  puts "Which word would you like to remove a definition from?"
  word_choice = gets.chomp.to_i
  @current_term = Term.all[word_choice -1]
  @current_term.definition.each_with_index do |definition, index|
    puts "[#{index + 1}] #{definition}"
  end
  puts "Which definition would you like to remove?"
  definition_choice = gets.chomp.to_i - 1
  deleted_definition = @current_term.definition_delete(definition_choice)
  puts "You deleted #{deleted_definition} from #{@current_term.word}"
end

def update_definition
  list_words_with_index
  puts "Which word would you like to update a definition of?"
  word_choice = gets.chomp.to_i
  @current_term = Term.all[word_choice -1]
  @current_term.definition.each_with_index do |definition, index|
    puts "[#{index + 1}] #{definition}"
  end
  puts "Which definition would you like to update?"
  definition_choice = gets.chomp.to_i - 1
  puts "What is the new definition?"
  new_definition = gets.chomp
  @current_term.definition_edit(definition_choice, new_definition)
end

main_menu

