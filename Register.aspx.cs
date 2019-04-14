using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public int CheckName()
    {
        DB db = new DB();
        string sqlStr = "select count(*) from tb_ljb where UserName='" + txtUserName.Text.Trim() + "'";
        DataTable dt = db.reDt(sqlStr);
        if (dt.Rows[0][0].ToString() != "0")
        {
            return -1;  //提示该用户名已经存在
        }
        else
        {
            return 2;  //提示该用户名可用！
        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        int vaule = CheckName();
        if (vaule == -1)
        {
            Response.Write("<script>alert('该用户已存在！');</script>");
            txtUserName.Focus();
        }
        else
        {
            DB db = new DB();
            string userName = txtUserName.Text.Trim();
            string passWord = db.GetMD5(txtPassWord.Text.Trim());
            string mail = txtMail.Text.Trim();
            
            string sqlStr = "insert into tb_ljb values('" + userName + "','" + passWord + "','" + mail + "',0)";
            try
            {
                int re = db.sqlEx(sqlStr);
                if (re == 1)
                {
                    Response.Write("<script>alert('注册成功！');location='index.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('注册失败！');</script>");
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('发生异常，请查找原因！');</script>");
            }
        }
    }
}