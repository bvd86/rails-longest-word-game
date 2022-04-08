require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = []
      10.times do
        @letters << ('a'..'z').to_a.sample
      end
    return @letters
  end

  def score
    @word = params[:word].upcase
    @letters = params[:letters].upcase
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    valid_word = URI.open(url).read
    valid = JSON.parse(valid_word)
    @valid = valid["found"] == false
    @include = @word.chars.all? { |letter| @letters.include?(letter) } == false
  end
end
