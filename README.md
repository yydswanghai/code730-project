#### 项目名就是分支名

```shell
# 1.
git clone --branch [分支] [git地址]
```

```shell
# 2.
git clone [git地址]

git checkout [分支]
```

* 例如

```shell
# 1.
git clone --branch vue3 git@github.com:yydswanghai/code730-projects.git
```

```shell
# 2.
git clone git@github.com:yydswanghai/code730-projects.git

git checkout vue3
```