module TestsHelper
  TEST_LEVELS = { 0 => "Very easy", 1 => "Easy",
                  2 => "Medium", 3 => "Hard",
                  4 => "Very hard", 5 => "For Heroes" }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :uncountable
  end
end
