using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DB db = new DB();
        string userName = txtUserName.Text.Trim();
        string passWord = db.GetMD5(txtPwd.Text.Trim());

        //Response.Write(passWord);

        string num = txtValidateNum.Text.Trim();

        if (Session["validateNum"].ToString() == num.ToUpper())
        {
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
                Response.Write("<script>alert('您输入的用户名或密码错误，请检查！');location='Login.aspx';</script>");  //用户名或密码错误提示
            }

        }
        else
        {
            Response.Write("<script>alert('您输入的验证码错误！请重新输入！');location='Login.aspx';</script>");
        }


    }
}