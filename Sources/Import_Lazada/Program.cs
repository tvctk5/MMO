using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using VSW.Lib.Models;

namespace Import_Lazada
{
    class Program
    {
        const int MarketplaceId = 1;
        const string PathFile = @"C:\Users\CanTV\Downloads\feed.csv"; // @"C:\Users\CanTV\Downloads\feed_100.csv";
        static void Main(string[] args)
        {
            var data = (new Program()).GetListDataFromText(PathFile);
        }

        public List<ModMMO_ProductEntity> GetListDataFromText(string path)
        {
            var listData = new List<ModMMO_ProductEntity>();

            // var texts = File.ReadAllLines(path);
            int i = 0;
            var item = new ModMMO_ProductEntity();
            string Data = string.Empty;

            string Text_Format = @"<ITEM>
                                        <SKU>{0}</SKU>
                                        <Name>{1}</Name>
                                        <SalePrice>{2}</SalePrice>
                                        <DiscountedPrice>{3}</DiscountedPrice>
                                        <DiscountedPercentage>{4}</DiscountedPercentage>
                                        <Category_LV1>{5}</Category_LV1>
                                        <Category_LV2>{6}</Category_LV2>
                                        <Category_LV3>{7}</Category_LV3>
                                        <Image1>{8}</Image1>
                                        <Image2>{9}</Image2>
                                        <Image3>{10}</Image3>
                                        <Image4>{11}</Image4>
                                        <Image5>{12}</Image5>
                                        <RedirectUrl>{13}</RedirectUrl>
                                        <Brand>{14}</Brand>
                                        <CategoryPath>{15}</CategoryPath>
                                        <DiscountedValue>{16}</DiscountedValue>
                                        <DisplayName>{17}</DisplayName>
                                        <MarketplaceId>{18}</MarketplaceId>
                                        <PageTitle>{19}</PageTitle>
                                    </ITEM>";
            foreach (var itemLine in File.ReadLines(path))
            {
                if (i <= 0)
                {
                    i++;
                    continue;
                }

                item = GetItemFromLine(itemLine);
                if (item == null)
                    continue;

                //listData.Add(item);
                Data += string.Format(Text_Format,
                    item.SKU,
                    item.Name,
                    item.SalePrice,
                    item.DiscountedPrice,
                    item.DiscountedPercentage,
                    item.Category_LV1,
                    item.Category_LV2,
                    item.Category_LV3,
                    item.Image1,
                    item.Image2,
                    item.Image3,
                    item.Image4,
                    item.Image5,
                    item.RedirectUrl,
                    item.Brand,
                    item.CategoryPath,
                    item.DiscountedValue,
                    item.DisplayName,
                    item.MarketplaceId,
                    item.PageTitle);
            }
            return listData;
        }

        private ModMMO_ProductEntity GetItemFromLine(string text_line)
        {
            if (string.IsNullOrEmpty(text_line))
                return null;

            var Arr_Split = text_line.Split(',');

            var item = new ModMMO_ProductEntity();
            /*
             simple_sku,product_name,sale_price,discounted_price,discounted_percentage,currency,
             * "Category lv1","Category lv2","Category lv3",
             * picture_url,image_url_2,image_url_3,image_url_4,image_url_5,tracking_link,brand
            HA280HLAA2Q7SWVNAMZ-4681910,
             * "Bột tẩy lồng máy giặt Hàn Quốc 450g cao cấp HH569",
             * 120000.00,
             * 32251.00,
             * 73,VND,"Laundry & Cleaning",Cleaning,"Cleaning Products",https://vn-live-01.
             */

            item.SKU = getTextString(Arr_Split[0]);
            item = new ModMMO_ProductEntity()
            {
                SKU = getTextString(Arr_Split[0]),
                Name = getTextString(Arr_Split[1]),
                SalePrice = getPrice(Arr_Split[2]),
                DiscountedPrice = getPrice(Arr_Split[3]),
                DiscountedPercentage = getIntegerType(Arr_Split[4]),
                // Currency
                Category_LV1 = getTextString(Arr_Split[6]),
                Category_LV2 = getTextString(Arr_Split[7]),
                Category_LV3 = getTextString(Arr_Split[8]),
                Image1 = getTextString(Arr_Split[9]),
                Image2 = getTextString(Arr_Split[10]),
                Image3 = getTextString(Arr_Split[11]),
                Image4 = getTextString(Arr_Split[12]),
                Image5 = getTextString(Arr_Split[13]),
                RedirectUrl = getTextString(Arr_Split[14]),
                Brand = getTextString(Arr_Split[15])
            };

            item.CategoryPath = string.Format("{0}>{1}>{2}", item.Category_LV1, item.Category_LV2, item.Category_LV3);
            item.DiscountedValue = (item.SalePrice > item.DiscountedPrice) ? (item.SalePrice - item.DiscountedPrice) : 0;
            item.DisplayName = item.Name;
            item.MarketplaceId = MarketplaceId;
            item.PageTitle = item.Name;

            return item;
        }

        private string getTextString(string value)
        {
            if (string.IsNullOrEmpty(value) || string.IsNullOrWhiteSpace(value))
                return string.Empty;

            if (value.StartsWith("\""))
                return value.Trim('"');

            return value;
        }

        private decimal getPrice(string text)
        {
            text = getTextString(text);
            decimal data = 0;
            if (string.IsNullOrEmpty(text))
                return data;

            if (decimal.TryParse(text, out data))
                return data;

            return 0;
        }

        private int getIntegerType(string text)
        {
            text = getTextString(text);
            int data = 0;
            if (string.IsNullOrEmpty(text))
                return data;

            if (int.TryParse(text, out data))
                return data;

            return 0;
        }
    }
}
