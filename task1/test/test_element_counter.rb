require 'minitest/autorun'
require 'element_counter'

class TestMyCounter < Minitest::Test
  def test_count_elements
    a = [1, 2, 3]
    b = [3, 2, 1]
    assert_equal({ 1 => 2, 2 => 2, 3 => 2 }, MyCounter.numbers_count(a, b))
  end

  def test_count_insertion_elements
    a = [[5, [1, 3, 5]], [1]]
    b = [1, [3, [5]], 3]
    assert_equal({ 1 => 3, 3 => 3, 5 => 3 }, MyCounter.numbers_count(a, b))
  end

  def test_skip_nils
    a = [nil, [5, [1, 3, 5]], nil, [[1], nil]]
    b = [1, nil, [3, [5]], nil, 3]
    assert_equal({ 1 => 3, 3 => 3, 5 => 3 }, MyCounter.numbers_count(a, b))
  end

  def test_skip_insertion_nils
    a = [nil, [nil, [nil, [5, nil, [1, nil]]]], 3, 5, [[nil, nil], 1]]
    b = [1, [3, [5, nil]], 3]
    assert_equal({ 1 => 3, 3 => 3, 5 => 3 }, MyCounter.numbers_count(a, b))
  end

  def test_count_nothing
    a = []
    b = []
    assert_equal({}, MyCounter.numbers_count(a, b))
  end

  def test_count_only_one_array
    a = [1, 2, 3]
    b = []
    assert_equal({ 1 => 1, 2 => 1, 3 => 1 }, MyCounter.numbers_count(a, b))

    a = []
    b = [3, 2, 1]
    assert_equal({ 1 => 1, 2 => 1, 3 => 1 }, MyCounter.numbers_count(a, b))
  end
end
