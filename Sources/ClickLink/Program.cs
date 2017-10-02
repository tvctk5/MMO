using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClickLink
{
    class Program
    {
        static void Main(string[] args)
        {
            //http://dienlanh24h.vn/vn/Quang-cao.aspx

            do
            {
                Random rnd1 = new Random();
                var t = rnd1.Next(2000, 10000);
                //if(t > 1000)
                //    t = (int)(t/4);

                //if(t > 1000)
                //    t = 500;

                System.Diagnostics.Process.Start("http://dienlanh24h.vn/vn/Quang-cao.aspx");
                System.Threading.Thread.Sleep(10000 + t);
            } while (true);

        }
    }
}