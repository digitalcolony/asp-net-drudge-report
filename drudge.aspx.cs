DataTable dt = new DataTable();
dt.Columns.Add("title", Type.GetType("System.String"));
dt.Columns.Add("link", Type.GetType("System.String"));

// ASP.NET Article of the Day
string rssURL = "https://www.asp.net/rss/dailyarticles";

XmlDocument doc = new XmlDocument();
doc.XmlResolver = null;
doc.Load(rssURL);

// display a different image based upon day of week
int dayOfWeek = (int)DateTime.Now.DayOfWeek;
// ADD your own images below
switch (dayOfWeek)
{
    case 0:
        imgHeader.ImageUrl = "";
        break;
    case 1:
        imgHeader.ImageUrl = "";
        break;
    case 2:
        imgHeader.ImageUrl = "";
        break;
    case 3:
        imgHeader.ImageUrl = "";
        break;
    case 4:
        imgHeader.ImageUrl = "";
        break;
    case 5:
        imgHeader.ImageUrl = "";
        break;
    default:
        imgHeader.ImageUrl = "";
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
