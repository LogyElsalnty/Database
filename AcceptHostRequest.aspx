<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcceptHostRequest.aspx.cs" Inherits="M3.AcceptHostRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Host Club Name:"></asp:Label>
        &nbsp;<asp:TextBox ID="hostclubname" runat="server"></asp:TextBox>
        <br />
           <asp:Label ID="Label2" runat="server" Text="Guest Club Name:"></asp:Label>
        &nbsp;<asp:TextBox ID="guestclubname" runat="server"></asp:TextBox>
        <br />
            <asp:Label ID="Label3" runat="server" Text="Start Time:"></asp:Label>
        &nbsp;<asp:TextBox ID="starttime" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="acceptrequest" runat="server" Text="Accept" OnClick="acceptrequest_Click" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" HorizontalAlign="Center" ShowHeaderWhenEmpty="True">
            <Columns>
                <asp:BoundField DataField="Host Club Name" HeaderText="Host Club Name" SortExpression="Host Club Name" />
                <asp:BoundField DataField="Guest Club Name" HeaderText="Guest Club Name" SortExpression="Guest Club Name" />
                <asp:BoundField DataField="Start Time" HeaderText="Start Time" SortExpression="Start Time" />
                <asp:BoundField DataField="Host Request Status" HeaderText="Host Request Status" SortExpression="Host Request Status" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SystemConnectionString %>" SelectCommand="SELECT host.name AS [Host Club Name], guest.name AS [Guest Club Name], m.startTime AS [Start Time], h.status AS [Host Request Status] FROM stadiumManager AS s INNER JOIN hostRequest AS h ON s.stadiumManagerId = h.managerId INNER JOIN match AS m ON m.matchID = h.matchId INNER JOIN club AS guest ON m.guestClubId = guest.clubId INNER JOIN club AS host ON m.hostClubId = host.clubId INNER JOIN stadium ON stadium.stadiumId = s.stadiumId WHERE (s.username = @username)">
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="user" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="home" runat="server" Text="Home Page" OnClick="home_Click" />
        <br />
    </form>
</body>
</html>
