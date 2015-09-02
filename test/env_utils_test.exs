defmodule EnvUtilsTest do
  use ExUnit.Case, async: true

  test "test isBetaEnv" do
    assert EnvUtils.isBetaEnv() === true
    assert EnvUtils.isProductionEnv() == :false
  end
end

