DataTable dt = new DataTable();
dt.Columns.Add("title", Type.GetType("System.String"));
dt.Columns.Add("link", Type.GetType("System.String"));

// ASP.NET Article of the Day
string rssURL = "http://asp.net/community/articles/rss.ashx";

XmlDocument doc = new XmlDocument();
doc.XmlResolver = null;
doc.Load(rssURL);

// display a different image based upon day of week
int dayOfWeek = (int)DateTime.Now.DayOfWeek;

switch (dayOfWeek)
{
    case 0:
        imgHeader.ImageUrl = "http://criticalmas.smugmug.com/photos/117793421-S.jpg";
        break;
    case 1:
        imgHeader.ImageUrl = "http://criticalmas.smugmug.com/photos/118708221-S.jpg";
        break;
    case 2:
        imgHeader.ImageUrl = "http://criticalmas.smugmug.com/photos/95113678-S.jpg";
        break;
    case 3:
        imgHeader.ImageUrl = "http://criticalmas.smugmug.com/photos/91872258-S.jpg";
        break;
    case 4:
        imgHeader.ImageUrl = "http://criticalmas.smugmug.com/photos/91842649-S.jpg";
        break;
    case 5:
        imgHeader.ImageUrl = "http://criticalmas.smugmug.com/photos/79938653-S.jpg";
        break;
    default:
        imgHeader.ImageUrl = "http://criticalmas.smugmug.com/photos/92103181-S.jpg";
        break;
}        

XmlNode oNode = doc.DocumentElement;
XmlNodeList oNodeList = oNode.SelectNodes("channel/item");

for (int itemCount = 0; itemCount < oNodeList.Count; itemCount++)
{
    string title = oNodeList[itemCount].SelectSingleNode("title").InnerText;
    string link = oNodeList[itemCount].SelectSingleNode("link").InnerText;

    if (itemCount == 0)
    {
        // top story

        hypTopStory.Text = title.ToUpper();
        hypTopStory.NavigateUrl = link;
    }
    else
    {
        DataRow dr = dt.NewRow();
        dr["title"] = title;
        dr["link"] = link;
        dt.Rows.Add(dr);
    }
}
dlStories.DataSource = dt;
dlStories.DataBind();
