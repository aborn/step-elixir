defmodule EnvUtilsTest do
  use ExUnit.Case, async: true

  test "test isBetaEnv func should to true" do
    assert EnvUtils.isBetaEnv() === true    
  end
end

