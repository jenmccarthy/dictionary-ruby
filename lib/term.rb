require './lib/word.rb'
require './lib/definition.rb'

class Term

  @@all_terms = []

  def Term.all
    @@all_terms
  end

  def Term.clear
    @@all_terms = []
  end

  def Term.search(search_word)
    found_term = nil
    @@all_terms.each do |term|
      term.all_words.each do |term_word|
        if term_word.word == search_word
          return found_term = term
        end
      end
    end
    return found_term
  end

  def initialize(word, language, definition)
    @words = []
    @words << Word.new(word, language)
    @definitions = []
    @definitions << Definition.new(definition, language)
  end

  def save
    @@all_terms << self
  end

  def all_words
    @words
  end

  def words(word_index)
    @words[word_index]
  end

  def word(word_index)
    @words[word_index].word
  end

  def word_language(word_index)
    @words[word_index].language
  end

  def word_add(word, language)
    @words << Word.new(word, language)
  end

  def all_definitions
    @definitions
  end

  def definitions(definition_index)
    @definitions[definition_index]
  end

  def definition(definition_index)
    @definitions[definition_index].definition
  end

  def definition_language(definition_index)
    @definitions[definition_index].language
  end

  def definition_add(input_definition, language)
    @definitions << Definition.new(input_definition, language)
  end

  def definition_delete(definition_index)
    deleted_definition = @definitions.delete_at(definition_index)
    return deleted_definition
  end

  def definition_edit(definition_index, new_definition, new_language)
    @definitions[definition_index].definition.replace(new_definition)
  end

end
