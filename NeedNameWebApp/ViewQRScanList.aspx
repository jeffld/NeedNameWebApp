<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewQRScanList.aspx.cs" Inherits="NeedNameWebApp.ViewQRScanList" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QR Code Sample</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/popper.js"></script>
    <script src="Scripts/bootstrap.bundle.js"></script>
    <link href="css/gridview.css" rel="stylesheet" />
    
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">NeedName</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Default.aspx">Build QRCode</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Admin
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="AddmemberSkill.aspx">Add Member Skill</a>
            <a class="dropdown-item" href="Addmember.aspx">Add Member</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="ViewQRScanList.aspx">View Recent QR Code Scans</a>
        </div>
      </li>

    </ul>
  </div>
</nav>
    <div style="padding-top:25px;"></div>
    <main role="main" class="container">
        
         <h3>Recent QR Code Scans</h3><br />
            <div>
          <form runat="server">
                <asp:GridView ID="GridView1" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" CellSpacing="5" AutoGenerateColumns="false" Width="442px"  onrowcommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="RowNo" HeaderText="Queue Number" />
                        <asp:BoundField DataField="MemberName" HeaderText="Member Name" />
                        <asp:BoundField DataField="ScanDateTime" HeaderText="ScanDateTime" />
                        <asp:BoundField DataField="ProcessFlag" HeaderText="Process Flag" />
                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                            <asp:Button ID="showMember" runat="server" 
                                CausesValidation="false" 
                                CommandName="ShowMember" 
                                Text="Process" 
                                CommandArgument='<%# Eval("MemberID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <%-- Here panel placed for contain Custom button for paging --%>
                <asp:Panel ID="Panel1" runat="server"></asp:Panel>
         </form>        

            </div>      

    </main>
    

</body>
</html>


