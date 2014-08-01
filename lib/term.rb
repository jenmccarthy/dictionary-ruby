class Term

@@all_terms = []

def Term.all
  @@all_terms
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
