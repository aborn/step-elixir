
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

查看hex信息
```
mix hex.info
```

## publish hex
0. 先注册：mix hex.user register
1. 授权: mix hex.user auth
2. 发布: mix hex.publish
3. 发布doc: mix hex.docs

```shell
➜  eeb git:(master) mix hex.publish
** (Mix) No authorized user found. Run 'mix hex.user auth'
➜  eeb git:(master) mix hex.user auth
Username: aborn
Password:
Generating API key...
➜  eeb git:(master) mix hex.publish
...
Before publishing, please read Hex Code of Conduct: https://hex.pm/docs/codeofconduct
Proceed? [Yn] Y
[#########################] 100%
Published at https://hex.pm/packages/eeb/0.1.0
Don't forget to upload your documentation with `mix hex.docs`
➜  eeb git:(master)
➜  eeb git:(master) mix hex.docs
Docs successfully generated.
View them at "doc/index.html".
[#########################] 100%
Published docs for eeb 0.1.0
Hosted at http://hexdocs.pm/eeb/0.1.0/
```

## 安装hex的mirror
[hex的镜像](https://hex.pm/docs/mirrors)
mix hex.config cdn_url https://s3-ap-southeast-1.amazonaws.com/s3-asia.hex.pm
mix hex.config cdn_url https://s3-eu-west-1.amazonaws.com/s3-eu.hex.pm
mix hex.config cdn_url https://s3.amazonaws.com/s3.hex.pm

## 编译出错
编译项目的时候出现以下错误：
```
Crash dump is being written to: erl_crash.dump...*** stack smashing detected ***: /usr/lib/erlang/erts-7.2/bin/beam terminated
```
查看下erl_crash.dump（这个文件可能不在当前目录，在deps/查找）文件，发现以下提示：
```
Slogan: eheap_alloc: Cannot allocate 147852528 bytes of memory (of type "old_heap").
```
内存不够！！

## 启动
mix run --no-halt
