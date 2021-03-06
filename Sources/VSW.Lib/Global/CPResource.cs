using System;
using System.Globalization;

using VSW.Core.Models;

namespace VSW.Lib.Global
{
    public static class CPResource 
    {
        private static string CurrentCode
        {
            get { return CultureInfo.CurrentCulture.Name; }
        }

        public static string GetValue(string code)
        {
            return GetValue(code, string.Empty);
        }

        public static string GetValue(string code, string defalt)
        {
            IniResourceService ResourceService = new IniResourceService(System.Web.HttpContext.Current.Server.MapPath("~/" + VSW.Core.Web.Setting.Sys_CPDir + "/Views/Lang/" + CurrentCode + ".ini"));
            return ResourceService.VSW_Core_GetByCode(code, defalt);
        }
    }
}