using AppKit;
using Foundation;

namespace trxy.MacOS
{
    [Register("AppDelegate")]
    public class AppDelegate : NSApplicationDelegate
    {
        public AppDelegate()
        {
        }

        public override void DidFinishLaunching(NSNotification notification)
        {
            // Insert code here to initialize your application
        }

        public override void WillTerminate(NSNotification notification)
        {
            // Insert code here to tear down your application
        }

        [Export("applicationShouldOpenUntitledFile:")]
        public override bool ApplicationShouldOpenUntitledFile(NSApplication sender)
        {
            return false;
        }
    }
}
