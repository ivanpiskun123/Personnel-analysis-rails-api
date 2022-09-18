require "test_helper"

class JokeTest < ActiveSupport::TestCase
  test "should not save joke without field body" do
        j = Joke.new
        assert_not j.save
  end
end
