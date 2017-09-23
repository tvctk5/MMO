using System;

using VSW.Lib.MVC;
using VSW.Lib.Models;

namespace VSW.Lib.Controllers
{
    [ModuleInfo(Name = "ĐK : Tin tức - Subpage", Code = "CNewsSubPage", IsControl = true, Order = 4)]
    public class CNewsSubPageController : Controller
    {
        [VSW.Core.MVC.PropertyInfo("Chuyên mục", "Type|News")]
        public int MenuID;

        //[VSW.Core.MVC.PropertyInfo("Loại tin", "ConfigKey|Mod.NewsType")]/*,SelectType|Checkbox*/
        //public string Type = string.Empty;

        [VSW.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 5;

        [VSW.Core.MVC.PropertyInfo("Tiêu đề")]
        public string Title = string.Empty;

        public override void OnLoad()
        {
            // Không hiển thị module
            if (ShowModule.Equals((int)VSW.Lib.Global.EnumValue.Activity.FALSE))
            {
                ViewBag.ShowModule = false;
                return;
            }

            // Thông tin cần thiết của module
            ViewBag.ModuleId = ModuleId;

            if (VSW.Lib.Global.Session.Exists("MenuID"))
            {
                MenuID = Convert.ToInt32(VSW.Lib.Global.Session.GetValue("MenuID"));
                VSW.Lib.Global.Session.Remove("MenuID");
            }

            int Id = 0;
            if (VSW.Lib.Global.Session.Exists("NewsID"))
            {
                Id = Convert.ToInt32(VSW.Lib.Global.Session.GetValue("NewsID"));
                VSW.Lib.Global.Session.Remove("NewsID");
            }

            ViewBag.Data = ModNewsService.Instance.CreateQuery()
                                    .Where(o => o.Activity == true)
                                    .Where(Id > 0, o => o.ID != Id)
                                    .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("News", MenuID, ViewPage.CurrentLang.ID))
                                    .OrderByDesc(o => o.Order)
                                    .Take(PageSize)
                                    .ToList();
            ViewBag.Title = Title;
            ViewBag.MenuID = MenuID;
            ViewBag.PageByCategory = SysPageService.Instance.CreateQuery().Where(o => o.MenuID == MenuID).ToSingle();
        }
    }
}
