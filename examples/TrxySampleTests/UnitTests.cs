using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace TrxySampleTests
{
    [TestClass]
    public class UnitTests
    {
        [TestMethod]
        public void ShouldPass()
        {
            Assert.IsTrue(true);
        }

        [TestMethod]
        public void ShouldFail()
        {
            Assert.IsTrue(false);
        }

        [TestMethod]
        public void ShouldFailNoisily()
        {
            var a = NLipsum.Core.LipsumGenerator.Generate(3);
            var b = NLipsum.Core.LipsumGenerator.Generate(3);

            Assert.AreEqual(a, b);
        }

        [TestMethod]
        [ExpectedException(typeof(Exception))]
        public void ShouldThrowAnException()
        {
            throw new Exception();
        }

        [TestMethod]
        public void ShouldFailWhenThrowingANoisyException()
        {
            throw new NoisyException();
        }
    }

    public class NoisyException : Exception
    {
        public override string StackTrace
        {
            get
            {
                return NLipsum.Core.LipsumGenerator.Generate(3);
            }
        }
    }
}
