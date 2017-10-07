<form id="form1" runat="server">

    <div id="parentDIV">
        <div id="headerDIV">

            <asp:Image ID="imgHeader" runat="server" Width="400" Height="300" BorderWidth="1" />

            <div id="topstoryDIV">
                <asp:HyperLink ID="hypTopStory" runat="server" />
            </div>

            <img src="aspnet-report.gif" width="716" height="137" alt="ASP.NET Report" />

        </div>
        <div id="storiesDIV">
            <asp:DataList ID="dlStories" runat="server" RepeatColumns="3" Width="100%" CellPadding="5">

                <ItemTemplate>
                    <a href="<%# Eval(" link ") %>">
                        <%# Eval("title") %>
                    </a>

                    <hr />
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

</form>