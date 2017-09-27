using System;
using System.Collections.Generic;

using VSW.Core.Models;

namespace VSW.Lib.Models
{
    public class ModMarketplaceEntity : EntityBase
    {
        
        #region Autogen by VSW

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string WebsiteLink { get; set; }

        #endregion

    }

    public class ModMarketplaceService : ServiceBase<ModMarketplaceEntity>
    {

        #region Autogen by VSW

        private ModMarketplaceService()
            : base("[Mod_Marketplace]")
        {

        }

        private static ModMarketplaceService _Instance = null;
        public static ModMarketplaceService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModMarketplaceService();

                return _Instance;
            }
        }

        #endregion

        public ModMarketplaceEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}