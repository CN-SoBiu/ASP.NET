<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style3
        {
            height: 308px;
        }
        .style4
        {
            width: 378px;
        }
        .style5
        {
            width: 100%;
        }
        .style6
        {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table align="center" class="style3" 
            style="background-image: url('Image/登录.jpg'); width: 405px; height: 265px;">
            <tr>
                <td class="style4">
                    <table align="center" class="style5">
                        <tr>
                            <td class="style6" style="color: #FFFFFF; font-size: 12px; text-align: right;" 
                                align="center">
                                用户名:</td>
                            <td class="style6">
                                <asp:TextBox ID="txtUserName" runat="server" Width="148px"></asp:TextBox>
                            </td>
                            <td class="style6">
                            </td>
                        </tr>
                        <tr>
                            <td style="color: #FFFFFF; font-size: 12px; text-align: right;" class="style6">
                                密 码 :</td>
                            <td class="style6">
                                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="148px">请输入密码</asp:TextBox>
                            </td>
                            <td class="style6">
                                </td>
                        </tr>
                        <tr>
                            <td style="color: #FFFFFF; font-size: 12px; text-align: right;">
                                验证码:</td>
                            <td>
                                <asp:TextBox ID="txtValidateNum" runat="server" Width="148px"></asp:TextBox>
                            </td>
                            <td style="color: #FFFFFF; font-size: 12px">
                                <asp:Image ID="Image1" runat="server" ImageUrl="ValidateNum.aspx" />
                                请输入验证码</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;&nbsp;
                                <asp:Button ID="btnLogin" runat="server" Text="登录" onclick="btnLogin_Click" 
                                    style="width: 40px" />
                                &nbsp;&nbsp;
                                <asp:Button ID="btnRegister" runat="server" Text="注册" 
                                    onclick="btnRegister_Click" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
