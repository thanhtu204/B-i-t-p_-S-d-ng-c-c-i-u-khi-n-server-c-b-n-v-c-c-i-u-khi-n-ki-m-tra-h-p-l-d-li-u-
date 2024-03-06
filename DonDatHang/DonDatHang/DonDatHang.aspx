<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DonDatHang.aspx.cs" Inherits="DonDatHang.DonDatHang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<link href="Content/bootstrap.min.css" rel="stylesheet" />
<head runat="server">
    <title></title>
</head>
   <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding-top: 50px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ced4da;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            color: #fff;
        }

        .btn-danger:hover {
            background-color: #bb2d3b;
            border-color: #bb2d3b;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            color: #fff;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #218838;
        }

        .text-center {
            text-align: center;
        }

        .input-group-text {
            background-color: #e9ecef;
            border-color: #ced4da;
        }

        .validation-error {
            color: #cc0000;
        }

    </style>
<body>
    <form id="form1" runat="server" class="container">
        <h1 class="text-center">
            <asp:Label ID="lblTieuDe" runat="server" Text="ĐƠN ĐẶT HÀNG"></asp:Label>
        </h1>
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Khách hàng: "></asp:Label>
            <asp:TextBox ID="txtTenKh" runat="server" CssClass="form-control"></asp:TextBox> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenKh" ErrorMessage="Bạn chưa nhập tên khách hàng!!" ForeColor="#CC0000">(*)</asp:RequiredFieldValidator>
            <br/>
        </div>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Địa chỉ: "></asp:Label>
            <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDiaChi" ErrorMessage="Bạn chưa nhập địa chỉ!" ForeColor="#CC0000">(*)</asp:RequiredFieldValidator>
            <br/>
        </div>
        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Mã số thuế: "></asp:Label>
            <asp:TextBox ID="txtMaSoThue" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMaSoThue" ErrorMessage="Bạn Chưa Nhập Mã Số Thuế!" ForeColor="#CC0000">(*)</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtMaSoThue" ErrorMessage="Nhập kiểu dữ liệu số" ForeColor="#CC3300" Type="Integer" Operator="DataTypeCheck" ValueToCompare="0">(*)</asp:CompareValidator>
            <br/>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <asp:Label ID="Label4" runat="server" Text="Chọn các loại bánh sau:" CssClass="form-label"></asp:Label><br/>
                <asp:DropDownList ID="ddlDoAn" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddlDoAn_SelectedIndexChanged"></asp:DropDownList><br/>
                <br/>
                <div class="input-group mb-3">
                    <asp:Label ID="Label5" runat="server" Text="Số lượng" CssClass="input-group-text"></asp:Label>
                    <asp:TextBox ID="txtSoLuong" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="Label6" runat="server" Text="cái" CssClass="input-group-text"></asp:Label>
                   
                    <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSoLuong" ErrorMessage="Bạn chưa nhập số lượng!!" ForeColor="#CC0000">(*)</asp:RequiredFieldValidator>
            &nbsp;<asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtSoLuong" ErrorMessage="Nhập kiểu dữ liệu số" ForeColor="#CC3300" Type="Integer" Operator="DataTypeCheck" ValueToCompare="0">(*)</asp:CompareValidator>
                   
                </div>
                <asp:Button ID="btnChuyenDuLieu" runat="server" Text=">" CssClass="btn btn-primary" OnClick="btnChuyenDuLieu_Click" />
            </div>
            <div class="col-sm-6">
                <asp:Label ID="Label7" runat="server" Text="Danh sách bánh được đặt" CssClass="form-label"></asp:Label><br/>
                <asp:ListBox ID="lstDoAn" runat="server" CssClass="form-select" SelectionMode="Multiple"></asp:ListBox> <br/>
                <asp:ImageButton ID="btnXoa" runat="server" CssClass="btn btn-danger" OnClick="btnXoa_Click" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </div>
        </div>
        <div class="text-center">
            <asp:Button ID="btnDatHang" runat="server" Text="IN ĐƠN ĐẶT HÀNG" CssClass="btn btn-success" OnClick="btnDatHang_Click" />
        </div>
    </form>
    <asp:Label ID="lblKetQua" runat="server" Text="Label"></asp:Label>
</body>

</html>
