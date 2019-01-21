<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="TerritoryManagment.aspx.cs" Inherits="AllMaster_TerritoryManagment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container" style="margin-top:30px;">  
    <div class="row">
     
        <div class="col-sm-10">
            <div class="col-sm-12 text-left"> 
                <form runat="server">
                    <div class="row">
                        <div class="col-lg-5">
                            <h3>Territory Managment</h3>
                        </div>
                        <div class="col-lg-3">
                            <asp:Button ID="btnNewT" class="btn btn-light" runat="server" Text="+ New " OnClick="btnNewT_Click"  />
                        </div>
                        <div class="col-lg-1">
                           
                        </div>
                        <div class="col-lg-1"></div>
                        <div class="col-lg-1">
                        </div>

                        <!-- The Modal -->
                       
                        <!-- ENd modal -->
                    </div>
                
                    <br/>
                    <hr/>
                    <br/>

                    <div class="row">
                         <div class="col-lg-5"></div>
                        <div class="col-lg-1">
<%--                            <button type="button" class="btn btn-light">Edit</button>--%>
                        </div>
                        <div class="col-lg-1">
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                        </div>
                        <div class="col-lg-4">
                        </div>
                        <%--<div class="col-lg-6">
                            <input class="form-control" id="myInput" type="text" placeholder="Search.." />

                        </div>--%>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-5"></div>
                        <div class="col-lg-7">
                            <asp:TreeView ID="TreeView1"  ShowCheckBoxes="All" runat="server" LineImagesFolder="~/TreeLineImages" ShowLines="True">
                               

                                <NodeStyle CssClass="custom-control-label"></NodeStyle>

                                <ParentNodeStyle ></ParentNodeStyle>
                                <SelectedNodeStyle ForeColor="#660033" Font-Bold="true" />
                            </asp:TreeView>

                            <%--Tree view--%>
                        </div>

                    </div>
                </form> 
     </div>
        

        </div>
    </div>
     

</div>
</asp:Content>

