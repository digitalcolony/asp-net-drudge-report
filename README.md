# Create the Drudge Report Look (`ASP.NET`)

Create a Drudge Report looking site using `ASP.NET`. 

Matt Drudge started The Drudge Report while working the graveyard shift at 7-11. He was at the store when the newspapers first arrived and most of the world was asleep. He was able to parlay that first access to the news into creating one of the most popular sites on the internet. Read his book Drudge Manifesto if you wish to learn more about his rise to fame.

Unlike Matt Drudge, I have no desire to get up super early and go through endless newspapers to create a hand-edited HTML page of my favorite links. Fortunately for me, we now have RSS feeds. This article will mix the ASP.NET article of the day RSS feed with the Drudge look and feel to create the ASP.NET Report.

## Reverse Engineer the Drudge Report

The Drudge Report is basically a 3 column layout with an image logo and a top story link. The layout will vary over time, but that is the usual template. For the 3 column news look, we will use the asp:DataList control.

## Drudge Font and Image

The logo was created using the Impact font at 100 points and Italic. In PhotoShop, under Blending Options (right mouse click Text layer), add a Drop Shadow. Play with the color, width and direction of the shadow.

Drudge uses a large upper-case Arial font for the top story and Courier for the 3-column stories. All links are black.

## The Code

The RSS feed is loaded into an XmlDocument. The first story in the RSS feed will be designated the top story. The rest of the stories will be loaded into a DataTable which is binded to the asp:DataList.

Since `ASP.NET` code tends not to be photogenic, I’ve hard-coded links to some of my vacation photos for the top image. To mix it up a little, it will change depending upon the day of the week.

## The `ASP.NET` Page

### Caching

When pulling RSS feeds, it is wise to be considerate of the bandwidth of your host site. Don’t pull a fresh feed with every Page Load. Add an OutputCache directive to your page. For the ASP.NET Report example, I know that this feed updates daily, so I can set the Duration to 86400 which is the number of seconds in one day.

```aspx
<%@ OutputCache Duration="86400" VaryByParam="none" %>
```

## Better Than Drudge

Unlike The Drudge Report which uses awful HTML, our `ASP.NET` version is both XHTML and CSS compliant. It also validates under Section 508.
