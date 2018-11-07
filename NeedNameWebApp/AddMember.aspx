<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="NeedNameWebApp.AddMember" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/popper.js"></script>
    <script src="Scripts/bootstrap.bundle.js"></script>

    <title></title>
    <style>
        .container {
            width: 80%;
            padding: 25px 25px 25px 25px;
        }
    </style>
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
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Admin
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
    <form id="form1" runat="server">
        <div class="container">
            
            <div class="form-group col-sm-12">
            <h1>Add Member</h1>
                </div>

            <div class="form-group col-sm-3">
                <label for="memberID">Member ID</label>
                <asp:TextBox type="text" class="form-control" ID="memberID" runat="server" />
            </div>


            <div class="form-group col-sm-8">
                <label for="memberName">Member Name</label>
                <asp:TextBox type="text" class="form-control" ID="trainingCompany" runat="server" />
            </div>

            <div class="form-group col-sm-8">
                <asp:Button runat="server" class="btn btn-primary" ID="btnSaveData" Text="Save Data" OnClick="btnSaveData_Click" />
            </div>
        </div>
        <!-- End of Container -->




    </form>
</body>
</html>

