using System;
using System.Collections.Generic;

using VSW.Core.Models;

namespace VSW.Lib.Models
{
    public class ModCurrencyEntity : EntityBase
    {
        
        #region Autogen by VSW

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Symbol { get; set; }

        [DataInfo]
        public decimal ExchangeRate { get; set; }

        #endregion

    }

    public class ModCurrencyService : ServiceBase<ModCurrencyEntity>
    {

        #region Autogen by VSW

        private ModCurrencyService()
            : base("[Mod_Currency]")
        {

        }

        private static ModCurrencyService _Instance = null;
        public static ModCurrencyService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModCurrencyService();

                return _Instance;
            }
        }

        #endregion

        public ModCurrencyEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}