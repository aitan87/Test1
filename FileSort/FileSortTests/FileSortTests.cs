using Microsoft.VisualStudio.TestTools.UnitTesting;
using FileSort;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileSort.Tests
{
    [TestClass()]
    public class FileSortTests
    {
        [TestMethod()]
        public void SortOutTest()
        {
            int x = 0;
            string[] Fn;
            FileSort Tx = new FileSort();
           Fn= Tx.SortOut("E:\\360Downloads\\Software\\hotfix", out x);
       
            Assert.Fail();
        }
    }
}