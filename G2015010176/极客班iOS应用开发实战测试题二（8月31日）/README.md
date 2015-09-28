## 习题：同学录

极客班iOS应用开发实战测试题二（8月31日）

### 1.题目要求：

- 实现一个同学录列表，包含姓名、简介和头像等信息。
- 可以添加新的同学，支持拍照添加头像。
- 可以查看每一个的同学详情页。
- 实现存储所有同学的信息。

![Classmates](http://i.imgur.com/kdKYL12.png)

### 2. 项目完成情况：

- 基本功能完成
- 列表使用了缩略图，待优化直接保存数据库
- 输入键盘时，View 自动升降一个键盘高度，以保持可见
- 保存是检验用户名，不能为空
- 使用 Realm 数据库
- classmate.h/m 为 Model，四个属性分别为：uuid、name、info & avator
 
### 3. 实际开发遇到和想到的点：

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
