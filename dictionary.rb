require './lib/term.rb'


@current_term = nil

def main_menu
  loop do
    puts "[== Dictionary ==]\n"
    puts "[c] Create a term and definition"
    puts "[l] List the words in your dictionary"
    puts "[x] Exit"
    menu_choice = gets.chomp
    if menu_choice == "c"
      create_word
    elsif menu_choice == "l"
      list_words_with_index
    elsif menu_choice == "x"
      puts "Syonara"
      exit
    else
      puts "Invalid Choice."
    end
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

main_menu





# def display_with_index(collection, property1, property2)
#   collection.each_with_index do |item, index|
#     puts "[#{(index +1)}] #{item.send(property)}"
#   end
# end

