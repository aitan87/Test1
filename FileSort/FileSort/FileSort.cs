using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileSort
{
    public class FileSort
    {

        public string[] SortOut(string path,out int count)
        {
            IEnumerable<string> FileNames = from FileName in Directory.GetFiles(path)
                                            orderby (new FileInfo(FileName)).CreationTime 
                                            descending select FileName;
            count = FileNames.Count();
            return FileNames.ToArray();
        }
    }
}
