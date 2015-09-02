defmodule VersionUtilTest do
  use ExUnit.Case, async: true

  test "VersionUtils.compare" do
    assert VersionUtil.compare("1.1", "1.0.1") === 1
  end
end

