using System;
using System.Collections.Generic;
using AppKit;
using Foundation;
using trxy.MacOS.Models;

namespace trxy.MacOS
{
    [Register("Document")]
    public class Document : NSDocument
    {
        private Content content = new Content(new List<TestResult>());
        private ViewController viewController;

        public Document(IntPtr handle) : base(handle)
        {
            // Add your subclass-specific initialization here.
        }

        public override void WindowControllerDidLoadNib(NSWindowController windowController)
        {
            base.WindowControllerDidLoadNib(windowController);
            // Add any code here that needs to be executed once the windowController has loaded the document's window.
        }

        [Export("autosavesInPlace")]
        public static bool AutosaveInPlace()
        {
            return true;
        }

        public override void MakeWindowControllers()
        {
            // Override to return the Storyboard file name of the document.
            var storyboard = NSStoryboard
                .FromName("Main", null)
                .InstantiateControllerWithIdentifier("Document Window Controller");

            var windowController = (NSWindowController)storyboard;

            this.AddWindowController(windowController);

            if (windowController.ContentViewController is ViewController)
            {
                this.viewController = windowController.ContentViewController as ViewController;
                this.viewController.RepresentedObject = this.content;
            }
        }

        public override NSData GetAsData(string typeName, out NSError outError)
        {
            // Insert code here to write your document to data of the specified type. 
            // If outError != NULL, ensure that you create and set an appropriate error when returning nil.
            throw new NotImplementedException();
        }

        public override bool ReadFromData(NSData data, string typeName, out NSError outError)
        {
            outError = null;

            this.content.Read(data);

            return true;
        }
    }
}
