using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DuAnLamQuen
{
    public partial class DangKyThanhVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Tạo danh sách ngày
                for (int day = 1; day <= 31; day++)
                {
                    ListItem listItem = new ListItem(day.ToString());
                    ddlNgay.Items.Add(listItem);
                }

                // Tạo danh sách tháng
                string[] months = { "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12" };
                foreach (string month in months)
                {
                    ListItem listItem = new ListItem(month, month);
                    ddlThang.Items.Add(listItem);
                }

                // Tạo danh sách năm
                int currentYear = DateTime.Now.Year;
                for (int year = currentYear; year >= currentYear - 100; year--) // Hiển thị 100 năm trước đến năm hiện tại
                {
                    ListItem listItem = new ListItem(year.ToString(), year.ToString());
                    ddlNam.Items.Add(listItem);
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string kq = "";
            string gioiTinh = CheckGioiTinh.Checked ? "Nam" : "Nữ";
            if (txtTen.Text.Length < 8 || txtTen.Text.Length > 16 ||
         !System.Text.RegularExpressions.Regex.IsMatch(txtTen.Text, @"^[a-zA-Z0-9&!_]+$"))
            {
                // Display an error message if the username is invalid
                bllKetQua.Text = "Tên đăng nhập  tối thiểu 8 ký tự, tối đa 16 ký tự!";
                return;
            }
            if (txtNhapLaiPass.Text != txtPass.Text)
            {
                bllKetQua.Text = "Vui lòng nhập lại mật khẩu ban đã nhập lại sai !!!";
                return;
            }
            //kt thu nhap
            double thuNhap = Double.Parse( txtThuNhap.Text);
            if(thuNhap <=0)
            {
                bllKetQua.Text = "Thu nhập phải lớn hơn 0";
                return;
            }
            if (thuNhap >= 1000000 && thuNhap <= 50000000)
            {
                // Input is within the valid range
                // Proceed with your logic here
            }
            else
            {
                // Input is outside the valid range
                // Display error message or handle accordingly
                bllKetQua.Text = "Thu nhập phải nằm trong khoảng từ 1,000,000 đến 50,000,000";
                return;
            }
            kq += $" <ul> <li><p>Khách hàng: {txtHoTen.Text}</li> </p>";
            kq += $" <li><p>Tên Đăng Nhập: {txtTen.Text}  </p> </li>";
            kq += $" <li><p>Mật Khẩu: {txtPass.Text}  </p> </li>";
            kq += $" <li><p>Ngày Sinh: {ddlNgay.SelectedValue}/{ddlThang.SelectedValue}/{ddlNam.SelectedValue}  </p> </li>";
            kq += $" <li><p>Giới tính: {gioiTinh}  </p> </li>";
            kq += $" <li><p>Email: {txtEmail.Text}  </p> </li>";
            kq += $" <li><p>Địa chỉ: {txtDiaChi.Text}  </p> </li>";
            kq += $" <li><p>Điện Thoại: {txtDienThoai.Text}  </p> </li>";
           
            kq += "<table class='table table-bordered'> </ul>";                                                                                 
            bllKetQua.Text = kq;
        }

        protected void txtTen_TextChanged(object sender, EventArgs e)
        {

        }
    }
}