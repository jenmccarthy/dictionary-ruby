class Term

  @@all_terms = []

  def Term.all
    @@all_terms
  end

  def Term.clear
    @@all_terms = []
  end

  def Term.search(search_word)
    @@all_terms.each do |term|
      if term.word == search_word
        return term
      end
    end
  end

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def save
    @@all_terms << self
  end

  def word
    @word
  end

  def definition
    @definition
  end

end
