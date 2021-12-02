defmodule Adventofcode2021.Day02.Puzzle1Test do
  use ExUnit.Case, async: true

  alias Adventofcode2021.Day02.Puzzle1

  @path "test/day02/input_test.txt"

  test "convert_input/1" do
    file_stream = File.stream!(@path, [:utf8], :line)

    expected = [
      {:forward, 3},
      {:down, 4},
      {:forward, 3},
      {:up, 4},
      {:down, 4}
    ]

    assert Puzzle1.convert_input(file_stream) == expected
  end

  test "follow_course/1" do
    course = [
      {:forward, 3},
      {:down, 4},
      {:forward, 3},
      {:up, 4},
      {:down, 4}
    ]

    assert Puzzle1.follow_course(course) == {6, 4}
  end

  test "dive/1" do
    assert Puzzle1.dive(@path) == 24
  end
end
