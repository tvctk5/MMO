using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using VSW.Lib.Models;
using VSW.Lib;
using VSW.Lib.LinqToSql;
using System.Data.Linq;
using System.Xml;

namespace Import_Lazada
{
    class Program
    {
        const int MarketplaceId = 1;
        const string PathFile = @"C:\Users\Administrator\Downloads\feed.csv"; // @"C:\Users\CanTV\Downloads\feed_100.csv";
        static void Main(string[] args)
        {
            var data = (new Program()).GetListDataFromText(PathFile);
            //string Text_Format = @"<CATEGORY>
            //                            <SKU>{0}</SKU>
            //                            <Name>{1}</Name>
            //                            <SalePrice>{2}</SalePrice>
            //                            <DiscountedPrice>{3}</DiscountedPrice>
            //                            <DiscountedPercentage>{4}</DiscountedPercentage>
            //                            <Category_LV1>{5}</Category_LV1>
            //                            <Category_LV2>{6}</Category_LV2>
            //                            <Category_LV3>{7}</Category_LV3>
            //                            <Image1>{8}</Image1>
            //                            <Image2>{9}</Image2>
            //                            <Image3>{10}</Image3>
            //                            <Image4>{11}</Image4>
            //                            <Image5>{12}</Image5>
            //                            <RedirectUrl>{13}</RedirectUrl>
            //                            <Brand>{14}</Brand>
            //                            <CategoryPath>{15}</CategoryPath>
            //                            <DiscountedValue>{16}</DiscountedValue>
            //                            <DisplayName>{17}</DisplayName>
            //                            <MarketplaceId>{18}</MarketplaceId>
            //                            <PageTitle>{19}</PageTitle>
            //                            <Category_LV1_Code>{20}</Category_LV1_Code>
            //                            <Category_LV2_Code>{21}</Category_LV2_Code>
            //                            <Category_LV3_Code>{22}</Category_LV3_Code>
            //                        </CATEGORY>";
            //Text_Format = Text_Format.Replace(System.Environment.NewLine, string.Empty).Replace(" ", string.Empty);
        }

        public List<ModMMO_ProductEntity> GetListDataFromText(string path)
        {
            var listData = new List<ModMMO_ProductEntity>();

            int i = 0;
            int CountAllRow = 0;
            var item = new ModMMO_ProductEntity();
            string Data_Product = string.Empty;
            string Data_Category = string.Empty;
            string Data_Brand = string.Empty;
            bool bolInsertCategory_Brand = true;

            string Text_Format_Product = @"<PRODUCT>
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
                                        <Category_LV1_Code>{20}</Category_LV1_Code>
                                        <Category_LV2_Code>{21}</Category_LV2_Code>
                                        <Category_LV3_Code>{22}</Category_LV3_Code>
                                    </PRODUCT>";


            string Text_Format_Category = @"<CATEGORY>
                                        <Category_LV1>{0}</Category_LV1>
                                        <Category_LV2>{1}</Category_LV2>
                                        <Category_LV3>{2}</Category_LV3>
                                        <Category_LV1_Code>{3}</Category_LV1_Code>
                                        <Category_LV2_Code>{4}</Category_LV2_Code>
                                        <Category_LV3_Code>{5}</Category_LV3_Code>
                                    </CATEGORY>";

            string Text_Format_Brand = @"<BRAND>
                                        <Name>{0}</Name>
                                        </BRAND>";
            // Format text
            Text_Format_Product = Text_Format_Product.Replace(System.Environment.NewLine, string.Empty).Replace(" ", string.Empty);
            Text_Format_Category = Text_Format_Category.Replace(System.Environment.NewLine, string.Empty).Replace(" ", string.Empty);
            Text_Format_Brand = Text_Format_Brand.Replace(System.Environment.NewLine, string.Empty).Replace(" ", string.Empty);

            bool bolContinue = true;
            List<Category> lstCategory = new List<Category>();
            List<Brand> lstBrand = new List<Brand>();

            foreach (var itemLine in File.ReadLines(path))
            {
                if (i <= 0)
                {
                    i++;
                    continue;
                }

                // Count All Row
                CountAllRow++;

                item = GetItemFromLine(itemLine);
                if (item == null)
                    continue;

                //if (item.SKU == "BO906OTAA2S7D5VNAMZ-4784195")
                //    bolContinue = false;

                //if (bolContinue)
                //{
                //    i = 1;
                //    continue;
                //}

                //listData.Add(item);
                var c_lv1 = XmlEscape(item.Category_LV1);
                var c_lv2 = XmlEscape(item.Category_LV2);
                var c_lv3 = XmlEscape(item.Category_LV3);

                var c_lv1_Code = VSW.Lib.Global.Data.GetCode(item.Category_LV1);
                var c_lv2_Code = VSW.Lib.Global.Data.GetCode(item.Category_LV2);
                var c_lv3_Code = VSW.Lib.Global.Data.GetCode(item.Category_LV3);

                var b_Name = XmlEscape(item.Brand);

                if (!lstCategory.Where(o => o.LV1 == item.Category_LV1 && o.LV2 == item.Category_LV2 && o.LV3 == item.Category_LV3).Any())
                {
                    Data_Category += string.Format(Text_Format_Category,
                    c_lv1,
                    c_lv2,
                    c_lv3,
                    c_lv1_Code,
                    c_lv2_Code,
                    c_lv3_Code);

                    lstCategory.Add(new Category() { LV1 = item.Category_LV1, LV2 = item.Category_LV2, LV3 = item.Category_LV3 });
                }

                // Brand
                if (!lstBrand.Where(o => o.Name == item.Brand).Any())
                {
                    Data_Brand += string.Format(Text_Format_Brand, b_Name);

                    lstBrand.Add(new Brand() { Name = item.Brand });
                }

                // Product
                Data_Product += string.Format(Text_Format_Product,
                XmlEscape(item.SKU),
                XmlEscape(item.Name),
                item.SalePrice,
                item.DiscountedPrice,
                item.DiscountedPercentage,
                c_lv1,
                c_lv2,
                c_lv3,
                XmlEscape(item.Image1),
                XmlEscape(item.Image2),
                XmlEscape(item.Image3),
                XmlEscape(item.Image4),
                XmlEscape(item.Image5),
                XmlEscape(item.RedirectUrl),
                b_Name,
                XmlEscape(item.CategoryPath),
                item.DiscountedValue,
                XmlEscape(item.DisplayName),
                item.MarketplaceId,
                XmlEscape(item.PageTitle),
                c_lv1_Code,
                c_lv2_Code,
                c_lv3_Code);

                i++;
                if (i == 50001)
                {
                    i = 1;

                    // Insert data
                    InsertToDB(Data_Product);
                    Data_Product = string.Empty;
                }

            }

            if (!string.IsNullOrEmpty(Data_Product))
            {
                // Insert data
                InsertToDB(Data_Product); // InsertToDB(Data);
                Data_Product = string.Empty;
            }

            if (!string.IsNullOrEmpty(Data_Category))
            {
                // Insert data
                InsertCategoryToDB(Data_Product); // InsertToDB(Data);
                Data_Category = string.Empty;
            }

            if (!string.IsNullOrEmpty(Data_Brand))
            {
                // Insert data
                InsertBrandToDB(Data_Brand); // InsertToDB(Data);
                Data_Brand = string.Empty;
            }
            return listData;
        }

        private ModMMO_ProductEntity GetItemFromLine(string text_line)
        {
            if (string.IsNullOrEmpty(text_line))
                return null;

            string[] Arr_Split = new string[16]; // text_line.Split(',');
            var defaultArr = text_line.Split(',');
            if (defaultArr.Length == 16)
                Arr_Split = defaultArr;
            else
            {
                var columnValue = "";
                string tempValue = string.Empty;
                var SaveList = new List<string>();

                for (int i = 0; i < defaultArr.Length; i++)
                {
                    columnValue = defaultArr[i];

                    if (columnValue.Length == 1 && columnValue == "\"")
                    {
                        if (!string.IsNullOrEmpty(tempValue))
                        {
                            SaveList.Add(tempValue.Trim('"'));
                            tempValue = string.Empty;
                            continue;
                        }
                    }

                    if ((columnValue.StartsWith("\"") && columnValue.EndsWith("\"")) ||
                        (!columnValue.StartsWith("\"") && !columnValue.EndsWith("\"") && string.IsNullOrEmpty(tempValue)))
                    {
                        SaveList.Add(columnValue.Trim('"'));
                    }
                    else
                    {
                        // included
                        if (columnValue.StartsWith("\""))
                        {
                            if (string.IsNullOrEmpty(tempValue))
                                tempValue += columnValue;
                            else
                                tempValue += ", " + columnValue;
                        }
                        // Not include
                        else
                        {
                            if (columnValue.EndsWith("\""))
                            {
                                if (!string.IsNullOrEmpty(tempValue))
                                    tempValue += ", " + columnValue;
                                else
                                    tempValue = columnValue;

                                SaveList.Add(tempValue.Trim('"'));
                                tempValue = string.Empty;
                            }
                            // Not containt "
                            else
                            {
                                if (!string.IsNullOrEmpty(tempValue))
                                    tempValue += ", " + columnValue;
                                else
                                    SaveList.Add(columnValue);
                            }
                        }
                    }
                }

                // Return to Array
                Arr_Split = SaveList.ToArray();
            }

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

        public static string XmlEscape(string unescaped)
        {
            XmlDocument doc = new XmlDocument();
            XmlNode node = doc.CreateElement("root");
            node.InnerText = unescaped;
            return node.InnerXml;
        }

        public static string XmlUnescape(string escaped)
        {
            XmlDocument doc = new XmlDocument();
            XmlNode node = doc.CreateElement("root");
            node.InnerXml = escaped;
            return node.InnerText;
        }
        private void InsertCategoryToDB(string Data)
        {
            try
            {
                Data = string.Format("<ROOT>{0}</ROOT>", Data);
                File.WriteAllText("Category.txt", Data);

                VSW.Lib.LinqToSql.DbDataContext db = VSW.Lib.LinqToSql.DbExecute.Create(true);
                var respones = db.AddCategory_Lazada(Data, 1);
            }
            catch (Exception ex)
            {
            }
        }

        private void InsertBrandToDB(string Data)
        {
            try
            {
                Data = string.Format("<ROOT>{0}</ROOT>", Data);
                File.WriteAllText("Brand.txt", Data);

                VSW.Lib.LinqToSql.DbDataContext db = VSW.Lib.LinqToSql.DbExecute.Create(true);
                var respones = db.AddCategory_Lazada(Data, 1);
            }
            catch (Exception ex)
            {
            }
        }
        private void InsertToDB(string Data)
        {
            try
            {
                Data = string.Format("<ROOT>{0}</ROOT>", Data);
                File.WriteAllText(string.Format("Product{0}.txt", DateTime.Now.ToString("yyyy_MM_dd_hh_mm_ss_ffff")), Data);
            }
            catch (Exception ex)
            {
                
            }
            //Data = string.Format("<ROOT>{0}</ROOT>", Data);
            //VSW.Lib.LinqToSql.DbDataContext db = VSW.Lib.LinqToSql.DbExecute.Create(true);
            //var respones = db.AddProduct_Lazada(Data, 1);
        }
    }

    public class Category
    {
        public string LV1 { get; set; }
        public string LV2 { get; set; }
        public string LV3 { get; set; }
    }
    public class Brand
    {
        public string Name { get; set; }
    }
}
