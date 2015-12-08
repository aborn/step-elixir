
## 安装hex
看到这种安装报错，GFW！！！

```shell
➜  ~  mix local.hex
Are you sure you want to install archive "https://s3.amazonaws.com/s3.hex.pm/installs/1.1.0/hex-0.9.0.ez"? [Yn] Y
** (Mix) httpc request failed with: {:failed_connect, [{:to_address, {'s3.amazonaws.com', 443}}, {:inet, [:inet], :closed}]}
Could not fetch archive at:
    https://s3.amazonaws.com/s3.hex.pm/installs/1.1.0/hex-0.9.0.ez
Please download the archive above manually to your current directory and run:
mix archive.install ./hex-0.9.0.ez
```

只能先通过浏览器代理下载下来，再安装

```shell
➜  software  mix archive.install ./hex-0.9.0.ez
Are you sure you want to install archive "./hex-0.9.0.ez"? [Yn] Y
* creating /Users/aborn/.mix/archives/hex-0.9.0.ezx
```
