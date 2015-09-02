defmodule EnvUtils do
  @moduledoc """
  获得开发环境及与开发环境有关的module
  """

  @doc """
  获得当前的环境,返回字符串
  """
  @spec getCurrentEnv :: String.t
  def getCurrentEnv() do
    file = "/data/webapps/appenv"
    case File.read(file) do
      {:ok, content} ->
        # 得到每行内容的list
        list = Enum.filter(String.split(content, "\n"),
          fn(x) -> String.contains?(x, "deployenv=") end)
      if (length(list) > 0) do
        envList = Enum.filter(String.split(hd(list), "=", trim: true),
          fn(x) -> String.contains?(x, ["qa", "beta", "product", "ppe"]) end)
        hd(envList)
      else
        "beta"      # 默认为beta环境
      end
        # 读取文件失败时，默认为beta环境
        {:error, _} ->
          "beta"    # 默认为beta环境
    end
  end

  @doc """
  判断当前是否为beta环境
  返回的结果一定是boolean类型
  """
  @spec isBetaEnv :: boolean
  def isBetaEnv() do
    env = getCurrentEnv()
    env === "beta" or env === "qa"
  end

  @doc """
  判断当前是否为线上生产环境
  返回的结果一定是boolean类型
  """
  @spec isProductionEnv :: boolean
  def isProductionEnv() do
    env = getCurrentEnv()
    env === "product"
  end
end
