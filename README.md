# LearnRuntime
runtime学习笔记

* 对象生成
* 动态绑定
* 动态识别


1、CountdownButton - runtime解决button重复点击问题

在获取短信验证码按钮设计时，为了防止用户不停的点击获取验证码，要求每隔60s，按钮才能恢复可以点击状态。

2、BlockAlertView - 为UIAlertView增加Block回调

虽然，目前iOS已经全面舍弃UIAlertView改用UIAlertViewController，但是透过这个古老的Demo，还能学习到一点runtime的使用思想。