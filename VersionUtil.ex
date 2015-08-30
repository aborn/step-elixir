defmodule VersionUtil do
  @moduledoc """
  MAPI 版本号验证和比较的module
  Date: 2015-08-30
  Author: guobao.jiang
  """
  
  @doc """
  查询传入的版本号是否合法
  返回 :true 或 :false
  """
  def validate(version) do
    StringUtils.onlyEnglish(version)
  end
end


IO.puts VersionUtil.validate("1.2")
