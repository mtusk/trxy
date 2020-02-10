using System.Collections.Generic;
using System.Linq;
using Foundation;

namespace trxy.MacOS.Models
{
    public class Content : NSObject
    {
        public IEnumerable<TestResult> TestResults { get; private set; }

        public Content(IEnumerable<TestResult> testResults)
        {
            this.TestResults = testResults;
        }

        public void Read(NSData data)
        {
            var testResults = new List<TestResult>();

            this.TestResults = testResults;
        }

        public static IEnumerable<TestResult> ParseTrx(string xml)
        {
            var testResults = Enumerable
                .Range(0, 10)
                .Select(i =>
                    new TestResult
                    {
                        Id = $"testId{i}",
                        TestId = $"testTestId{i}",
                        Name = $"testName{i}",
                        TestClassName = "testTestClassName",
                        Outcome = "testOutcome"
                    });

            return testResults;
        }
    }
}
