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
    @@all_terms.each_with_index do |term, index|
      if term.word(index) == search_word
        return found_term = term
      end
    end
    return found_term
  end

  def initialize(word, language, definition)
    @words = []
    @words << [word, language]
    @definition = []
    @definition << definition
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
    @words[word_index][0]
  end

  def language(word_index)
    @words[word_index][1]
  end

  def word_add(word, language)
    @words << [word, language]
  end

  def definition
    @definition
  end

  def definition_add(input_definition)
    @definition << input_definition
  end

  def definition_delete(definition_index)
    deleted_definition = @definition.delete_at(definition_index)
    return deleted_definition
  end

  def definition_edit(definition_index, new_definition)
    @definition[definition_index].replace(new_definition)
  end

end
