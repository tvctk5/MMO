using System;
using System.Web;
using System.ComponentModel;
using System.Data;
using System.Collections.Generic;

namespace VSW.Lib.Global
{
    public class ConvertTool
    {
        /// <summary>
        /// Chuyển đổi kiểu Double sang dạng tiền
        /// 
        /// CanTV       2012/09/21      Tạo mới
        /// </summary>
        /// <param name="objValue"></param>
        /// <param name="DecimalNumber"></param>
        /// <returns></returns>
        public static string ConvertToMoney(object objValue, int DecimalNumber = 0)
        {
            string sValue = objValue.ToString();
            sValue = sValue.Replace(" ", string.Empty);
            try
            {
                return String.Format("{0:C" + DecimalNumber.ToString() + "}", Convert.ToDouble(sValue)).Replace("$", "").Replace("£", "");
            }
            catch (Exception)
            { return sValue; }
        }

        public static int ConvertToInt32(object obj)
        {
            int retVal = 0;

            try
            {
                if (obj == null || obj == DBNull.Value || string.IsNullOrEmpty(ConvertToString(obj)))
                    return 0;

                retVal = Convert.ToInt32(obj);
            }
            catch
            {
                retVal = 0;
            }

            return retVal;
        }

        public static bool CheckInt32(object obj)
        {
            int retVal;
            try
            {
                retVal = Convert.ToInt32(obj);
                return true;
            }
            catch
            {
                retVal = 0;
                return false;
            }
        }

        public static Double ConvertToDouble(object obj)
        {
            Double retVal = 0;

            try
            {
                retVal = Convert.ToDouble(obj);
            }
            catch
            {
                retVal = 0;
            }

            return retVal;
        }

        public static bool CheckToDouble(object obj)
        {
            try
            {
                Convert.ToDouble(obj);
                return true;
            }
            catch
            {

                return false;
            }

            return true;
        }

        public static decimal ConvertToDecimal(object obj)
        {
            decimal retVal = 0;

            try
            {
                retVal = Convert.ToDecimal(obj);
            }
            catch
            {
                retVal = 0;
            }

            return retVal;
        }

        public static bool ConvertToBoolean(object obj)
        {
            bool retVal = false;

            try
            {
                retVal = Convert.ToBoolean(ConvertToInt32(obj));
            }
            catch
            {
                retVal = false;
            }

            return retVal;
        }

        public static DateTime ConvertToDateTime(object obj)
        {
            DateTime retVal;
            try
            {
                retVal = Convert.ToDateTime(obj);
            }
            catch
            {
                retVal = DateTime.Now;
                ////return new DateTime();
                //return null;
            }
            if (retVal == new DateTime(1, 1, 1)) return DateTime.Now;

            return retVal;
        }

        public static bool ConvertToDateTime(object obj, ref object objOut)
        {
            DateTime retVal;
            try
            {
                retVal = Convert.ToDateTime(obj);
                objOut = retVal;
                return true;
            }
            catch
            {
                retVal = new DateTime();
                return false;
            }
        }

        public static string ConvertToMoney_VN(object objValue, int DecimalNumber = 0)
        {
            try
            {
                string sValue = objValue.ToString();
                sValue = sValue.Replace(" ", "");

                if (0 < Convert.ToDouble(sValue) && Convert.ToDouble(sValue) <= 1)
                    return sValue;

                sValue = String.Format("{0:C" + DecimalNumber.ToString() + "}", Convert.ToDouble(sValue)).Replace("$", "").Replace("£", "");
                sValue = sValue.Replace(",", "@");
                sValue = sValue.Replace(".", ",");
                sValue = sValue.Replace("@", ".");

                return sValue;
            }
            catch (Exception)
            { return ""; }
        }

        public static string ConvertToString(object obj)
        {
            string retVal;

            try
            {
                if (obj == null)
                    return string.Empty;

                retVal = Convert.ToString(obj);
            }
            catch
            {
                retVal = String.Empty;
            }

            return retVal;
        }

        public static string ConvertListStringToString(dynamic Data)
        {
            if (Data == null)
                return string.Empty;

            string sData = string.Empty;

            try
            {
                foreach (var item in Data)
                {
                    sData = "," + Data.ID;
                }

                sData = sData.Trim(',');
            }
            catch
            {
                sData = string.Empty;
            }

            return sData;
        }

        public static string ConvertListStringToString(List<string> ListDataString)
        {
            if (ListDataString == null)
                return string.Empty;

            string sData = string.Empty;

            try
            {
                foreach (var item in ListDataString)
                {
                    sData = "," + item;
                }

                sData = sData.Trim(',');
            }
            catch
            {
                sData = string.Empty;
            }

            return sData;
        }

        public static string ConvertListStringToString(List<int> ListDataInt)
        {
            if (ListDataInt == null)
                return string.Empty;

            string sData = string.Empty;

            try
            {
                foreach (var item in ListDataInt)
                {
                    sData = "," + item;
                }

                sData = sData.Trim(',');
            }
            catch
            {
                sData = string.Empty;
            }

            return sData;
        }

        /// <summary>
        /// Kiểm tra xem sản phẩm có khuyến mại hay không
        /// TRUE: Đang khuyến mại | FALSE: Không khuyến mại
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public static bool CheckSaleOff(VSW.Lib.Models.ModProduct_InfoEntity item)
        {
            try
            {
                // Xem có khuyến mại hay không
                if (item.SaleOff == false)
                    return false;

                // Chưa có ngày bắt đầu
                if (CheckDateIsNull(item.StartDate))
                    return false;

                // So với ngày hiện tại
                if (item.StartDate > DateTime.Now)
                    return false;

                // Không có ngày kết thúc --> Vẫn khuyến mại
                if (CheckDateIsNull(item.FinishDate))
                    return true;

                // Ngày kết thúc đã nhỏ hơn ngày hiện tại
                if (item.FinishDate < DateTime.Now)
                    return false;

                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Kiểm tra xem Datetime có null hay không
        /// </summary>
        /// <param name="dateInput"></param>
        /// <returns></returns>
        public static bool CheckDateIsNull(DateTime dateInput)
        {
            if (dateInput == null)
                return true;

            if (dateInput.Year == 0001 && dateInput.Month == 01 && dateInput.Day == 01)
                return true;

            return false;
        }

        public static string GetMd5Sum(string str)
        {
            System.Text.Encoder encoder = System.Text.Encoding.Unicode.GetEncoder();
            byte[] bytes = new byte[str.Length * 2];
            encoder.GetBytes(str.ToCharArray(), 0, str.Length, bytes, 0, true);
            byte[] buffer2 = new System.Security.Cryptography.MD5CryptoServiceProvider().ComputeHash(bytes);
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            for (int i = 0; i < buffer2.Length; i++)
            {
                builder.Append(buffer2[i].ToString("X2"));
            }
            return builder.ToString();
        }

        public static bool DoSendMail(string strDisplayName, string strToAddress, string strSubject, string strBody, int port, string host, string sUserName, string sPassword)
        {
            try
            {
                System.Net.Mail.MailAddress tmail = new System.Net.Mail.MailAddress(strToAddress);
                System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient(host);
                if ((sUserName != "") && (sPassword != ""))
                {
                    client.Credentials = new System.Net.NetworkCredential(sUserName, sPassword);
                    client.EnableSsl = true;
                    client.Port = port;
                    client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network; 

                    System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
                    //hiển thị tên khi gửi mail
                    if (strDisplayName == "")
                        strDisplayName = sUserName + " | " + strSubject;
                    System.Net.Mail.MailAddress MS = new System.Net.Mail.MailAddress(sUserName, strDisplayName);

                    mailMessage.To.Add(strToAddress);
                    mailMessage.From = MS;
                    mailMessage.Subject = strSubject;
                    mailMessage.Body = strBody;
                    mailMessage.IsBodyHtml = true;
                    mailMessage.Priority = System.Net.Mail.MailPriority.Normal;

                    client.Send(mailMessage);
                    return true;
                }
                else return false;
            }
            catch (Exception ex)
            { return false; }
        }

        /// <summary>
        /// Lấy key App trong webconfig
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static string GetKeyApp(string key)
        {
            try
            {
                return System.Configuration.ConfigurationManager.AppSettings[key];
            }
            catch
            {
                return string.Empty;
            }
        }
    }
}
