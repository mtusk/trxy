using Foundation;

namespace trxy.MacOS.Models
{
    public class TestResult : NSObject
    {
        public string Id { get; set; }
        public string TestId { get; set; }
        public string Name { get; set; }
        public string TestClassName { get; set; }
        public string Outcome { get; set; }
    }
}
