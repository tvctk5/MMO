using System;

using VSW.Lib.MVC;
using VSW.Lib.Models;

namespace VSW.Lib.Controllers
{
    [ModuleInfo(Name = "ĐK : M m o_ product", Code = "CMMO_Product", IsControl = true, Order = 50)]
    public class CMMO_ProductController : Controller
    {

        [VSW.Core.MVC.PropertyInfo("Chuyên mục", "Type|MMO_Product")]
        public int MenuID;

        [VSW.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        [VSW.Core.MVC.PropertyInfo("Tiêu đề")]
        public string Title;

        public override void OnLoad()
        {
            ViewBag.Data = ModMMO_ProductService.Instance.CreateQuery()
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("MMO_Product", MenuID, ViewPage.CurrentLang.ID))
                            .OrderByDesc(o => o.ID)
                            .Take(PageSize)
                            .ToList_Cache();

            ViewBag.Title = Title;
        }
    }
}
