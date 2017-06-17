require_relative 'word_guessing'

RSpec.describe Word_Guessing do

  let(:game) { Word_Guessing.new('parrot') }

  it 'reduce the number of available guesses by 1' do
    game.available_guesses = 5
    expect(game.deduct_available_guesses).to eq 4
  end

  it 'it is not a repeated guess' do
    game.prev_guesses = ['a','b','c']
    user_input = 'p'
    expect(game.is_repeated_guess(user_input)).to eq false
  end

  it 'it is a repeated guess' do
    game.prev_guesses = ['a','b','c']
    user_input = 'a'
    expect(game.is_repeated_guess(user_input)).to eq true
  end

  it 'the secret word is not complete' do
    game.current_state = 'parro_'
    expect(game.is_word_complete).to eq false
  end

  it 'the secret word is complete' do
    game.current_state = 'parrot'
    expect(game.is_word_complete).to eq true
  end

  it 'update current state' do
    user_input = 'r'
    expect(game.update_current_state(user_input)).to eq '__rr__'
  end

  it 'can add to previous guesses array' do
    game.prev_guesses = ['a','b','c']
    user_input = 'r'
    expect(game.add_to_previous_guesses(user_input)).to eq (['a','b','c','r'])
  end

  it 'user guesses the whole word' do
    user_input = 'parrot'
    expect(game.try_guess(user_input)).to eq true
  end

  it 'user did not guess the whole word' do
    user_input = 'carrot'
    expect(game.play(user_input)).to eq false
  end

  it 'user did not guess a letter in the word' do
    user_input = 'u'
    expect(game.play(user_input)).to eq false
  end

  it 'user did guess a letter in the word' do
    user_input = 'r'
    expect(game.play(user_input)).to eq true
  end

end


#test no word
#test no guess or empty guess