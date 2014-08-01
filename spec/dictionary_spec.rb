require 'rspec'
require 'term'

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
      test_term = Term.new("nachos", "chips with a yummy cheese sauce")
      test_term.save
      expect(Term.search("nachos")).to eq test_term
    end
  end

  describe ".save" do
    it "creates instance level save method for objects we instance to
        save them into class level array called @@all_terms" do
      test_term = Term.new("nachos", "chips with a yummy cheese sauce")
      expect(test_term.save).to eq [test_term]
    end
  end

  it 'initializes the word and definition for our dictionary' do
    test_term = Term.new("carrot", "orange root vegetable")
    expect(test_term).to be_an_instance_of Term
  end

  it 'allows the word and definition to be displayed' do
    test_term = Term.new("carrot", "orange root vegetable")
    expect(test_term.word).to eq 'carrot'
    expect(test_term.definition).to eq 'orange root vegetable'
  end
end
