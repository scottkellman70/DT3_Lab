using System;
using System.Diagnostics;
using System.IO;
using System.Web.UI;

namespace DT3_Lab
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCreateFile_Click(object sender, EventArgs e)
        {
            /*string userName = Environment.UserName;
            string machineName = Environment.MachineName;
            string _directoryName = @"\\" + machineName + @"\c\Users\" + userName + @"\Desktop\Cases\987654321";

            ProcessStartInfo p = new ProcessStartInfo
            {
                FileName = "net.exe",
                WindowStyle = ProcessWindowStyle.Normal,
                Arguments = " share c=c: /grant:everyone,FULL",
                UseShellExecute = true
            };
            _ = Process.Start(p);

            ProcessStartInfo p2 = new ProcessStartInfo
            {
                FileName = "net.exe",
                WindowStyle = ProcessWindowStyle.Normal,
                Arguments = @" use w: \\" + machineName + @"\c\Users\OCONUS4\Desktop\Cases",
                UseShellExecute = true
            };
            _ = Process.Start(p2);

            if (!Directory.Exists(_directoryName))
            {
                Directory.CreateDirectory(_directoryName);
            }*/
        }
    }
}