require 'rspec'
require 'term'
require "word"
require "definition"

describe Term do

end

describe "Term" do
  before do
    Term.clear
  end

  describe ".all" do
    it "will hold our multitude of terms in a class level array" do
      expect(Term.all).to eq []
    end
  end

  describe ".search" do
    it "allows user to search for a term" do
      test_term = Term.new("nachos", "English", "chips with a yummy cheese sauce")
      test_term.save
      expect(Term.search("nachos")).to eq test_term
    end
  end

  describe ".save" do
    it "creates instance level save method for objects we instance to
        save them into class level array called @@all_terms" do
      test_term = Term.new("nachos", "English", "chips with a yummy cheese sauce")
      expect(test_term.save).to eq [test_term]
    end
  end

  it 'initializes the word and definition for our dictionary' do
    test_term = Term.new("carrot", "English", "orange root vegetable")
    expect(test_term).to be_an_instance_of Term
  end

  it 'allows the word and definition to be displayed' do
    test_term = Term.new("carrot", "English", "orange root vegetable")
    expect(test_term.word(0)).to eq 'carrot'
    expect(test_term.definition(0)).to eq 'orange root vegetable'
  end

  it 'allows the addition of multiple definitions' do
    test_term = Term.new("house", "English", "a place to live")
    test_term.definition_add("a casino (as in 'The house wins')","English")
    expect(test_term.definition(0)).to eq "a place to live"
    expect(test_term.definition_language(0)).to eq "English"
    expect(test_term.definition(1)).to eq "a casino (as in 'The house wins')"
    expect(test_term.definition_language(1)).to eq "English"
  end

  it 'allows the deletion of a definition' do
    test_term = Term.new("house", "English", "a place to live")
    test_definition = test_term.definition_delete(0)
    expect(test_term.all_definitions).to eq []
    expect(test_definition.definition).to eq "a place to live"
    expect(test_definition.language).to eq "English"
  end

  it 'allows the modification of a definition' do
    test_term = Term.new("house", "English", "a place to live")
    test_definition = test_term.definition_edit(0,"a casino (as in 'The house wins')", "English")
    expect(test_term.definition(0)).to eq "a casino (as in 'The house wins')"
  end

  it "allows for multiple word inputs in different languages for the same term" do
    test_term = Term.new("house", "English", "a place to live")
    test_term.word_add("casa", "Español")
    expect(test_term.word(0)).to eq "house"
    expect(test_term.word_language(0)).to eq "English"
    expect(test_term.word(1)).to eq "casa"
    expect(test_term.word_language(1)).to eq "Español"
  end

end

describe Word do
  it "creates a new word object from an input word and an input language" do
    test_word = Word.new("house", "English")
    expect(test_word.word).to eq "house"
    expect(test_word.language).to eq "English"
  end
end

describe Definition do
  it "creates a new definition object from an input definition" do
    test_definition = Definition.new("a place to live", "English")
    expect(test_definition.definition).to eq "a place to live"
    expect(test_definition.language).to eq "English"
  end
end

