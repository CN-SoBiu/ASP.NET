using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
    protected void btnLogin_Click(object sender, ImageClickEventArgs e)
    {
        DB db = new DB();
        string userName = txtUserName.Text.Trim();
        string passWord = db.GetMD5(txtPwd.Text.Trim());

        string sqlStr = "select * from tb_ljb where UserName='" + userName + "' and PassWord='" + passWord + "'"; //数据库查询语句
        SqlDataReader dr = db.reDr(sqlStr);
        dr.Read();
        if (dr.HasRows)
        {
            Session["UserId"] = dr.GetValue(0);  //取用户Id
            Session["Role"] = dr.GetValue(4); //取用户权限
            //Response.Redirect("UserManagement.aspx");  //重定向跳转到用户中心

            Response.Write("<script>alert('登录成功，即将跳转用户中心！');location='UserManagement.aspx';</script>");  //弹窗跳转用户中心
        }
        else
        {
            Response.Write("<script>alert('您输入的用户名或密码错误，请检查！');location='index.aspx';</script>");  //用户名或密码错误提示
        }
    }
}