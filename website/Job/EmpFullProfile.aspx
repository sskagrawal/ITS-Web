<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmpFullProfile.aspx.cs" Inherits="Job_EmpFullProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Controle/Newregistration.ascx" TagName="Newregistration" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        article#detail-195 {
            display: flex;
            padding-bottom: 50px;
            margin-top: -30px;
        }

        .sp-thumbnail {
            margin-left: -42px;
            margin-right: 10px;
        }

        .detail-body {
            margin-right: -55px;
        }

        h3.detail-title {
            margin: 0px 0px 10px 0px;
            text-transform: uppercase;
            font-size: 16px;
            line-height: 32px;
            color: #333;
            text-align: left;
        }

            h3.detail-title a {
                color: #333;
            }

        .detail .detail-date-full {
            text-align: left !important;
        }

        .blog-post .detail .detail-date-full, .detail .detail-date-full {
            text-align: center;
            font-size: 16px;
            line-height: 26px;
            font-style: italic;
            font-family: Georgia,"Times New Roman",Times,serif;
            margin-bottom: 10px;
            padding-left: 5px;
        }

        .text-left {
            text-align: left;
        }

        .detail .detail-more {
            text-transform: uppercase;
            font-size: 13px;
            display: inline-block;
            position: relative;
            -webkit-transition: all 0.3s;
            transition: all 0.3s;
            padding: 2px 15px 4px 15px;
            background-color: #f5f5f5;
            border-radius: 50px;
            float: right;
            margin-right: 15px;
            bottom: 40px;
            color: #f0634c;
        }

            .detail .detail-more:hover {
                color: white;
                background-color: #f0634c;
            }

        table.shop_attributes p {
            margin-bottom: 0;
        }

        .work-details {
            display: flex;
            margin-bottom: 35px;
        }

        img.work-image {
            margin-right: 10px;
        }

        .blog-layout-wrap {
            padding-bottom: 0;
        }

        .work-details-image {
            margin-right: 20px;
        }

        .keywords-item a {
            color: #333;
            border: 1px solid #333;
            padding: 3px 10px 2px 10px;
            border-radius: 5px;
            margin-right: 10px;
            margin-bottom: 15px;
            display: inline-block;
        }

        .sp-thumbnail {
            width: 50%;
        }

        /*Upper Footer*/

        footer.upper-footer {
            background: #fff;
            padding: 30px;
        }

        .row.upper-footer-row {
            display: flex;
            width: 100%;
        }

            .row.upper-footer-row a {
                color: #333;
            }

                .row.upper-footer-row a:hover {
                    color: #f0634c;
                }

        .first-col {
            width: 50%;
        }

        .first-col-item {
            display: flex;
            flex-direction: column;
            margin-top: 10px;
        }

        .first-col-skill-item {
            display: flex;
            flex-direction: row;
            width: 100%;
        }

        .first-skill-item {
            display: flex;
            flex-direction: column;
            width: 33%;
        }

        .second-skill-item {
            display: flex;
            flex-direction: column;
            width: 33%;
        }

        .third-skill-item {
            display: flex;
            flex-direction: column;
            width: 33%;
        }

        .second-col {
            width: 17%;
        }

        .second-col-item {
            display: flex;
            flex-direction: column;
            margin-top: 10px;
        }

        .third-col {
            width: 17%;
        }

        .third-col-item {
            display: flex;
            flex-direction: column;
            margin-top: 10px;
        }

        .fourth-col {
            width: 16%;
        }

        .fourth-col-item {
            display: flex;
            flex-direction: column;
            margin-top: 10px;
        }

        h5.heading {
            border-bottom: 1px solid #f0634c;
            padding-bottom: 5px;
            display: inline-block;
            font-size: 14px;
            text-transform: uppercase;
            font-family: Montserrat !important;
        }









        .many-skills {
            /*margin-bottom: -36px;*/
            padding-left: 5px;
            /*margin-top: 16px;*/
            text-align: left;
        }

        .many-skills {
            margin-bottom: 10px;
        }

            .many-skills a {
                color: white;
                background: #f0634c;
                padding: 3px 10px 2px 10px;
                display: inline-block;
                text-transform: uppercase;
                font-size: 10px;
                line-height: 20px;
                margin-right: 6px;
            }

            .many-skills a {
                margin-top: 10px;
            }

        .job-apply {
            float: right;
            margin-top: 20px;
        }


        @media only screen and (max-width:997px) {
            .row.upper-footer-row {
                flex-direction: column;
            }

            .first-col {
                width: 100%;
            }

            .second-col {
                width: 100%;
            }

            .third-col {
                width: 100%;
            }

            .fourth-col {
                width: 100%;
            }
        }


        @media only screen and (max-width:767px) {
            article#detail-195 {
                display: flex;
                flex-direction: column;
            }

            article#detail-195 {
                flex-direction: column;
            }

            .sp-thumbnail {
                margin-left: 0;
                margin-right: 0;
            }

            .sp-thumbnail {
                margin: 0 auto;
            }

            .detail-body {
                width: 400px;
            }

            .detail .detail-more {
                margin-right: 17px;
            }

            .work-details {
                flex-direction: column;
            }

            img.work-image {
                display: flex;
                margin: 0 auto;
            }

            .work-details-image {
                margin-bottom: 15px;
            }

            /*Upper footer*/

            .row.upper-footer-row {
                flex-direction: column;
            }

            .first-col {
                width: 100%;
            }

            .first-col {
                margin-bottom: 5px;
            }

            .first-col-skill-item {
                flex-direction: column;
            }

            .first-skill-item {
                width: 100%;
                margin-bottom: 5px;
            }

            .second-skill-item {
                width: 100%;
                margin-bottom: 5px;
            }

            .third-skill-item {
                width: 100%;
            }

            .second-col {
                width: 100%;
            }

            .second-col {
                margin-bottom: 5px;
            }

            .third-col {
                width: 100%;
            }

            .third-col {
                margin-bottom: 5px;
            }

            .fourth-col {
                width: 100%;
            }
        }

        @media only screen and (max-width:575px) {
            article#detail-195 {
                flex-direction: column;
            }

            .sp-thumbnail {
                margin: 0;
            }

            .sp-thumbnail {
                margin: 0 auto;
            }

            .detail-body {
                width: 383px;
            }

            .detail-body {
                margin: 0;
            }

            a.detail-more {
                margin-right: 0 !important;
            }

            .work-details {
                flex-direction: column;
            }
        }


        @media only screen and (max-width:479px) {
            .job-apply {
                float: none;
            }

            article#detail-195 {
                flex-direction: column;
            }

            .sp-thumbnail {
                margin: 0;
            }

            .sp-thumbnail {
                margin: 0 auto;
            }
            /*.container.nz-clearfix.emp-container {
        width: 425px;
        max-width: 425px;
    }
    .detail-body {
        width: 370px;
    }*/
            /*a.detail-more {
        margin-right: 10px !important;
    }
    .work-details {
        flex-direction: column;
    }*/
            article#post-194 {
                margin-left: -78px;
            }

            /*Upper footer*/

            .first-col-skill-item {
                flex-direction: column;
            }

            .first-skill-item {
                width: 100%;
            }

            .first-skill-item {
                margin-bottom: 5px;
            }

            .second-skill-item {
                width: 100%;
            }

            .second-skill-item {
                margin-bottom: 5px;
            }

            .third-skill-item {
                width: 100%;
            }

            .third-skill-item {
                margin-bottom: 5px;
            }

            .second-col {
                margin-bottom: 5px;
            }

            .third-col {
                margin-bottom: 5px;
            }
        }


        @media only screen and (max-width:375px) {
            .job-apply {
                float: none;
                text-align: right;
            }
            /*.col12.col-second {
        margin-left: -28px !important;
        margin-right: -28px !important;
    }*/
            .post-body-in {
                margin-left: -37px;
                margin-right: -37px;
            }

            h3#h3_01b4_1 {
                font-size: 21px;
            }

            table.shop_attributes p {
                margin: 0;
            }

            article#detail-195 {
                flex-direction: column;
            }

            .sp-thumbnail {
                margin: 0;
            }

            .sp-thumbnail {
                margin: 0 auto;
            }

            .detail-body {
                width: 300px;
            }

            .detail-date-full {
                width: 300px;
            }

            .post-excerpt.text-left {
                width: 300px;
            }

            .many-skills {
                padding-left: 0;
            }

            .detail .detail-more {
                margin-right: 5px;
            }

            .work-details {
                display: flex;
                flex-direction: column;
            }

            article#post-194 {
                margin-left: 0;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:HiddenField ID="hdfpid" runat="server" />
    <asp:HiddenField ID="hdfPostedOn" runat="server" />

    <header class="rich-header page-header version1" data-parallax="true" id="header_bd96_0">
        <div class="parallax-container" id="div_bd96_0">&nbsp;</div>
        <div class="container nz-clearfix">
            <div class="rh-content">
                <h1>Employee Job Profile</h1>
                <div class="rh-separator">&nbsp;</div>
                <div id="div_bd96_1" class="nz-breadcrumbs nz-clearfix"><a href="default.aspx">Home</a><span class="current">Employee Profile</span></div>
            </div>
        </div>
        <div id="slider-arrow" data-target="#nz-target" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
    </header>


    <div class="blog-layout-wrap standard sidebar-true" id="nz-target">
        <div id="loop" class="loop">

            <div class="container nz-clearfix emp-container">
                <section class="main-content left">
                    <section class="content lazy blog-layout nz-clearfix">
                        <div class="blog-post blog-post-1 nz-clearfix">
                            <article data-grid="ninzio_01" class="post-194 post type-post status-publish format-aside has-post-thumbnail hentry category-marketing tag-design tag-eva tag-external tag-logo tag-marketing tag-ninzio-style tag-painting tag-smart post_format-post-format-aside" id="post-194" style="position: absolute; left: 0px; top: 0px;">


                                <div class="post-date-custom"><span>
                                    <asp:Label ID="lblCounter" runat="server" Text=""></asp:Label></span><span>View</span></div>

                                <div class="post-body">
                                    <div class="post-body-in">
                                        <div class="format-wrapper nz-clearfix">

                                            <% if (dt != null && dt.Rows.Count > 0)
                                                { %>
                                            <article data-grid="ninzio_01" class="detail" id="detail-195">
                                                <div class="sp-thumbnail">
                                                    <%
                                                        System.Data.DataTable dt2 = bind_ProfilePhoto(dt.Rows[0]["PartyID"].ToString());
                                                        if (dt2 != null && dt2.Rows.Count > 0 && dt2.Rows[0]["Upload_File"].ToString() != string.Empty)
                                                        { %>
                                                    <img width="440" height="400" alt="client Photo" src="../ClientContractDoc/<%=dt2.Rows[0]["Upload_File"].ToString()%>" class="attachment-Montserrat-Ninzio-Square size-Montserrat-Ninzio-Square wp-post-image" />


                                                    <% } %>

                                                    <%  else
                                                    { %>
                                                    <img alt="client Photo" src="../images/dummy.jpg" />
                                                    <%  }%>

                                                    <div class="ninzio-overlay">
                                                        <a class="nz-overlay-before" title="View details" href="#"></a>
                                                    </div>
                                                </div>
                                                <div class="detail-body">
                                                    <div class="detail-body-in">


                                                        <%                                                   
                                                        string t2 = dt.Rows[0]["job_Title"].ToString();
                                                        int headingLength1 = t2.Length;
                                                        if (headingLength1 > 45)
                                                        {
                                                            string str2 = t2.Substring(0, 45); %>
                                                        <h3 class="post-title"><a href="#" title="job Title" rel="bookmark"><%=str2%>. [...]</a></h3>


                                                        <% }
                                                        %>


                                                        <% else
                                                        { %>
                                                        <h3 class="detail-title"><a href="#" title="job title" rel="bookmark"><%= dt.Rows[0]["job_Title"].ToString()%></a></h3>
                                                        <%} %>






                                                        <div class="detail-date-full">
                                                            <i class="fa fa-user" aria-hidden="true"></i><span><%= dt.Rows[0]["Contact_person_name"].ToString()%></span>

                                                            <%if (dt.Rows[0]["Exp"].ToString() != string.Empty)
                                                                { %>
                                                            <i class="fa fa-history" aria-hidden="true"></i><span>Exp:<%= dt.Rows[0]["Exp"].ToString()%></span>
                                                            <%} %>

                                                            <%else
                                                                { %>
                                                            <i class="fa fa-history" aria-hidden="true"></i><span>Experience:0 </span>
                                                            <%} %>


                                                            <i class="fa fa-inr"></i><span>Price:  <%= dt.Rows[0]["Min_Salary"].ToString()%> </span>
                                                            <i class="fa fa-map-marker"></i><span>City: <%= dt.Rows[0]["City"].ToString()%></span>
                                                        </div>









                                                        <%                                                   
                                                        string t = dt.Rows[0]["ShortDescription"].ToString();
                                                        int headingLength = t.Length;
                                                        if (headingLength > 170)
                                                        {
                                                            string str1 = t.Substring(0, 170); %>


                                                        <div class="post-excerpt text-left"><%=str1%> .... </div>

                                                        <% }
                                                        else
                                                        { %>
                                                        <div class="post-excerpt text-left"><%= dt.Rows[0]["ShortDescription"].ToString() %></div>

                                                        <%} %>





                                                        <div class="many-skills">

                                                            <%
                                                            System.Data.DataTable dt3 = BindJobSkill(dt.Rows[0]["PartyID"].ToString());

                                                            if (dt3 != null && dt3.Rows.Count > 0)
                                                            { %>
                                                            <%for (int k = 0; k < dt3.Rows.Count; k = k + 1)
                                                            { %>

                                                            <a href="#"><%=dt3.Rows[k]["Skill_Name"].ToString()%></a>

                                                            <%} %>

                                                            <% } %>
                                                        </div>
                                                        <div class="clear"></div>
                                                        <br>
                                                        <br>


                                                        <a class="detail-more" href="../Client_Panel/Client_profile_big.aspx?uTp=3&pId=157">Read more</a>

                                                    </div>
                                                </div>
                                            </article>




                                            <div class="col12 col-second" style="margin: 0;">
                                                <div class="col-inner">


                                                    <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing" style="text-align: left;">Job Details</h3>
                                                    <div class="" style="text-align: left;" data-effect="none">
                                                        <div class="nz-separator solid" id="div_01b4_21">&nbsp;</div>
                                                    </div>
                                                </div>
                                                <table class="shop_attributes">



                                                    <tr>
                                                        <th>INDUSTRY:</th>
                                                        <td>
                                                            <p><%= dt.Rows[0]["Comp_Category"].ToString()%></p>
                                                        </td>
                                                    </tr>


                                                    <tr class="alt">
                                                        <th>JOB CATEGORY</th>
                                                        <td class="product_dimensions"><%= dt.Rows[0]["JobSubCateName"].ToString()%></td>
                                                    </tr>






                                                    <tr>
                                                        <th>PROJECT FILE:</th>
                                                        <td>

                                                            <%
                                                                System.Data.DataTable dtpf = BindProjectFile(dt.Rows[0]["PartyID"].ToString());

                                                                if (dtpf != null && dtpf.Rows.Count > 0)
                                                                { %>

                                                            <p><%= dtpf.Rows[0]["Project_Name"].ToString()%> </p>

                                                            <%
                                                                } %>

                                                            <%else
                                                                { %>
                                                            <p>Not Available </p>
                                                            <%} %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Skills:</th>
                                                        <td>
                                                            <div class="many-skills">






                                                                <%
                                                                System.Data.DataTable dt4 = BindJobSkill(dt.Rows[0]["PartyID"].ToString());

                                                                if (dt4 != null && dt3.Rows.Count > 0)
                                                                { %>
                                                                <%for (int k = 0; k < dt4.Rows.Count; k = k + 1)
                                                                { %>

                                                                <a href="#"><%=dt4.Rows[k]["Skill_Name"].ToString()%></a>

                                                                <%} %>

                                                                <% } %>
                                                            </div>
                                                        </td>
                                                    </tr>




                                                </table>
                                                <br />






                                                <%--Job Description--%>


                                                <div class="job-description">
                                                    <div class="col-inner">


                                                        <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing" style="text-align: left;">Job Description</h3>
                                                        <div class="" style="text-align: left;" data-effect="none">
                                                            <div class="nz-separator solid" id="div_01b4_21">&nbsp;</div>
                                                        </div>
                                                    </div>
                                                    <p><span id="span_6510_1"><%= dt.Rows[0]["ShortDescription"].ToString()%></span></p>
                                                </div>
                                                <br />


                                                <%--Work details--%>

                                                <div class="work-details-section">

                                                    <div class="col-inner">


                                                        <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing" style="text-align: left;">Work Details</h3>
                                                        <div class="" style="text-align: left;" data-effect="none">
                                                            <div class="nz-separator solid" id="div_01b4_21">&nbsp;</div>
                                                        </div>
                                                    </div>


                                                    <%
                                                        System.Data.DataTable dtpf1 = BindProjectFile(dt.Rows[0]["PartyID"].ToString());

                                                        if (dtpf1 != null && dtpf1.Rows.Count > 0)
                                                        { %>


                                                    <div class="work-details">
                                                        <div class="work-details-image">

                                                            <%if (dtpf1.Rows[0]["Project_Image"].ToString() != string.Empty)
                                                                { %>


                                                            <%--  <a href="../ClientContractDoc/<%=dtpf1.Rows[0]["Project_Image"].ToString()%>" target="_blank">--%>
                                                            <img class="work-image" style="width: 231px; height: 223px;" src="../ClientContractDoc/<%=dtpf1.Rows[0]["Project_Image"].ToString()%>" alt="Project image" />
                                                            <%--  </a>--%>
                                                            <%} %>

                                                            <%else
                                                            { %>
                                                            <img class="work-image" style="width: 231px; height: 223px;" alt="work image" src="../images/dummy.jpg" />

                                                            <%} %>
                                                        </div>
                                                        <div>
                                                            <h3>Project Title</h3>
                                                            <p><span id="span_6510_1"><%= dtpf1.Rows[0]["Project_Name"].ToString()%></span></p>
                                                        </div>
                                                    </div>


                                                    <%} %>
                                                </div>




                                                <%--Keywords--%>

                                                <div class="keywords">

                                                    <div class="col-inner">


                                                        <h3 id="h3_01b4_1" class="vc_custom_heading ninzio-latter-spacing" style="text-align: left;">Keywords</h3>
                                                        <div class="" style="text-align: left;" data-effect="none">
                                                            <div class="nz-separator solid" id="div_01b4_21">&nbsp;</div>
                                                        </div>
                                                    </div>

                                                    <div class="keywords-item">

                                                        <%
                                                            System.Data.DataTable dtk = BindKeyword(dt.Rows[0]["PartyID"].ToString());

                                                            if (dtk != null && dtk.Rows.Count > 0)
                                                            {

                                                                for (int k = 0; k < dtk.Rows.Count; k = k + 1)
                                                                {


                                                        %>

                                                        <a href="#"><%=dtk.Rows[k]["Keyword"].ToString()%></a>
                                                        <%--  <a href="#">Web development</a>
                                                            <a href="#">Web designing</a>
                                                            <a href="#">Web application</a>
                                                            <a href="#">Digital marketing</a>
                                                            <a href="#">Graphic designing</a>
                                                            <a href="#">SEO</a>
                                                            <a href="#">Extra specility</a>
                                                            <a href="#">Other words</a>--%>

                                                        <%}
                                                            } %>
                                                    </div>

                                                </div>
                                            </div>

                                            <% }%>
                                        </div>
                                    </div>
                                </div>


                            </article>


                        </div>


                    </section>



                </section>


                <%--  //Secrion 2--%>




                <aside class="sidebar">

                    <uc1:Newregistration ID="Newregistration1" runat="server" />

                </aside>

            </div>
            </section>
               
        </div>



        <%--New upper footer--%>

        <footer class="upper-footer">
            <div class="container">

                <div class="row upper-footer-row">

                    <div class="first-col">
                        <h5 class="heading">Jobs by Skills</h5>
                        <div class="first-col-item">
                            <div class="first-col-skill-item">
                                <div class="first-skill-item">
                                    <a href="#">Data Analytics Jobs</a>
                                    <a href="#">CCNA Jobs</a>
                                    <a href="#">Digital Marketing Jobs</a>
                                    <a href="#">Finance Jobs</a>
                                    <a href="#">HR Jobs</a>
                                    <a href="#">Mainframe Jobs</a>
                                    <a href="#">Marketing Jobs</a>
                                    <a href="#">Networking Jobs</a>
                                    <a href="#">Software Testing Jobs</a>
                                </div>
                                <div class="second-skill-item">
                                    <a href="#">Data Analytics Jobs</a>
                                    <a href="#">CCNA Jobs</a>
                                    <a href="#">Digital Marketing Jobs</a>
                                    <a href="#">Finance Jobs</a>
                                    <a href="#">HR Jobs</a>
                                    <a href="#">Mainframe Jobs</a>
                                    <a href="#">Marketing Jobs</a>
                                    <a href="#">Networking Jobs</a>
                                    <a href="#">Software Testing Jobs</a>
                                </div>
                                <div class="third-skill-item">
                                    <a href="#">Data Analytics Jobs</a>
                                    <a href="#">CCNA Jobs</a>
                                    <a href="#">Digital Marketing Jobs</a>
                                    <a href="#">Finance Jobs</a>
                                    <a href="#">HR Jobs</a>
                                    <a href="#">Mainframe Jobs</a>
                                    <a href="#">Marketing Jobs</a>
                                    <a href="#">Networking Jobs</a>
                                    <a href="#">Software Testing Jobs</a>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="second-col">
                        <h5 class="heading">Jobs by Industry</h5>
                        <div class="second-col-item">
                            <a href="#">IT/Software Jobs</a>
                            <a href="#">Core Technical Jobs</a>
                            <a href="#">Research Jobs</a>
                            <a href="#">Tech Support Jobs</a>
                            <a href="#">Part Time Jobs</a>
                            <a href="#">Retail Jobs</a>
                            <a href="#">Internship Jobs</a>
                            <a href="#">Finance Jobs</a>
                            <a href="#">Dream Jobs</a>
                        </div>
                    </div>
                    <div class="third-col">
                        <h5 class="heading">Jobs by Role</h5>
                        <div class="third-col-item">
                            <a href="#">Accountant Jobs</a>
                            <a href="#">Architect Jobs</a>
                            <a href="#">Telecaller Jobs</a>
                            <a href="#">Data Entry Jobs</a>
                            <a href="#">IT - Jobs</a>
                            <a href="#">Non-IT Jobs</a>
                            <a href="#">Management Trainee Jobs</a>
                            <a href="#">Sales/Marketing Jobs</a>
                            <a href="#">HR-Admin Jobs</a>
                        </div>
                    </div>
                    <div class="fourth-col">
                        <h5 class="heading">Jobs by City</h5>
                        <div class="fourth-col-item">
                            <a href="#">Agra</a>
                            <a href="#">Indore</a>
                            <a href="#">Bhopal</a>
                            <a href="#">Ahemdabad</a>
                            <a href="#">Sagar</a>
                            <a href="#">Shivpuri</a>
                            <a href="#">Morena</a>
                            <a href="#">Dabra</a>
                            <a href="#">Jhansi</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
</asp:Content>

