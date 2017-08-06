﻿<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserAdmin.aspx.cs" Inherits="NMA_Wall.Admin.UserAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- Title added using the C# Title property of the Page reference --%>

    <% Page.Title = "Admin"; %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <%-- Uncomment when DB works --%>
    <h2 class="h1">Welcome <small><%= /*LoggedInUser.Username*/"Admin" %></small></h2>
    <p>Account Type: <%= /*DB.UserGetType(LoggedInUser)*/"Super Admin" %></p>

    <section id="secAdminReportsThingy">
        <h3>Admin Essensials Thing</h3>
        <section>
            <h3>Useful Numbers</h3>
            
            <label>Number of Comments - <%= /*DB.MessageGetAll()*/ "4" %></label>
            <br />
            <label>Number of Comments - <%= /*DB.MessageGetAll()*/ "4" %></label>
        </section>
        <section id="secAccountStuff">
            <section>
                <form action="/" method="post" runat="server">
                    <h3>Change Password</h3>
                    <div>
                        <input type="password" name="oldPassword" value="" placeholder="Old Password" autocomplete="off" />
                        <br />
                        <input type="password" name="newPassword" value="" placeholder="New Password" autocomplete="off" />
                        <br />
                        <input type="password" name="newRepeatPassword" value="" placeholder="Retype Password" autocomplete="off" />
                        <div class="clear"></div>
                        <br />
                        <input type="submit" value="Change Password" class="btn-default" />
                    </div>
                </form>
            </section>
        </section>
    </section>

    <section id="secFlaggedComments">
        <h3>Flagged Comments</h3>
        <table>
            <thead>
                <tr>
                    <% if (Request.IsLocal)
                        {
                    %>
                    <th>
                        <label>ID</label>
                    </th>
                    <% } %>
                    <th>
                        <label>Memorial</label>
                    </th>
                    <th>
                        <label>Subject</label>
                    </th>
                    <th>
                        <label>Comment</label>
                    </th>
                    <th>
                        <label>Time posted</label>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <% if (Request.IsLocal)
                        {
                    %>
                    <td>
                        <label>4</label>
                    </td>
                    <% } %>
                    <td>
                        <label>Shot at Dawn</label>
                    </td>
                    <td>
                        <label>Attention!!</label>
                    </td>
                    <td>
                        <label>Don't waste your time at this monument</label>
                    </td>
                    <td>
                        <label><time>11:47</time></label>
                    </td>
                </tr>
            </tbody>
        </table>
    </section>

    <section class="secActions">
        <input type="button" name="btnModCom" value="Moderate Comments" class="btn-default" />
    </section>
</asp:Content>
