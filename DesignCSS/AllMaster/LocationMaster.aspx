<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="LocationMaster.aspx.cs" Inherits="AllMaster_CityMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />



     <script type="text/javascript">
function OpenNewCountry() 
{
   

   <%-- var gridFld1;
    gridFld1 = "<%=rowNo%>";
   
    var Position;
    Position = "<%=index%>";--%>

   
    //popupWindow = window.open("../inquiry/inquiryFollowUp.aspx?id=" + gridFld1 , 'popUpWindow', 'height=600,width=600,left=400,top=30,resizable=No,scrollbars=No,toolbar=no,menubar=no,location=no,directories=no, status=No');
    popupWindow = window.open("../AllMaster/CityMasterNew.aspx",'popUpWindow', 'height=400,width=500,left=400,top=30,resizable=No,scrollbars=No,toolbar=no,menubar=no,location=no,directories=no, status=No');
}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        
        <div class="container-fluid">
            <br />
            <div class="row" >
                <div class="col-sm-1"></div>
                <div class="col-md-4" style="min-width:520px; max-height:205px;">
                    <div class="card">
                       
                        <div class="card-body" style="max-height:200px; " >
                            <div class="row">
                                <div class="col-md-8" >
                                    <asp:Gridview runat="server" ID="CityGridview" Font-Size="Medium" RowStyle-Height="7px"   autogeneratecolumns="False"  backcolor="White" bordercolor="#999999" borderstyle="Solid" borderwidth="1px" cellpadding="0" datasourceid="SqlDataSource1" forecolor="Black" GridLines="Vertical">
                                        <AlternatingRowStyle BackColor="#e6e6e6" />
                                        <Columns>
                                         <asp:TemplateField>
                                           <ItemTemplate>
                                           <asp:LinkButton ID="lnkSelect" CommandName="Select" CssClass="btn-sm"  runat="server"><span class="fa fa-caret-right"></span></asp:LinkButton>
                                          </ItemTemplate>
                                       <ItemStyle ForeColor="#61A4DB" />
                                   </asp:TemplateField>
                                   <asp:BoundField DataField="Name" HeaderText="Country" SortExpression="Name" />
                               </Columns>
                               <FooterStyle BackColor="#CCCCCC" />
                               <HeaderStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White" />
                               <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                               
                               <SelectedRowStyle BackColor="#61A4DB" ForeColor="White" />
                               <SortedAscendingCellStyle BackColor="#F1F1F1" />
                               <SortedAscendingHeaderStyle BackColor="#808080" />
                               <SortedDescendingCellStyle BackColor="#CAC9C9" />
                               <SortedDescendingHeaderStyle BackColor="#383838" />
                           </asp:Gridview>
                                    <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" selectcommand="SELECT [Name] FROM [Gen_Country]"></asp:sqldatasource>
                                </div>
                                <div class="col-md-4" >
                                    <div class="row">
                                        <asp:button id="btnNewCountry" OnClientClick="OpenNewCountry()" class="btn btn-outline-primary" runat="server" text="New" />

                                    </div>
                                    <br />
                                    <div class="row">
                                         <asp:button id="btnEdit" class="btn btn-outline-primary" runat="server" text="Edit" />
                                    </div>
                                    <br />
                                    <div class="row">
                                         <asp:button id="btnDelete" class="btn btn-outline-primary" runat="server" text="Delete" />
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                     
                    </div>
                   
                </div>
            <div class="col-sm-1"></div>
                <%--<div class="col-md-4" style="min-width:520px; max-height:205px;">
                    <div class="card">
                        <div class="card-body" style="max-height:200px; " >
                            <div class="row">
                                <div class="col-md-8" >
                                    <asp:Gridview runat="server" Font-Size="Medium" RowStyle-Height="7px"   autogeneratecolumns="False"  backcolor="White" bordercolor="#999999" borderstyle="Solid" borderwidth="1px" cellpadding="0" datasourceid="SqlDataSource1" forecolor="Black" GridLines="Vertical">
                                        <AlternatingRowStyle BackColor="#e6e6e6" />
                               <Columns>
                                     <asp:TemplateField HeaderText="Id">

                            <ItemTemplate>
                                <asp:Label ID="lblCurencyID" runat="server" Text='<%# Eval("CityID") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Code">
                            <ItemTemplate>
                                <asp:Label ID="lblCurencyName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtECurencyName" Text='<%# Eval("Name") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFCurencyName" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" CommandName="Edit" runat="server" Text="Edit"><span class="fa fa-edit mr-sm-3"></span></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" CommandName="Delete" runat="server" Text="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdte" CommandName="Update" runat="server" Text="Update"><span class="fa fa-save mr-sm-3"></span></asp:LinkButton>
                                <asp:LinkButton ID="btnCancel" CommandName="Cancel" runat="server" Text="Cancel"><span class="fa fa-remove"></span></asp:LinkButton>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="btnAdd" runat="server" CommandName="AddNew" Text="Add"><span class="fa fa-plus"></span></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                               </Columns>
                               <FooterStyle BackColor="#CCCCCC" />
                               <HeaderStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White" />
                               <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                               
                               <SelectedRowStyle BackColor="#61A4DB" ForeColor="White" />
                               <SortedAscendingCellStyle BackColor="#F1F1F1" />
                               <SortedAscendingHeaderStyle BackColor="#808080" />
                               <SortedDescendingCellStyle BackColor="#CAC9C9" />
                               <SortedDescendingHeaderStyle BackColor="#383838" />
                           </asp:Gridview>
                                    <asp:sqldatasource id="SqlDataSource2" runat="server" connectionstring="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" selectcommand="SELECT [Name] FROM [Gen_Country]"></asp:sqldatasource>
                                </div>
                                <div class="col-md-4" >
                                    <div class="row">
                                        <asp:button id="Button1" class="btn btn-outline-primary" runat="server" text="New" />

                                    </div>
                                    <br />
                                    <div class="row">
                                         <asp:button id="Button2" class="btn btn-outline-primary" runat="server" text="Edit" />
                                    </div>
                                    <br />
                                    <div class="row">
                                         <asp:button id="Button3" class="btn btn-outline-primary" runat="server" text="Delete" />
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <div class="col-sm-1"></div>
            </div>
            <br />
            <br />

            <%-----------------------------------------------------------------%>
             <div class="row">
                 <div class="col-sm-1"></div>
            <%--    <div class="col-md-4" style="min-width:520px; max-height:205px;">
                    <div class="card">
                        <div class="card-body" style="max-height:200px; " >
                            <div class="row">
                                <div class="col-md-8" >
                                    <asp:Gridview runat="server" Font-Size="Medium" RowStyle-Height="7px"   autogeneratecolumns="False"  backcolor="White" bordercolor="#999999" borderstyle="Solid" borderwidth="1px" cellpadding="0" datasourceid="SqlDataSource1" forecolor="Black" GridLines="Vertical">
                                        <AlternatingRowStyle BackColor="#e6e6e6" />
                               <Columns>
                                   <asp:TemplateField>
                                       <ItemTemplate>
                                           <asp:LinkButton ID="lnkSelect" CommandName="Select" CssClass="btn-sm"  runat="server"><span class="fa fa-caret-right"></span></asp:LinkButton>
                                       </ItemTemplate>
                                       <ItemStyle ForeColor="#61A4DB" />
                                   </asp:TemplateField>
                                   <asp:BoundField DataField="Name" HeaderText="City" SortExpression="Name" />
                               </Columns>
                               <FooterStyle BackColor="#CCCCCC" />
                               <HeaderStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White" />
                               <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                               
                               <SelectedRowStyle BackColor="#61A4DB" ForeColor="White" />
                               <SortedAscendingCellStyle BackColor="#F1F1F1" />
                               <SortedAscendingHeaderStyle BackColor="#808080" />
                               <SortedDescendingCellStyle BackColor="#CAC9C9" />
                               <SortedDescendingHeaderStyle BackColor="#383838" />
                           </asp:Gridview>
                                    <asp:sqldatasource id="SqlDataSource3" runat="server" connectionstring="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" selectcommand="SELECT [Name] FROM [Gen_Country]"></asp:sqldatasource>
                                </div>
                                <div class="col-md-4" >
                                    <div class="row">
                                        <asp:button id="Button4" class="btn btn-outline-primary" runat="server" text="New" />

                                    </div>
                                    <br />
                                    <div class="row">
                                         <asp:button id="Button5" class="btn btn-outline-primary" runat="server" text="Edit" />
                                    </div>
                                    <br />
                                    <div class="row">
                                         <asp:button id="Button6" class="btn btn-outline-primary" runat="server" text="Delete" />
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
                  <div class="col-sm-1"></div>
                <div class="col-md-4" style="min-width:520px; max-height:205px;">
                    <div class="card">
                        <div class="card-body" style="max-height:200px; " >
                            <div class="row">
                                <div class="col-md-8" >
                                   <%-- <asp:Gridview runat="server" Font-Size="Medium" RowStyle-Height="7px"   autogeneratecolumns="False"  backcolor="White" bordercolor="#999999" borderstyle="Solid" borderwidth="1px" cellpadding="0" datasourceid="SqlDataSource1" forecolor="Black" GridLines="Vertical">
                                        <AlternatingRowStyle BackColor="#e6e6e6" />
                               <Columns>
                                   <asp:TemplateField>
                                       <ItemTemplate>
                                           <asp:LinkButton ID="lnkSelect" CommandName="Select" CssClass="btn-sm"  runat="server"><span class="fa fa-caret-right"></span></asp:LinkButton>
                                       </ItemTemplate>
                                       <ItemStyle ForeColor="#61A4DB" />
                                   </asp:TemplateField>
                                   <asp:BoundField DataField="Name" HeaderText="Area" SortExpression="Name" />
                               </Columns>
                               <FooterStyle BackColor="#CCCCCC" />
                               <HeaderStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White" />
                               <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                               
                               <SelectedRowStyle BackColor="#61A4DB" ForeColor="White" />
                               <SortedAscendingCellStyle BackColor="#F1F1F1" />
                               <SortedAscendingHeaderStyle BackColor="#808080" />
                               <SortedDescendingCellStyle BackColor="#CAC9C9" />
                               <SortedDescendingHeaderStyle BackColor="#383838" />
                           </asp:Gridview>--%>
                                    <asp:sqldatasource id="SqlDataSource4" runat="server" connectionstring="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" selectcommand="SELECT [Name] FROM [Gen_Country]"></asp:sqldatasource>
                                </div>
                              <%--  <div class="col-md-4" >
                                    <div class="row">
                                        <asp:button id="Button7" class="btn btn-outline-primary" runat="server" text="New" />

                                    </div>
                                    <br />
                                    <div class="row">
                                         <asp:button id="Button8" class="btn btn-outline-primary" runat="server" text="Edit" />
                                    </div>
                                    <br />
                                    <div class="row">
                                         <asp:button id="Button9" class="btn btn-outline-primary" runat="server" text="Delete" />
                                    </div>
                                    
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>

            </div>



        </div>

    </form>

</asp:Content>

