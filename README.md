# HTTabBarController
* 对UITabBarController做特定的设置修改，省去传统初始化过程
* 在保留原有的基础上，可自定义TabBar样式（例如高度，选项图，背景，title等）

编写实用的类似UITabBarController的库，这里主要是介绍如何让cocoapods支持自己的库
## 如何让cocoapods支持自己的库
#### 准备工作
* 前提已经安装过cocoapods
* 用户名邮箱注册，为github的用户名和绑定邮箱：

	```
	pod trunk register 邮箱 '用户名' --verbose 
	```
	如果报错，一般是pod版本低或者ruby的版本低。
	
	查看是否注册成功：``` pod trunk me  ```。成功会出现如下提示：
	
	```
	- Name:   xxx
	- Email:  xxx@163.com
	- Since:  August 17th, 03:50
	- Pods:   None
	- Sessions:
	- August 17th, 03:50 - April 21st, 2018 01:55. IP: x.x.x.x
	```
* 登录GitHub创建自己的工程。

	勾选```Initialize this repository with a README```，分别在	```Add.gitignore```中选择```Objective-C```，在```Add a 	license```中选择```MIT License```，最后创建工程。
#### 给项目工程打上tag

```
// 本地打tag
git tag '1.0.1'

// push tag 到远程
git push --tags

//删除本地tag
git tag -d xxx    

//删除远程tag，然后重新打tag

git push origin --delete tag xxx  
```

	
#### 创建.podspec文件

在项目工程中创建 .podspec文件，并把库文件放在其同一目录下（具体结构可参照：[HTTabBarController](https://github.com/PureRunner/HTTabBarController.git)）。创建命令：``` pod spec create HTUITabBarController```.


#### 编辑.podspec文件

```
// 特别说明，里面的注释是博主为了大家知道什么意思加的，实际使用时一定要去掉
Pod::Spec.new do |s|
// 文件名
s.name = ''
//版本
s.version = '1.0.0'
// 描述信息
s.summary = 'A view like UIAlertView on iOS.'
// 这里的主页自己随便写
s.homepage = 'https://github.com/PureRunner/HTTabBarController' 
// 作者
s.authors = { '用户名' => '邮箱' }
// 资源路径（gitHub上的项目链接），tag必须与工程tag一致。
s.source = { :git => 'https://github.com/PureRunner/HTTabBarController.git', :tag => '1.0.0' }
//ARC模式
s.requires_arc = true
// license，我们用MIT
s.license = 'MIT'
// 允许的最低系统使用版本
s.ios.deployment_target = '8.0'
// 库文件路径
s.source_files = 'HTUITabBarController/*'

#s.framework  = 'UIKit','Foundation'
// 依赖库
#s.dependency 'SDWebImage'
end

```

注意：为避免一些编辑符号错误，提倡使用sublime Text打开。

#### 验证.podspec文件
```
pod lib lint LHHAlertView.podspec
```
如果出现如下提示说明验证通过：

```
-> xxxx (1.0.0)

xxxx passed validation
```

#### 提交.podspec文件到github的仓库中

```
//如果有警告 后面加 --allow-warnings
pod trunk push HTUITabBarController 
```
这一步可能会因为pods版本低而失败，根据提示信息更新pods, 还有可能会```There was an error fetching your info from trunk: execution expired``` 这是网络超时的原因。
成功会出现🎉标志的。


#### 搜索自己提交的库

```
pod search xxx

```
如果提交成功search结果出现
```
Unable to find a pod with name, author, summary, or description matching 'xxx'
```
解决：

```
1. cd ~/Library/Caches/CocoaPods/
2. rm -rf search_index.json
3. 重新执行pod search xxx（如果还是出现相同错误，可先 pod setup后，再pod search xxx）

```

#### 说明的坑：
* 编辑符号错误
* 注意s.source中的tag版本与打tag版本
* s.source_files 引用错误





















