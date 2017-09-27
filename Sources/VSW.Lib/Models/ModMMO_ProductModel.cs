using System;
using System.Collections.Generic;

using VSW.Core.Models;

namespace VSW.Lib.Models
{
    public class ModMMO_ProductEntity : EntityBase
    {
        
        #region Autogen by VSW

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public string SKU { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string DisplayName { get; set; }

        [DataInfo]
        public string PageTitle { get; set; }

        [DataInfo]
        public string PageDescription { get; set; }

        [DataInfo]
        public string PageKeywords { get; set; }

        [DataInfo]
        public decimal SalePrice { get; set; }

        [DataInfo]
        public decimal DiscountedPrice { get; set; }

        [DataInfo]
        public int DiscountedPercentage { get; set; }

        [DataInfo]
        public decimal DiscountedValue { get; set; }

        [DataInfo]
        public int CurrencyId { get; set; }

        [DataInfo]
        public string Category_LV1 { get; set; }

        [DataInfo]
        public string Category_LV2 { get; set; }

        [DataInfo]
        public string Category_LV3 { get; set; }

        [DataInfo]
        public int Category_LV1_Id { get; set; }

        [DataInfo]
        public int Category_LV2_Id { get; set; }

        [DataInfo]
        public int Category_LV3_Id { get; set; }

        [DataInfo]
        public string CategoryPath { get; set; }

        [DataInfo]
        public string Image1 { get; set; }

        [DataInfo]
        public string Image2 { get; set; }

        [DataInfo]
        public string Image3 { get; set; }

        [DataInfo]
        public string Image4 { get; set; }

        [DataInfo]
        public string Image5 { get; set; }

        [DataInfo]
        public string Url { get; set; }

        [DataInfo]
        public string RedirectUrl { get; set; }

        [DataInfo]
        public string Brand { get; set; }

        [DataInfo]
        public int BrandId { get; set; }

        [DataInfo]
        public bool Status { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int LangID { get; set; }

        [DataInfo]
        public int UserId { get; set; }

        [DataInfo]
        public int CountClick { get; set; }

        [DataInfo]
        public int MarketplaceId { get; set; }

        #endregion      
  
        private WebMenuEntity _oMenu = null;
        public WebMenuEntity getMenu()
        {
            if (_oMenu == null && MenuID > 0)
                _oMenu = WebMenuService.Instance.GetByID(MenuID);

            if (_oMenu == null)
                _oMenu = new WebMenuEntity();

            return _oMenu;
        }      
  
        private WebMenuEntity _oLang = null;
        public WebMenuEntity getLang()
        {
            if (_oLang == null && LangID > 0)
                _oLang = WebMenuService.Instance.GetByID_Cache(LangID);

            if (_oLang == null)
                _oLang = new WebMenuEntity();

            return _oLang;
        }

    }

    public class ModMMO_ProductService : ServiceBase<ModMMO_ProductEntity>
    {

        #region Autogen by VSW

        private ModMMO_ProductService()
            : base("[MMO_Product]")
        {

        }

        private static ModMMO_ProductService _Instance = null;
        public static ModMMO_ProductService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModMMO_ProductService();

                return _Instance;
            }
        }

        #endregion

        public ModMMO_ProductEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}