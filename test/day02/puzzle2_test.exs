defmodule Adventofcode2021.Day02.Puzzle2Test do
  use ExUnit.Case, async: true

  alias Adventofcode2021.Day02.Puzzle2

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

    assert Puzzle2.convert_input(file_stream) == expected
  end

  test "follow_course/1" do
    course = [
      {:forward, 3},
      {:down, 4},
      {:forward, 3},
      {:up, 4},
      {:down, 4}
    ]

    assert Puzzle2.follow_course(course) == {6, 12, 4}
  end

  test "dive/1" do
    assert Puzzle2.dive(@path) == 72
  end
end
