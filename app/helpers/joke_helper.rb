module JokeHelper
  def random_joke
      count = Joke.count
      random_offset = rand(count)
      Joke.offset(random_offset).first.body
  end

end
