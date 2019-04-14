<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registers.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 501px;
            height: 300px;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            height: 20px;
        }
        .style4
        {
            width: 84px;
            text-align: right;
        }
        .style5
        {
            height: 20px;
            width: 84px;
            text-align: right;
        }
        .style6
        {
            width: 216px;
        }
        .style8
        {
            width: 84px;
            text-align: right;
            height: 25px;
        }
        .style9
        {
            width: 216px;
            height: 25px;
        }
        .style10
        {
            height: 25px;
        }
        .style11
        {
            height: 20px;
            color: #993300;
        }
        .style13
        {
            color: #FF3300;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table align="center" class="style1" 
            style="background-image: url('Image/注册.jpg')">
            <tr>
                <td>
                    <br />
                    <table align="center" class="style2" style="font-size: 12px">
                        <tr>
                            <td class="style8" style="font-size: 12px">
                                用户名：</td>
                            <td class="style9">
                                <asp:TextBox ID="txtUserName" runat="server" Height="19px" Width="148px"></asp:TextBox>
                                &nbsp;<span class="style13">*</span></td>
                            <td class="style10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="用户名不能为空" 
                                    style="color: #FF3300"></asp:RequiredFieldValidator>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    ForeColor="White" onclick="LinkButton1_Click">检测用户名是否存在</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8" style="font-size: 12px">
                                密码：</td>
                            <td class="style9">
                                <asp:TextBox ID="txtPassWord" runat="server" Width="148px" TextMode="Password"></asp:TextBox>
                                &nbsp;<span class="style13">*</span></td>
                            <td class="style10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtPassWord" ErrorMessage="密码不能为空" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5" style="font-size: 12px">
                                确认密码：</td>
                            <td class="style3">
                                <asp:TextBox ID="txtRePassWord" runat="server" CssClass="style13" 
                                    TextMode="Password" Width="148px"></asp:TextBox>
                                <span class="style13">&nbsp;*</span></td>
                            <td class="style3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtRePassWord" Display="Dynamic" ErrorMessage="重复密码不能为空" 
                                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToCompare="txtPassWord" ControlToValidate="txtRePassWord" 
                                    Display="Dynamic" ErrorMessage="输入密码不一致" ForeColor="#FF3300"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style4" style="font-size: 12px">
                                Email：</td>
                            <td class="style6">
                                <asp:TextBox ID="txtMail" runat="server" Width="148px"></asp:TextBox>
                                &nbsp;<span class="style13">*</span></td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="txtMail" ErrorMessage="邮箱格式不正确！" ForeColor="#FF3300" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5" style="font-size: 12px">
                            </td>
                            <td class="style11" colspan="2">
                                以上内容必须为必填项，请正确填写，否则无法完成注册</td>
                        </tr>
                        <tr>
                            <td class="style4" style="font-size: 12px">
                                &nbsp;</td>
                            <td class="style6">
                                <asp:Button ID="btnRegister" runat="server" Text="注册" 
                                    onclick="btnRegister_Click" style="height: 27px" />
&nbsp;
                                <asp:Button ID="btnBack" runat="server" Text="返回" onclick="btnBack_Click" />
                            &nbsp;
                                <asp:Button ID="btnClear" runat="server" CausesValidation="False" 
                                    onclick="btnClear_Click" Text="清空" />
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
