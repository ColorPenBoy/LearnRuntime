# LearnRuntime
runtime学习笔记
####基本概念的理解（如有错误请指正，随着理解加深会补充修改）
Runtime的主要作用：

* 对象生成
* 动态绑定
* 动态识别
* 归结到底，Runtime最大的作用是代码解耦，使代码易扩展

```
面试的时候经常会有面试官问道“谈下你对runtime的理解”，这个时候我们就要对runtime做一下简洁准确的总结：

我的粗浅理解 -> OC语言，分为编译时、运行时两部本。runtime是负责运行时部分的，它是将C语言转化为面向对象语言的扩展。

```

```
Objective-C 是消息传递机制（NOT函数调用），每个学习Runtime的人都避免不了接触这个概念。而消息，只有在运行时才会和实现函数绑定起来。

1、编译阶段：只是确定了要向Receiver对象发送的message，但是没有发送。（就像写了地址贴了邮票的信件，放在邮局中，没有送出一样）

2、运行阶段：消息发送（邮递员出发，按照地址送信）

因此，编译阶段完全不知道方法是否实现和方法是怎样实现的，基于这样的机制，才会出现很多APP编译通过跑起来，出现Crush

```
####名词解释
1、message -> 一种抽象（函数名称 + 参数列表）

2、method -> 存放实现代码

3、selector -> （方法选择器）通过SEL描述特定的message，用来检查方法。（P.S 等同于每个人的身份证号，SEL是每个方法的身份证号）

4、IMP函数指针 -> implementation 当发起一个消息时，有IMP指针决定了最终执行哪段代码。

####Runtime Demo
1、CountdownButton - runtime解决button重复点击问题

在获取短信验证码按钮设计时，为了防止用户不停的点击获取验证码，要求每隔60s，按钮才能恢复可以点击状态。

2、BlockAlertView - 为UIAlertView增加Block回调

虽然，目前iOS已经全面舍弃UIAlertView改用UIAlertViewController，但是透过这个古老的Demo，还能学习到一点runtime的使用思想。

3、ORM ：JSON -> Model

4、使用动态方法解析，实现dynamic属性
