using System;
using System.Net.Mail;

namespace VSW.Lib.Global
{
    public class Mail
    {
        public static void SendMail(string to, string from, string name, string subject, string body)
        {
            MailMessage meg = new MailMessage();

            meg.To.Add(to);
            meg.Subject = subject;
            meg.IsBodyHtml = true;
            meg.BodyEncoding = System.Text.Encoding.UTF8;
            meg.From = new MailAddress(from, name);
            meg.Body = body;

            // GUI MAIL BANG GMAIL
            //SmtpClient client = new SmtpClient("smtp.gmail.com")
            //{
            //    Port = 587,
            //    Credentials = new System.Net.NetworkCredential("xyz@gmail.com", "password"),
            //    EnableSsl = true
            //};


            // GUI MAIL BANG IIS
            SmtpClient client = new SmtpClient();
            client.UseDefaultCredentials = false;
            client.Host = "localhost";
            client.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;


            client.Send(meg);
        }

        //private static void SendWebMail(string sHost, 
        //    int nPort, 
        //    string sUserName, 
        //    string sPassword, 
        //    string sFromName, 
        //    string sFromEmail, 
        //    string sToEmail, 
        //    string sHeader, 
        //    string sMessage, 
        //    bool fSSL)
        //{
        //    try
        //    {
        //        if (sFromName == "") 
        //            sFromName = sFromEmail;

        //        System.Web.Mail.MailMessage Mail = new System.Web.Mail.MailMessage();
        //        Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpserver"] = sHost;
        //        Mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendusing"] = 2;
        //        Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpserverport"] = nPort.ToString();
        //        if (fSSL) Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpusessl"] = "true";

        //        if (sUserName.Length == 0)
        //        {
                   
        //        }
        //        else
        //        {
        //            Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"] = 1;
        //            Mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendusername"] = sUserName;
        //            Mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendpassword"] = sPassword;
        //        }

        //        Mail.To = sToEmail;
        //        Mail.From = "\"" + sFromName + "\" <" + sFromEmail + ">"; 
        //        Mail.Subject = sHeader;
        //        Mail.Body = sMessage;
        //        Mail.BodyFormat = System.Web.Mail.MailFormat.Html;
        //        Mail.BodyEncoding = System.Text.Encoding.UTF8;

        //        System.Web.Mail.SmtpMail.SmtpServer = sHost;
        //        System.Web.Mail.SmtpMail.Send(Mail);
        //    }
        //    catch (Exception ex)
        //    {
        //        VSW.Lib.Global.Error.Write("SendWebMail", ex);
        //    }
        //}
    }
}
