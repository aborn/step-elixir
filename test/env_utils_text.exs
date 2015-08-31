defmodule EnvUtilsTest do
  use ExUnit.Case, async: true

  test "test isBetaEnv func" do
    assert EnvUtils.isBetaEnv() === true    
  end
end

