<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NeedNameWebApp.Default" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QR Code Sample</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/popper.js"></script>
    <script src="Scripts/bootstrap.bundle.js"></script>
    
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
      <div class="jumbotron">
        <h1>QR Code Creation Sample</h1>

        <div>
            <input id="data" type="text" value="Enter QR-Code data"/>
            <div style="padding-top:25px;"></div>
            <div id="qrcode"></div>
        </div>

          </div>
        </main>

    
    <script src="js/qrcodefunction.js"></script>
    <script src="js/qrcode.js"></script>
</body>
</html>
