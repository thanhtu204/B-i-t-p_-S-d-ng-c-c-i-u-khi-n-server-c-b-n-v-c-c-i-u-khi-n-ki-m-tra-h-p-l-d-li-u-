<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKyThanhVien.aspx.cs" Inherits="DuAnLamQuen.DangKyThanhVien" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <title></title>
 
</head>
    <style>
        /* Style for the form container */
.container {
    width: 80%;
    margin: 0 auto;

}

/* Style for the form headings */
h1 {
     background-color: #28a745;
    color: #fff;
    padding: 10px;
    margin-top: 20px;
}

/* Style for the form labels */
label {
    font-weight: bold;
}

/* Style for the form input fields */
.form-control {
    width: 100%;
    margin-bottom: 10px;
    padding: 8px;
    border: 1px solid #ced4da;
    border-radius: 4px;
}

/* Style for the submit button */
.btn-success {
    background-color: #28a745;
    color: #fff;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
}

.btn-success:hover {
    background-color: #218838;
}

/* Style for the form row */
.row {
    margin-bottom: 20px;
}

/* Style for the form column */


/* Style for the border */
.border-primary {
    border: 1px solid #007bff;
    border-radius: 5px;
}
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
        .container {
    width: 80%;
    margin: 0 auto;
}

.row {
    display: flex; /* Use flexbox to make the columns align horizontally */
}

.col-md-6 {
    padding: 20px;
}
bllKetQua{

}

/* Adjust the width of the columns */
.col-md-6.border-right {
    flex: 1; /* Allow the column to grow to fill available space */
}

.col-md-6:last-child {
    border-left: 1px solid #007bff; /* Add a border between the columns */
}

/* Style for the border */
.border-primary {
    border: none; /* Remove the border from the container */
}

/* Style for the "Thông tin cá nhân" section */
#profile-section {
    background-color: #28a745;
    color: #fff;
    padding: 10px;
    margin-top: 20px;
}

#profile-section h1 {
    margin: 0;
}

#profile-section .bg-success {
    background-color: transparent; /* Remove the background color */
    color: #28a745; /* Change the text color */
}

#profile-section .form-group {
    margin-top: 10px; /* Adjust the margin */
}
#bllKetQua {
    color: #6f42c1; /* Purple text color */
    font-family: Arial, sans-serif; /* Specify font family */
    font-size: 16px; /* Adjust font size */
    font-weight: bold; /* Make text bold */
}
 
    </style>
      
<body>
    <form id="form1" runat="server">
        <h1 class="text-center text-danger">HỒ SƠ ĐĂNG KÝ</h1>
        <div class="container p-3 my-3">
            <div class="row border border-primary">
                <div class="col-md-6 border-right">
                    <h1 class="bg-success text-white">Thông tin đăng nhập</h1>
                    <div class="form-group">
                        <label for="txtTen">Tên đăng nhập:</label>
                        <asp:TextBox ID="txtTen" CssClass="form-control" runat="server" MaxLength="16" OnTextChanged="txtTen_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn chưa nhập tên đăng nhập!!!" ForeColor="Red" ControlToValidate="txtTen">(*)</asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="revTenDangNhap" runat="server" ErrorMessage="Tên đăng nhập không hợp lệ !" ControlToValidate="txtTen" ValidationExpression="[\d|\w|!|&|_]{8}[\d|\w|!|&|_]+" ForeColor="#FF0066"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="txtPass">Mật khẩu:</label>
                        <asp:TextBox type="password" CssClass="form-control" ID="txtPass" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn chưa nhập  mật khẩu!!!!" ForeColor="Red" ControlToValidate="txtPass">(*)</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtPass" ErrorMessage="Nhập kiểu dữ liệu số" ForeColor="#CC3300" Type="Integer" Operator="DataTypeCheck" ValueToCompare="0">(*)</asp:CompareValidator>
                    </div>
                    <div class="form-group">
                        <label for="txtNhapLaiPass">Nhập lại mật khẩu:</label>
                        <asp:TextBox type="password" CssClass="form-control" ID="txtNhapLaiPass" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bạn chưa nhập lại mật khẩu!!!!" ForeColor="Red" ControlToValidate="txtNhapLaiPass">(*)</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtNhapLaiPass" ErrorMessage="Nhập kiểu dữ liệu số" ForeColor="#CC3300" Type="Integer" Operator="DataTypeCheck" ValueToCompare="0">(*)</asp:CompareValidator>
                        <asp:CompareValidator ID="cpvNLMK0" runat="server" ErrorMessage="Nhập lại mật khẩu không đúng!" ControlToCompare="txtNhapLaiPass" ControlToValidate="txtPass" ForeColor="#FF0066"></asp:CompareValidator>
                    </div>
                    <h1 class="bg-success text-white">Thông tin cá nhân</h1>
                    <div class="form-group">
                        <label for="txtHoTen">Họ tên khách hàng:</label>
                        <asp:TextBox ID="txtHoTen" CssClass="form-control" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Bạn  chưa nhập họ tên!!!" ForeColor="Red" ControlToValidate="txtHoTen">(*)</asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="txtNgaySinh">Ngày sinh</label>
                        <asp:DropDownList ID="ddlNgay" runat="server" Width="20%"></asp:DropDownList>/
                       <asp:DropDownList ID="ddlThang" runat="server" Width="20%"></asp:DropDownList>/
                       <asp:DropDownList ID="ddlNam" runat="server" Width="20%"></asp:DropDownList>

                    </div>
                    <div class="form-group">
                        <label for="txtEmail">Email:</label>
                        <asp:TextBox type="email" CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Bạn chưa nhập email!!!!" ForeColor="Red" ControlToValidate="txtEmail">(*)</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rfvEmail" runat="server"
     ErrorMessage="Email không hợp lệ" ControlToValidate="txtEmail" ForeColor="#FF0066" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <label for="txtThuNhap">Thu nhập:</label>
                    <asp:TextBox ID="txtThuNhap" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Bạn chưa nhập thu nhập!!!" ForeColor="Red" ControlToValidate="txtThuNhap">(*)</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtNhapLaiPass" ErrorMessage="Nhập kiểu dữ liệu số" ForeColor="#CC3300" Type="Double" Operator="DataTypeCheck" ValueToCompare="0">(*)</asp:CompareValidator>
                     <asp:RangeValidator ID="rvdThuNhap" runat="server" ErrorMessage="Thu nhập từ 1.000.000vnd đến 5.000.0000vnd" ControlToValidate="txtThuNhap" ForeColor="#FF0066" MaximumValue="50000000" MinimumValue="1000000" Type="Integer"></asp:RangeValidator>


                    <div class="form-group">
                        <label for="txtGioiTinh">Giới tính:</label>
                        <asp:CheckBox ID="CheckGioiTinh" runat="server" Text="Nam" Checked="true"    />

                    </div>
                    <div class="form-group">
                        <label for="txtDiaChi">Địa chỉ:</label>
                        <asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Bạn chưa nhập địa chỉi!!!" ForeColor="Red" ControlToValidate="txtDiaChi">(*)</asp:RequiredFieldValidator>

                    </div>
                    <div class="form-group ">
                        <label for="txtDienThoai" class="mr -10" >Điện thoại:</label>
                        <asp:TextBox ID="txtDienThoai" type="number" runat="server" Width="186px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Bạn chưa nhập số điện thoại!!!" ForeColor="Red" ControlToValidate="txtDienThoai">(*)</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="txtDienThoai" ErrorMessage="Nhập kiểu dữ liệu số" ForeColor="#CC3300" Type="Integer" Operator="DataTypeCheck" ValueToCompare="0">(*)</asp:CompareValidator>
                    </div>
                    <asp:Button CssClass="btn btn-success m-5" ID="Button1" runat="server" Text="Đăng ký" OnClick="Button1_Click" />

                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />

                </div>
                <div class="col-md-6" id="profile">
    <h1>Hồ sơ khách hàng</h1>
    <asp:Label ID="bllKetQua" runat="server"></asp:Label>
</div>
                
            </div>
           


        </div>
    </form>
</body>
</html>
