

极客班iOS应用开发实战测试题二（8月31日）

习题：同学录

>项目源码见 [GitHub](https://github.com/gewill/GeekBand-IOS-1501-Homework/tree/new-branch/G2015010176/%E6%9E%81%E5%AE%A2%E7%8F%ADiOS%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91%E5%AE%9E%E6%88%98%E6%B5%8B%E8%AF%95%E9%A2%98%E4%BA%8C%EF%BC%888%E6%9C%8831%E6%97%A5%EF%BC%89)。
>
>v1.5以后使用 CocoaPods，`.gitignore`包含`/pod`，下载后请 `pod install`。

## 1. 题目要求：

- 实现一个同学录列表，包含姓名、简介和头像等信息。
- 可以添加新的同学，支持拍照添加头像。
- 可以查看每一个的同学详情页。
- 实现存储所有同学的信息。

![Classmates](http://i.imgur.com/kdKYL12.png)

## 2. 实际开发遇到的点：

- Add Parse
- Add iCloud
- input view : https://github.com/slackhq/SlackTextViewController
- 统一的属性命名，vc，db，object
- 各种输入框的逻辑处理和键盘跳出前后 UI 自动调整：http://code.tutsplus.com/tutorials/ios-sdk-keeping-content-from-underneath-the-keyboard--mobile-6103
- 添加删除，编辑功能
- Search
- Sort
- 清晰的项目目录结构
- Dash 集成了 Cocoa Docsets： 如 Realm、FFDB & AFNetworking etc.
- Dash Bookmark 有点用，可惜不能同步到 iOS
- Use Realm
- 学习新的框架或知识点：一看 API，二看 Examples
- Realm query 还需熟悉提高
- Debug 尤其需要提高，思路要清晰，断点可以下多几个，查值要玩转。
- The Realm Browser is [available on the Mac App Store](https://itunes.apple.com/app/realm-browser/id1007457278).
- [SQLite 数据类型](http://www.runoob.com/sqlite/sqlite-data-types.html)
- Updating Objects

```objc
// Updating Objects with primary keys
// This will make properties no settled be NULL
[GWClassmate createOrUpdateInDefaultRealmWithValue:newClassmate];
```
- 两种编辑保存界面: 微信进入编辑的界面，Back 有个Alert确认保存; Phone.app 则是禁用右滑和 Back，显示 Cancel & Done，也是完善的方案。
![Edit View](http://ww2.sinaimg.cn/large/5369602ejw1evo9v2ahltj20ts15p43r.jpg)

- Estimating default values for properties of Classmate

	-  In `Domain Logic`: ClassmateDB.h/m (BEST Solution)
	-  In `Model`: Classmate.h/m, Specify default values. BUT Realm isn't support nil property.
	-  In `View Controller`: if/esle
	-  In `Interface Builder`: Setting a default value. Especially giving a default avatar is a nice solution for user.

	>[RLMPropertyType Constants Reference](http://cocoadocs.org/docsets/Realm/0.95.0/Constants/RLMPropertyType.html)
	
- "To use AVAsset to extract metadata informations, this post is useful." [http://stackoverflow.com/questions/16318821/extracting-mp3-album-artwork-in-ios](http://stackoverflow.com/questions/16318821/extracting-mp3-album-artwork-in-ios)
- [Playing video in iOS](http://jacopretorius.net/2013/02/playing-video-in-ios.html)
- Use Clang-Format -> LLVM (default)

## 3. 项目完成情况：

完成1.0: 

- 基本功能完成
- 列表使用了缩略图，待优化直接保存数据库
- 输入键盘时，View 自动升降一个键盘高度，以保持可见
- 保存是检验用户名，不能为空
- 使用 Realm 数据库
- classmate.h/m 为 Model，四个属性分别为：uuid、name、info & avator
- Using GWDetailViewController as super class to GWShowDetailViewController can easy to create a new view.

> 2015-08-31 20:17:00

完成1.1:

- 使用 FMDB

>把习题同学录的存储 Realm 换成 FMDB，午饭到16：00还没吃，我的学习新的知识的能力还比较低的。需要投入更多时间来学习了。

> 2015-09-01 16:09:00

完成1.2:

- 换回 Realm
- 增加编辑和删除功能

> 2015-09-01 20:00:00

完成1.3:

- 随机添加修改和删除10000个classmate，以测试性能
- Add a tab bar view as root view 
- UI layout like Wechat 
- Set UUID as parimary key 
- Updating Objects With Primary Keys
- 把取消按钮改为 Button，并把 Segue to GWDetailViewController & GWShowDetailViewController， 改为 Modle
- New a manaager class: GWClassmateDB, to abstract most useful SUQD methods and testing methods.

>2015-09-02 18:20:47

完成1.4:

-  Change cell's Accessory form Detail to Disclosure Indicator
-  Specify default values for properties of Classmate.h/m
-  Add Music Tab
-  Add a "red dot badge" on avatars' view for test. 
-  Change the classmates display style. Just looks like WeChat.app.

>2015-09-06 11:43:19

![Classmates v1.4](http://i.imgur.com/2lEu3Og.jpg)

进行中1.5:

- Adapting to MVVM
- [XCTest](http://objccn.io/issue-15-2/)
- Add a 'Edit' Button, and after taped the 'back' button in navigation change to "cancel", add a "Done" in right. Just looks like Phone.app.
- Add Sort by name, and index by initial
- Add Search


## 4. BUG
以下的代码提示越界错误：Terminating app due to uncaught exception 'RLMException', reason: 'Index is out of bounds.'可能的原因：

> 需要注意的是，写入操作会相互阻塞，而且其相对应的进程也会受到影响。这和其他的永久数据存储解决方案是一样的，所以我们建议你使用常用的，也是最有效的方案， 将所有写入放到一个单独的进程中。[https://realm.io/cn/docs/objc/latest/](https://realm.io/cn/docs/objc/latest/)

```objc
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        GWCustomTableViewCell *cell = (GWCustomTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        
        GWDetailViewController *vc = (GWDetailViewController *)segue.destinationViewController;
        
//        vc.userid       = cell.userid;
        vc.name.text    = cell.name.text;

    }
}

```

最终解决方法是修改 Custom Cell 中添加一个 UILabel 的 text 来存储 UUID，并设置为隐藏。并添加使用 Detail Disclosure 测试 NSLog UUID。具体的越界问题，还需要在研究。

## 5. Further Reading

- [rand(3) / random(3) / arc4random(3) / et al.](http://nshipster.com/random/)
- [深入理解 RunLoop](http://blog.ibireme.com/2015/05/18/runloop/#apple)


