#import <Cocoa/Cocoa.h>
/*大部分讲解Cocoa编程的书都会用到Xcode和interface builder，这两个工具的结合是开发Cocoa应用程序的最佳选择， 但是当中往往隐藏了许多细节的东西，为了对Cocoa的运作方式有更好的了解，我决定用代码来实现一些Interface Builder中Nib文件实现的部分功能，以此来研究Cocoa的运作方式。

下面我们先看看这个最简单的HelloWin的源代码。*/

int main(int argc, char* argv[])
{
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    NSApplication* app = [NSApplication sharedApplication];
	
    //Create the main window
    NSRect rc = NSMakeRect(0, 0, 800, 600);
    NSUInteger uiStyle = NSTitledWindowMask | NSResizableWindowMask | NSClosableWindowMask;
    NSBackingStoreType backingStoreStyle = NSBackingStoreBuffered;
    NSWindow* win = [[NSWindow alloc] initWithContentRect:rc styleMask:uiStyle backing:backingStoreStyle defer:NO];
    [win setTitle:@"HelloWin Test"];
    [win makeKeyAndOrderFront:win];
    [win makeMainWindow];
	
    //Start the event loop by calling NSApp run
    [NSApp run];
    [pool drain];
    return 0;
}

/*
你会发现这个程序在Dock上面没有图标，在菜单栏上没有菜单， 虽然你可以关掉这个窗口， 但是在终端的提示中可以看到这个应用程序没有退出， 现在在终端按ctrl＋C结束这个应用程序。

下面来具体看一下这个简单的程序，首先我们import了Cocoa这个Framework，然后创建了一个NSAutoreleasePool的实例，接下来我们通过NSApplication的类方法sharedApplication得到了一个NSApplication对象，并将这个对象赋给一个NSApplication类的实例， 其实这个赋值是不需要的， 因为在调用sharedApplication的时候， Cocoa设置了另外一个全局的NSApplication对象的实例， NSApp，所以你可以看到在后面调用run方法的Receiver是NSApp，而没有用app。所以你可以简单的在这里直接调用
[NSApplication sharedApplication];
以后在需要NSApplication对象的时候直接使用NSApp就可以了。

在得到了NSApp之后，程序开始创建窗口，因为这个是窗口也是程序的主窗口（mainWindow), 所以在创建这个窗口的时候，针对窗口的styleMask也需要满足一定的条件。如果一个窗口想成为主窗口，必须是具有标题(NSTitleWidowMask)或者拥有可改变大小属性(NSResizableWindowMask)。另外如果你希望这个窗口能够被关掉，那么NSClosableWindowMask也是需要的，否则尽管这个窗口能显示出来， 但是你会发现标题栏上的关闭按钮是灰色的。

在初始化窗口之后，通过setTitle设置窗口的标题，对makeKeyAndOrderFront:的调用是一个关键，因为一个窗口想成为mainWindow,必须是可见的，在调用这个方法之后，我们就可以通过makeMainWindow方法来让这个窗口成为程序的主窗口。

在有了主窗口之后， 我们可以调用NSApplication的run方法来启动程序的消息循环，到这时应用程序就开始运行了， 也能接受各种应用程序或者窗口的事件了。
这里有个地方需要提示一下，我们在代码中看到设定的初始Rect起点是（0，0），但是却显示在屏幕的左下角，这个问题是因为Mac上缺省的坐标系与 Windows下面的不同，Mac上的坐标系原点在屏幕的左下角，所以整个屏幕是出于第一象限的，这与我们在中学时候学到的知识是一致的，以后会讲到这个问题的。

不过目前这个程序不能关闭，这是因为我们还没有处理相应的事件来让应用程序退出*/
