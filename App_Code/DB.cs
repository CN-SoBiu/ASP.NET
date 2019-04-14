using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;  //MD5加密算法引用命名空间
using System.Text;

/// <summary>
///DB 的摘要说明
/// </summary>
public class DB
{
	public DB()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 连接数据库
    /// </summary>
    /// <returns>返回sqlconnection对象</returns>
    public SqlConnection Getcon()
    {
        string conStr = ConfigurationManager.AppSettings["conString"].ToString();
        SqlConnection con = new SqlConnection(conStr);
        return con;
    }


    /// <summary>
    /// 执行sql语句
    /// </summary>
    /// <param name="sqlStr">执行的sql语句</param>
    /// <returns>成功返回1，失败返回2</returns>
    public int sqlEx(string sqlStr)
    {
        SqlConnection con = Getcon();
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlStr,con);
        try
        {
            cmd.ExecuteNonQuery();
            return 1;  //执行成功返回1
        }
        catch(Exception ex)
        {
            return 0;  //执行失败返回2
        }
        finally
        {
            con.Dispose();
        }
    }


    /// <summary>
    /// 执行sql查询，返回数据表
    /// </summary>
    /// <param name="sqlStr">查询表的语句</param>
    /// <returns>返回DataTable对象</returns>
    public DataTable reDt(string sqlStr)
    {
        SqlConnection con = Getcon();
        SqlDataAdapter sda = new SqlDataAdapter(sqlStr, con);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        return ds.Tables[0];
    }


    /// <summary>
    /// 执行sql语句，返回数据记录
    /// </summary>
    /// <param name="sqlStr">查记录语句</param>
    /// <returns>返回DataReader对象</returns>
    public SqlDataReader reDr(string sqlStr)
    {
        SqlConnection con = Getcon();
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlStr,con);
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);  //关闭sqlDataReader对象之后，自动关闭连接
        return dr;
    }

    /// <summary>
    /// 对密码进行MD5加密
    /// </summary>
    /// <param name="strPwd"></param>
    /// <returns></returns>
    public string GetMD5(string strPwd)
    {
        string pwd = "";
        MD5 md5 = MD5.Create(); //实例化一个md5对象

        byte[] s = md5.ComputeHash(Encoding.UTF8.GetBytes(strPwd));  //将密码转换成utf8编码的字节码
        //将字节码进行md5加密，算出hash值
        s.Reverse();  //将结果进行翻转
        for (int i = 3; i < s.Length - 1; i++)
        {
            pwd = pwd + (s[i] < 198 ? s[i] + 28 : s[i]).ToString("X");
        }
        return pwd;

    }
}