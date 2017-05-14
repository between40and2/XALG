

## struct or class

[WWDC 2016 416 Understanding Swift Performance](https://developer.apple.com/videos/play/wwdc2016/416/), has the right to say which type to use for performance issue.  However in current stage of XALG, Swift performance is not main issue. We chose the struct or class by programming implementation convenience. We will seriously consider Swift performance in next stage of XALG. If you have any thought on this, let us know. Thanks!

Even though Value-semantic struct is popular, however some structure we still choose to use class, simply because class can do subclassing that struct cannot.
