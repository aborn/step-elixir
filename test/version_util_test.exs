defmodule VersionUtilTest do
  use ExUnit.Case, async: true

  test "whether version is valid" do
    assert VersionUtil.valid?("1.23.0") == :true
    assert VersionUtil.valid?("1.23s") == :false
    assert VersionUtil.validate("1.02.09") == :true
    assert VersionUtil.validate("") == :false
  end
  
  test "version compare test" do
    assert VersionUtil.compare("1.1", "1.0.1") > 0
    assert VersionUtil.compare("1.0.1", "1.0.1.0") == 0
    assert VersionUtil.compare("0.9.9", "1.0") < 0
    assert VersionUtil.compare("0.1s", "0.2s") == 0
    assert VersionUtil.compare("0.1", "0.2s") > 0
    assert VersionUtil.compare("0.1s", "0.2") < 0
  end
end

