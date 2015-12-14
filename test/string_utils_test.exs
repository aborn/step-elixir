defmodule StepElixir.StringUtilsTest do
  alias StepElixir.StringUtils
  use ExUnit.Case, async: true

  test "test takePrefix" do
    assert StringUtils.takePrefix("ab中 def", "ab中 ") === "def";
  end
end
