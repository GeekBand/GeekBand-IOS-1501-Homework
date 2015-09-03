title: 'GeekBand Test 2'

date: 2015-08-22 22:00:00

---


## 做习题涉及和想到的点
>我的习题代码 [Github](https://github.com/gewill/GeekBand-IOS-1501-Homework/tree/new-branch/G2015010176/iOS%20APP%20Development)

- Lazy load image in table view: Apple example
[LazyTableImagesor](https://developer.apple.com/library/ios/samplecode/LazyTableImages/Introduction/Intro.html) or [SDWebImage](https://github.com/rs/SDWebImage)
- Try NSURLSession 
- 望文生义的能力很重要
- 拿到一个项目代码，start step into from initial view，了解了整个 app 的运行时的结构或循环，才能理解整个 app 的逻辑框架。
- 框架>目录>类>方法>属性/实例变量，这样子下来整个一个 App 就跑起来了，入口就是 main.m，然后各种设置属性和发消息，基于事件驱动的这一层理解运行时是比较合适的颗粒。
- Lazy load iamge use AFNetworking

```objc
    [cell.appImage setImageWithURL:[NSURL URLWithString:[mediumImage valueForKeyPath:@"label"]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
``` 

## 习题完成情况

### 第二题

完成 1.0:

- 实现 table view 自带刷新
- 添加 Cellular 开关，并能够检查网络连接方式，并提醒用户
- NSURLSession 下载 JSON

> 2015-08-26

进行中 1.1: 

- Lazy load iamge use AFNetworking

>2015-09-03 11:36:32

### Further Reading

- [深入理解 RunLoop](http://blog.ibireme.com/2015/05/18/runloop/#apple)

	> 通过 Runloop 讲解了 NSURLConnection 的工作过程
	> iOS 中，关于网络请求的接口自下至上有如下几层:

```objc
CFSocket
CFNetwork       ->ASIHttpRequest
NSURLConnection ->AFNetworking
NSURLSession    ->AFNetworking2, Alamofire
``` 
- CFSocket 是最底层的接口，只负责 socket 通信。
- CFNetwork 是基于 CFSocket 等接口的上层封装，ASIHttpRequest 工作于这一层。
- NSURLConnection 是基于 CFNetwork 的更高层的封装，提供面向对象的接口，AFNetworking 工作于这一层。
- NSURLSession 是 iOS7 中新增的接口，表面上是和 NSURLConnection 并列的，但底层仍然用到了 NSURLConnection 的部分功能 (比如 com.apple.NSURLConnectionLoader 线程)，AFNetworking2 和 Alamofire 工作于这一层。
	
- [Network Reachability Manager](http://cocoadocs.org/docsets/AFNetworking/2.6.0/index.html)
	>AFNetworkReachabilityManager monitors the reachability of domains, and addresses for both WWAN and WiFi network interfaces.

	>Do not use Reachability to determine if the original request should be sent.
You should try to send it.
You can use Reachability to determine when a request should be automatically retried.
Although it may still fail, a Reachability notification that the connectivity is available is a good time to retry something.
Network reachability is a useful tool for determining why a request might have failed.
After a network request has failed, telling the user they're offline is better than giving them a more technical but accurate error, such as "request timed out."
- See also [WWDC 2012 session 706, "Networking Best Practices](https://developer.apple.com/videos/wwdc/2012/#706").
- [SDWebImage](https://github.com/rs/SDWebImage)
	>AFNetworking takes advantage of Foundation URL Loading System caching using NSURLCache, as well as a configurable in-memory cache for UIImageView and UIButton, which uses NSCache by default. Caching behavior can be further specified in the caching policy of a corresponding NSURLRequest. Other SDWebImage features, like background decompression of image data is also provided by AFNetworking.

	>If you're already using AFNetworking and just want an easy async image loading category, the built-in UIKit extensions will probably fit your needs.
	
- [AFNetworking](https://github.com/AFNetworking/AFNetworking) example
	>iOS example 非常经典，包含了使用方法和一个 UITableView实用框架。
- [AFNetworking 2.0 Tutorial](http://www.raywenderlich.com/59255/afnetworking-2-0-tutorial)
	
## 测试题原文
### 1. 做一个类似微信的聊天的 tableview(tablewviewcell 自定义) 。只需要 显示文字内容和用户头像(不需要做输入部分,文字内容自己模拟)
1 必须实现文字内容背景  
2 背景的长度和高度要合适  
3 发生者和接受者左右布局区分  
### 2. 使用 http api 请求解析 json or xml 数据,并且使用 tableview 展示出来 http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=10/json or xml

**提示**:  

1. 可以使用第三方库,也可以使用 SDK 基础库  
2. 显示网络下载数据时间  
3. 比较 xml or json 解析效率  
4. tableviewcell自定义  

注:

* 希望大家在一周内上传答案到极客班 github 个人的作业文件夹(以学生编 号命名)
* IOS 专业 Github 目录: https://github.com/GeekBand/GeekBand-IOS-1501-Homework
* 老师会在直播环节点评此题
* 作业的最终批改和成绩公布会在结业时进行。
