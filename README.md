#### 项目名就是分支名

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

* 例如: template-admin 模板分支

```shell
# 1.
git clone --branch template-admin git@github.com:yydswanghai/code-730-projects-for-vue3.git
```

```shell
# 2.
git clone git@github.com:yydswanghai/code-730-projects-for-vue3.git

git checkout template-admin
```