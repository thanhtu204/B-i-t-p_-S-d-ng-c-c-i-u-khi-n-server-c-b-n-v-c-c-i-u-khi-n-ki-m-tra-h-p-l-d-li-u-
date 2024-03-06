using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DonDatHang
{
    public partial class DonDatHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                ddlDoAn.Items.Add(new ListItem("Bánh Bột Lọc","01"));
                ddlDoAn.Items.Add(new ListItem("Hamburger","02"));
                ddlDoAn.Items.Add(new ListItem("Bánh Mì Bình Định","03"));
                ddlDoAn.Items.Add(new ListItem("Bánh Bò Nướng","04"));
                ddlDoAn.Items.Add(new ListItem("Bánh Pía Sóc Trăng","05"));
                ddlDoAn.Items.Add(new ListItem("Bánh Tráng Dừa","06"));
                //...
                //khoi tao cho lstNgheNghiep            

            }

        }

        protected void ddlDoAn_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            if (int.Parse(txtMaSoThue.Text) <= 0 )
            {
                lblKetQua.Text = "Bạn Vui lòng nhập lại số dương";
                return;
            }
            
                 if (int.Parse(txtMaSoThue.Text) > 99 )
            {
                lblKetQua.Text = "Bạn Vui nhập mã số thuế dưới 99";
                return;
            }
            string kq = "";
            //b1 thu thap thong tin
            kq += "<div class='hoa-don'>";
            kq += "<h2> HÓA ĐƠN ĐẶT HÀNG </h2>";
            //Lấy thông tin họ tên
            kq += $"<p>Khách hàng: {txtTenKh.Text} </p>";
            kq += $"<p>Địa chỉ: {txtDiaChi.Text}  </p>";
            kq += $"<p>Mã số thuế: {txtMaSoThue.Text}  </p>";
            kq += "<h3> DANH SÁCH BÁNH ĐÃ ĐẶT </h3> ";
            kq += "<table class='table table-bordered'>";
            char[] cat = { '(', ')' };
            foreach(ListItem item in lstDoAn.Items)
            {
                string [] arr= item.Text.Split(cat);
                kq += "<tr>";
                kq += $"<td>{arr[0]}</td> <td>{arr[1]}</td>";
            }
            kq += "</table>";
         
            //Xử lý hình
            lblKetQua.Text = kq;
        }

        protected void btnChuyenDuLieu_Click(object sender, EventArgs e)
        {
            if (int.Parse(txtSoLuong.Text) <= 0)
            {
                lblKetQua.Text = "Bạn phải nhập số lượng lớn hơn 0 ";
                return;
            }
            bool checkExist = false;
            char[] delim = { '(', ')' };
            int soLuong;
            // kiểm tra tồn tại
            for (int i = 0; i < lstDoAn.Items.Count; i++)
            {
                string itemText = lstDoAn.Items[i].Text;
                if (itemText.Contains(ddlDoAn.SelectedItem.Text))
                {
                    // xử lý cộng dồn số lượng
                    string[] arr = itemText.Split(delim);
                    soLuong = int.Parse(txtSoLuong.Text) + int.Parse(arr[1]);
                    lstDoAn.Items[i].Text = $"{ddlDoAn.SelectedItem.Text} ({soLuong})";
                    checkExist = true;
                    break;
                }
            }
            //
            if (!checkExist)
            {
                string data = $"{ddlDoAn.SelectedItem.Text}({txtSoLuong.Text})";
                lstDoAn.Items.Add(data);
            }
            
            //lstDoAn.Items.Add = ddlDoAn.SelectedItem;z`
       
          

            // Thêm bánh mới vào danh sách
           

            // Lưu danh sách bánh vào ViewState
           
        }

        protected void btnXoa_Click(object sender, ImageClickEventArgs e)
        {

            //string chon = lstDoAn.SelectedItem.Text;
            //lstDoAn.Items.Remove(chon);
            for (int i = lstDoAn.Items.Count - 1; i >=0; i--)
            {
                if (lstDoAn.Items[i].Selected)
                {
                    lstDoAn.Items.RemoveAt(i);
                }
            }
        }
    }
}