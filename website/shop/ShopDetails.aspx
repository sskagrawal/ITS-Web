<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShopDetails.aspx.cs" Inherits="shop_ShopDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
		.small_image_item{
			/*float: left;*/
			display: flex;
			padding-left: 19px;
			margin-top: 0;
		}
		ul li{
			margin-bottom: 10px;
			list-style: none;
		}
		ul li img{
			height: 70px !important;
			width: 70px !important;
		}
		.big_img{
			width: 350px !important;
			height: 400px !important;
			margin-left: 10px;
		}
        .product-colors {
            margin-bottom: 10px;
        }
        .colors-heading{
            color: #777;
        }
        .colors-image{
            width: 55px !important;
            height: auto;
            margin-right: 10px;
        }

        button#size-guide {
            background: none;
            color: red;
            text-transform: initial !important;
        }
        span.size {
            background: none;
            color: #777;
            padding: 5px 22px;
            border: 1px solid #777;
            margin-right: 5px;
            border-radius: 5px;
        }
        .size-item {
            position: sticky;
        }
        input#ContentPlaceHolder1_btnSubmit {
            position: static;
        }
        span.size.size-active {
            background: #666;
            color: white;
        }

        img.colors-image.c-image-active {
    border-color: #666;
    border: 1px solid rgba(140, 139, 137, 0.5);
    box-shadow: 0 0 5px 1px #666;
}

        /*Popup Css*/


        /* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  -webkit-animation-name: fadeIn; /* Fade in the background */
  -webkit-animation-duration: 0.4s;
  animation-name: fadeIn;
  animation-duration: 0.4s
}

/* Modal Content */
.modal-content {
  position: fixed;
  top: 20%;
  background-color: #fefefe;
  width: 100%;
  -webkit-animation-name: slideIn;
  -webkit-animation-duration: 0.4s;
  animation-name: slideIn;
  animation-duration: 0.4s
}

/* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}

/* Add Animation */
@-webkit-keyframes slideIn {
  from {bottom: -300px; opacity: 0} 
  to {bottom: 0; opacity: 1}
}

@keyframes slideIn {
  from {bottom: -300px; opacity: 0}
  to {bottom: 0; opacity: 1}
}

@-webkit-keyframes fadeIn {
  from {opacity: 0} 
  to {opacity: 1}
}

@keyframes fadeIn {
  from {opacity: 0} 
  to {opacity: 1}
}



	</style>

    <style>
	.modal-content {
        padding: 50px;
        width: 50%;
        left: 25%;
    }
    .final-guide-container {
        width: 100%;
    }
	.guide-table{
    	width: 100%;
     }
       
    .close{
        color: black;
    }
    
</style>


    <%--Popup table css--%>

    
        <style>

            .guide-header h2 {
    border-bottom: 1px solid #ccc;
    padding-bottom: 5px;
}
            .guide-description h3 {
    padding-bottom: 8px;
}

.size-table{
	display: flex;
    width: 100%;
    border: 1px solid #ccc;
}
.size-name{
	width: 33%;
    text-align: center;
}
.size-table h5{
	border-bottom: 1px solid #ccc;
    display: flex;
    align-items: center;
    text-align: center;
    justify-content: center;
   }
   
.size-table p{
	border-bottom: 1px solid #ccc;
    padding-bottom: 5px;
    text-align: center;
}

.size-table p:last-child{
	border: none;
    height: 20px;
}

.size-in-inch{
	width: 33%;
    text-align: center;
    border-left: 1px solid #ccc;
    border-right: 1px solid #ccc;
}
.size-in-cm{
	width: 33%;
    text-align: center;
}
#inch{
	display: block;
}
#cm{
	display: none;
}
</style>


    <style>
        .size-tabs {
    display: inline-block;
    border: 1px solid #ccc;
}
        button.inch_tab {
    display: inline-block;
    padding: 5px;
    background: none;
    color: black;
    border-right: 1px solid #ccc;
}
        button.cm_tab {
    display: inline-block;
    padding: 5px;
    background: none;
    color: black;
}
        button.inch_tab:hover {
    background: #ccc;
}
        button.cm_tab:hover {
    background: #ccc;
}
        button.inch_tab.active {
    background-color: black;
  color: white;
}
        button.cm_tab.active {
    background-color: black;
  color: white;
}

        @media only screen and (max-width: 767px) {
            .modal-content {
                width: 80%;
                left: 10%;
                top: 0;
                padding: 30px;
            }   
        }


        @media only screen and (max-width: 375px) {
            .modal-content {
                width: 100%;
                left: 0;
                top: 0;
                padding: 30px;
            }
        }
         a.single_add_to_cart_button.button.alt {
            position: static !important;
        }
    
    </style>
   
	




    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:HiddenField ID="hdfProdId" runat="server" />
      <asp:HiddenField ID="hdfChidcatId" runat="server" />
     <header class="rich-header page-header version1" data-parallax="true" id="header_6510_0">
                    <div class="parallax-container" id="div_6510_0">&nbsp;</div>
                    <div class="container nz-clearfix">

                        <div class="rh-content">
                            <h1>Product  Details</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_6510_1" class="nz-breadcrumbs nz-clearfix"><a href="http://astritbublaku.com/demos/montserrat/index.html"  property="v:title">Home</a><span class="current">Product Details</span></div>
                        </div>
                    </div>
                    <div id="slider-arrow" data-target="#nz-target" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
                </header>

       <div class="shop-layout-wrap medium" id="nz-target">
                    <div class="post-single-navigation nz-clearfix">
                        <a rel="prev" href="#" title="Portable USB"></a>
                        <a rel="next" href="#" title="Office pencils"></a>
                    </div>

                   

                    <section class='content nz-clearfix' data-rp="true" data-rpn="4">
                        <div class="container">


                              <%if (DtProduct != null && DtProduct.Rows.Count > 0)

                                                foreach (System.Data.DataRow row in DtProduct.Rows)
                                                {

                                                    {%>
                                      

                            <section class="main-content left">

                                <div id="product-2786" class="post-2786 product type-product status-publish has-post-thumbnail product_cat-cash-box product_tag-cutting-mat product_tag-envelope product_tag-fax-paper first instock shipping-taxable purchasable product-type-simple">

                                    <div class="single-image-content nz-clearfix">




                                        <div class="single-product-image">
                                            <%--<asp:HiddenField ID="hdfSelImg" runat="server" />--%>
                                            <asp:HiddenField ID="hdfMrpPrc" runat="server" />
                                          <asp:HiddenField ID="hdfSelSize" runat="server" />
                                            <%--  <asp:HiddenField ID="hdfSelImgName" runat="server" />--%>
	                                        <img src="../Product_image/<%=row["Mainproduct_image"]%>" class="big_img" height="600" width="600">
                                            <ul class="small_image_item">
                                                   <% System.Data.DataTable dt1 = Bind_thumbnailsProduct(row["Product_id"].ToString());
                                                            if (dt1 != null && dt1.Rows.Count > 0)
                                                            {

                                                                foreach (System.Data.DataRow rowt in dt1.Rows)
                                                                {


                                                             %>

                                                <li><img src="../Product_image/<%=rowt["Product_Photo"]%>" class="small_img"></li>
		                                      <%--  <li><img src="../Product_image/product21.jpeg" class="small_img"></li>
		                                        <li><img src="../Product_image/product22.jpeg" class="small_img"></li>
		                                        <li><img src="../Product_image/product23.jpeg" class="small_img"></li>
		                                        <li><img src="../Product_image/product24.jpeg" class="small_img"></li>--%>
	                                         <%}} %>
                                                 </ul>
                                        </div>




                                        <div class='single-product-summary'>
                                            <div class="summary entry-summary">

                                                <h2 class="product_title entry-title"><%=row["product_name"]%></h2>
                                                <div class="woocommerce-product-rating" >
                                                    <div class="star-rating" title="Rated 4 out of 5">
                                                        <span id="span_6510_0">
                                                        <strong  class="rating">4</strong> out of <span >5</span> based on <span  class="rating">1</span> customer rating </span>
                                                    </div>
                                                    <a href="#reviews" class="woocommerce-review-link" rel="nofollow">(<span  class="count">1</span> customer review)</a> </div>

                                                <div >

                                                    <p class="price"><span class="woocommerce-Price-amount amount">
                                                        
                                                        <span class="woocommerce-Price-currencySymbol">&#x20b9;

                                                        </span>
                                                        
                                                       <span id="prdPrc"></span>

                                                       </span>
                                                    </p>

                                                </div>
                                                <div>
                                                    <div class="description">             
                                                        
                                                        
                                                        <%=row["Full_description"]%>



                                                    </div>
                                                    <div class="post-social-share nz-clearfix">
                                                        <div class="social-links left nz-clearfix">
                                                            <a title="Share on Facebook" class="post-facebook-share icon-facebook" target="_blank" href="#"></a>
                                                            <a title="Tweet this!" class="post-twitter-share icon-twitter" target="_blank" href="#"></a>
                                                            <a title="Share on Pinterest" class="post-pinterest-share icon-pinterest" target="_blank" href="#"></a>
                                                            <a title="Share on LinkedIn" class="post-linkedin-share icon-linkedin" target="_blank" href="#"></a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <p class="stock in-stock">94 in stock</p>

                                                <div class="cart" method="post" enctype='multipart/form-data'>

                                                    <div class="quantity">
                                                        <input type="number" step="1" min="1" max="94" id="prdQnt" name="quantity" value="1" title="Qty" class="input-text qty text" size="4" pattern="[0-9]*" inputmode="numeric" />
                                                    </div>

                                                    <input type="hidden" name="add-to-cart" value="2786" />
                                                    <span id="addToCrt"><a class="single_add_to_cart_button button alt" >Add to cart</a></span>
                                                  <%--<a class="single_add_to_cart_button button alt" >Add to cart</a>--%>
                                                      <%--<asp:button id="btnSubmit"  class="single_add_to_cart_button button alt" runat="server" text="Add to cart" />--%>

                                                   <%-- <button type="submit" class="single_add_to_cart_button button alt">Add to cart</button>--%>

                                                </div>

                                                <div class="product_meta">

                                                    <span class="sku_wrapper">SKU: <span class="sku" >16351684</span></span>

                                                    <span class="posted_in">Category: <a href="#" rel="tag">Cash Box</a></span>
                                                    <span class="tagged_as">Tags: <a href="#" rel="tag">Cutting Mat</a>, 
                                                    <a href="#" rel="tag">Envelope</a>, <a href="#" rel="tag">Fax Paper</a></span>

                                                </div>

                                                <div class="product-colors">
                                                    <p class="colors-heading">More Colors:</p>
                                                    
                                                     <%-- <a><img id="<%=row["Mainproduct_image"]%>" class="colors-image" src="../Product_image/<%=row["Mainproduct_image"]%>" onclick="getImg(<%=row["Mainproduct_image"]%>)" /></a>--%>
                                                     <% System.Data.DataTable dt2 = Bind_thumbnailsProduct(row["Product_id"].ToString());
    if (dt2 != null && dt2.Rows.Count > 0)
    {%>
 <input id="hdfSelImg" type="hidden" value="<%=dt2.Rows[0]["Prd_PhotoId"]%>" />
                                                    <input id="hdfSelImgName" type="hidden" value="<%=dt2.Rows[0]["Product_Photo"]%>" />
       <% foreach (System.Data.DataRow rowt in dt2.Rows)
        {


                                                             %>
                                                    <a><img id="pimg_<%=rowt["Prd_PhotoId"]%>" class="colors-image" src="../Product_image/<%=rowt["Product_Photo"]%>" onclick="getImg('<%=row["Product_id"].ToString() %>','<%=rowt["Product_Photo"]%>',<%=rowt["Prd_PhotoId"]%>)" /></a>
                                                    <%}
    %>

                                                  

                                                    <%} %>
                                                   <%-- <a><img class="colors-image" src="../Product_image/product2.jpeg" /></a>
                                                    <a><img class="colors-image" src="../Product_image/product2.jpeg" /></a>
                                                    <a><img class="colors-image" src="../Product_image/product2.jpeg" /></a>
                                                    <a><img class="colors-image" src="../Product_image/product2.jpeg" /></a>--%>
                                                </div>
                                                <div class="product-size">
                                                    <p class="size-heading">Select Size &nbsp; &nbsp; &nbsp;<a><button id="size-guide">Size Guide</button></a></p>
                                                    
 
                                                    
                                                                                                       
<!-- The Modal -->
<div id="myModal" class="modal">


  <!-- Modal content -->
  <div class="modal-content">
       <span class="close">&times;</span>
            <div class="final-guide-container">
    	<div class="guide-header"><h2>Size</h2></div>
        <div class="guide-description">
        	<h3>Rare Rabbit</h3>
        </div>
   <div class="size-for-table">
    <div class="size-tabs">
      <button class="inch_tab">
          <a onclick="closeCity('Inch')">Inch</a>
      </button>
      <button class="cm_tab">
          <a onclick="closeCity('Cm')">Cm</a>
      </button>
   </div>
    <div class="size-inch-tab state" id="Inch" style="display:block;">
        <p>We have provided the products measurements to help you decide which size to buy</p>
  <div class="size-table">
	  <div class="size-name">
      	<h5>Size</h5>
        <p>S</p>
        <p>M</p>
        <p>L</p>
        <p>XL</p>
        <p>XXL</p>
      </div>
      <div class="size-in-inch">
      	<h5>Chest</h5>
        <p>10</p>
        <p>20</p>
        <p>30</p>
        <p>40</p>
        <p>50</p>
      </div>
      <div class="size-in-cm">
      	<h5>Shoulder</h5>
        <p>11</p>
        <p>12</p>
        <p>14</p>
        <p>15</p>
        <p>16</p>
      </div>
  </div>
    </div>
    <div class="size-cm-tab state" id="Cm" style="display:none;">
      <p>We have provided the products measurements to help you decide which size to buy</p>
          <div class="size-table">
  <div class="size-name">
      	<h5>Size</h5>
        <p>S</p>
        <p>M</p>
        <p>L</p>
        <p>XL</p>
        <p>XXL</p>
      </div>
      <div class="size-in-inch">
      	<h5>Chest</h5>
        <p>1</p>
        <p>2</p>
        <p>3</p>
        <p>4</p>
        <p>5</p>
      </div>
      <div class="size-in-cm">
      	<h5>Shoulder</h5>
        <p>10</p>
        <p>20</p>
        <p>30</p>
        <p>40</p>
        <p>50</p>
      </div>
  </div>
    </div>
</div>



    </div>


  </div>

</div>
                                                    
                                                    <div class="size-item">
                                                         <%
                                                      System.Data.DataTable dtPrdSz = BindProductPrice(row["Product_id"].ToString());
                                                      if (dtPrdSz != null && dtPrdSz.Rows.Count > 0)
                                                      {

                                                          foreach (System.Data.DataRow rowp in dtPrdSz.Rows)
                                                          {


                                                             %>
                                                        <span class="size" id="size_<%=rowp["ProductSize_id"] %>" onclick="getPrc(<%=row["Product_id"]%>,<%=rowp["MrpPrice"]%>,<%=rowp["SellingPrice"] %>,<%=rowp["ProductSize_id"] %>)"><%=rowp["Size_name"] %></span>
                                                        <%}
                                                      } %>
                                                        <%--<button type="button" class="size">M</button>
                                                        <button type="button" class="size">L</button>
                                                        <button type="button" class="size">XL</button>
                                                        <button type="button" class="size">2XL</button>--%>
                                                    </div>
                                                 </div>

                                            </div>
                                            <!-- .summary -->

                                        </div>



                                      






                                    </div>

                                    <div class="woocommerce-tabs wc-tabs-wrapper">
                                        <ul class="tabs wc-tabs">
                                            <li class="description_tab">
                                                <a <%--href="#"--%> onclick="openCity('Description')">Description</a>
                                            </li>
                                            <li class="additional_information_tab">
                                                <a <%--href="#"--%> onclick="openCity('Additional Information')">Additional Information</a>
                                            </li>
                                            <li class="reviews_tab">
                                                <a <%--href="#"--%> onclick="openCity('Reviews(1)')">Reviews(1)</a>
                                            </li>
                                        </ul>
                                        <div class="woocommerce-Tabs-panel woocommerce-Tabs-panel--description panel entry-content wc-tab city" <%--id="tab-description"--%> id="Description">

                                            <h2>Product Description</h2>

                                            <p><span id="span_6510_1"><%=row["Full_description"]%></span></p>
                                         <%--   <p><span id="span_6510_2">Quickly maximize timely deliverables for real-time schemas. Dramatically maintain clicks-and-mortar solutions without functional solutions. Completely synergize resource taxing relationships via premier niche markets. Professionally cultivate one-to-one customer service with robust ideas. Dynamically innovate resource-leveling customer service for state of the art customer service.</span>--%>
                                                <%--<br />
                                                <div class='gap nz-clearfix' id="div_6510_2">&nbsp;</div>
                                                <h4>Features</h4>
                                                <div class='gap nz-clearfix' id="div_6510_3">&nbsp;</div>

                                                <ul class="nz-i-list none">
                                                    <li>
                                                        <div><span class="icon icon-minus4" id="span_6510_3"></span></div>
                                                        <div>It is made of environmental material that is harmless to your health.</div>
                                                    </li>
                                                    <li>
                                                        <div><span class="icon icon-minus4" id="span_6510_4"></span></div>
                                                        <div>It can be used for writing, drawing and sketching on paper.</div>
                                                    </li>
                                                    <li>
                                                        <div><span class="icon icon-minus4" id="span_6510_5"></span></div>
                                                        <div>The print effect is clear, uniform in color and easy to fade out.</div>
                                                    </li>
                                                    <li>
                                                        <div><span class="icon icon-minus4" id="span_6510_6"></span></div>
                                                        <div>Colorful, extra-smooth lines in rough drafts, sketches and pencil illustrations are provided.</div>
                                                    </li>
                                                    <li>
                                                        <div><span class="icon icon-minus4" id="span_6510_7"></span></div>
                                                        <div>It fits comfortably into your hand for a smooth writing experience.</div>
                                                    </li>
                                                    <li>
                                                        <div><span class="icon icon-minus4" id="span_6510_8"></span></div>
                                                        <div>Strong tip prevents breaking, ensuring a longer life for your pencil.</div>
                                                    </li>
                                                </ul>--%>

<%--                                                <div class='gap nz-clearfix' id="div_6510_4">&nbsp;</div>
                                                <h4>Package include</h4>
                                                <div class='gap nz-clearfix' id="div_6510_5">&nbsp;</div>
                                                1 x Set of 72 Marco Fine Art Color Pencils
                                                <br />--%>
                                              <%--  <div class='gap nz-clearfix' id="div_6510_6">&nbsp;</div>
                                                <h4>Note:</h4>
                                                <div class='gap nz-clearfix' id="div_6510_7">&nbsp;</div>

                                                <ul class="nz-i-list none">
                                                    <li>
                                                        <div><span class="icon icon-minus4" id="span_6510_9"></span></div>
                                                        <div>For Children 3 years old and above</div>
                                                    </li>
                                                    <li>
                                                        <div><span class="icon icon-minus4" id="span_6510_10"></span></div>
                                                        <div>Due to different producing batches, product details might be a little different. If you minding the difference, please buy it carefully.</div>
                                                    </li>
                                                    <li>
                                                        <div><span class="icon icon-minus4" id="span_6510_11"></span></div>
                                                        <div>Please allow 1-3CM differs due to manual measurement.</div>
                                                    </li>
                                                    <li>
                                                        <div><span class="icon icon-minus4" id="span_6510_12"></span></div>
                                                        <div>If you have any questions,please feel free to contact us,we will solve your questions in the first time</div>
                                                    </li>
                                                </ul>--%>

                                        </div>
                                        <div class="woocommerce-Tabs-panel woocommerce-Tabs-panel--additional_information panel entry-content wc-tab city" <%--id="tab-additional_information"--%> id="Additional Information" style="display:none;">

                                            <h2> Product Specification</h2>

                                            <table class="shop_attributes">

                                                 <% System.Data.DataTable dtt = BindProductSpecification(row["Product_id"].ToString());
                                              if (dtt != null && dtt.Rows.Count > 0)
                                              {

                                               foreach (System.Data.DataRow dr in dtt.Rows)
                                                 {


                                                             %>

                                                <tr >
                                                    <th><%=dr["Specification_name"]%></th>
                                                    <td class="product_weight"><%=dr["Specification_value"]%></td>
                                                </tr>

                                                <%} } %>

                                            

                                            </table>
                                        </div>
                                        <div class="woocommerce-Tabs-panel woocommerce-Tabs-panel--reviews panel entry-content wc-tab city" <%--id="tab-reviews"--%> id="Reviews(1)" style="display:none;">
                                            <div id="reviews" class="woocommerce-Reviews">
                                                <div id="comments">
                                                    <h2 class="woocommerce-Reviews-title">1 review for <span>Business cards</span></h2>

                                                    <ol class="commentlist">
                                                        <li itemprop="review" itemscope itemtype="http://schema.org/Review" class="comment byuser comment-author-montserratadmin bypostauthor even thread-even depth-1" id="li-comment-67">

                                                            <div id="comment-67" class="comment_container">

                                                                <img alt='' src='../upload/avatar.png' class='avatar avatar-60 photo' height='60' width='60' />
                                                                <div class="comment-text">

                                                                    <div itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating" class="star-rating" title="Rated 4 out of 5">
                                                                        <span id="span_6510_13"><strong itemprop="ratingValue">4</strong> out of 5</span>
                                                                    </div>

                                                                    <p class="meta">
                                                                        <strong itemprop="author">montserrat@admin</strong> &ndash;
                                                                        <time itemprop="datePublished" datetime="2016-09-14T08:10:36+00:00">September 14, 2016</time>:
                                                                    </p>

                                                                    <div itemprop="description" class="description">
                                                                        <p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <!-- #comment-## -->
                                                    </ol>

                                                </div>
                                                <div id="review_form_wrapper">
                                                    <div id="review_form">
                                                        <div id="respond" class="comment-respond">
                                                            <h3 id="reply-title" class="comment-reply-title">Add a review <small><a rel="nofollow" id="cancel-comment-reply-link" href="index.html#respond" >Cancel reply</a></small></h3>
                                                            <form action="#" method="post" id="commentform" class="comment-form">
                                                                <p class="comment-notes"><span id="email-notes">Your email address will not be published.</span> Required fields are marked <span class="required">*</span></p>
                                                                <p class="comment-form-rating">
                                                                    <label for="rating">Your Rating</label>
                                                                    <select name="rating" id="rating" aria-required="true" required>
                                                                        <option value="">Rate&hellip;</option>
                                                                        <option value="5">Perfect</option>
                                                                        <option value="4">Good</option>
                                                                        <option value="3">Average</option>
                                                                        <option value="2">Not that bad</option>
                                                                        <option value="1">Very Poor</option>
                                                                    </select>
                                                                </p>
                                                                <p class="comment-form-comment">
                                                                    <label for="comment">Your Review <span class="required">*</span></label>
                                                                    <textarea id="comment" name="comment" cols="45" rows="8" aria-required="true" required></textarea>
                                                                </p>
                                                                <p class="comment-form-author">
                                                                    <label for="author">Name <span class="required">*</span></label>
                                                                    <input id="author" name="author" type="text" value="" size="30" aria-required="true" required />
                                                                </p>
                                                                <p class="comment-form-email">
                                                                    <label for="email">Email <span class="required">*</span></label>
                                                                    <input id="email" name="email" type="email" value="" size="30" aria-required="true" required />
                                                                </p>
                                                                <p class="form-submit">
                                                                    <input name="submit" type="submit" id="submit" class="submit" value="Submit" />
                                                                    <input type='hidden' name='comment_post_ID' value='2786' id='comment_post_ID' />
                                                                    <input type='hidden' name='comment_parent' id='comment_parent' value='0' />
                                                                </p>
                                                            </form>
                                                        </div>
                                                        <!-- #respond -->
                                                    </div>
                                                </div>

                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <!-- #product-2786 -->

                                <div class="nz-clearfix">&nbsp;</div>
                                <%--<div class="nz-related-products column-4">
                                    <div class="related-products-title">
                                        <h3>Related products</h3></div>
                                    <ul class="products nz-clearfix">

   

                                        <li class="mix product nz-clearfix" data-grid="ninzio_01">
                                            <a href="ShopDetails.aspx?PId=<%=row["Product_id"]%>">
                                                <div class="nz-thumbnail">
                                                    <img width="383" height="440" src="../Product_image/<%=dr1["Mainproduct_image"]%>" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="product1" title="product1" /> <img class="hover-img" src="../Product_image/<%=dr1["Mainproduct_image"]%>" alt="Office pens"> </div>
                                            </a>
                                            <div class="product-details">

                                                <div class="product-title nz-clearfix">
                                                    <h3><a href="ShopDetails.aspx?PId=<%=row["Product_id"]%>"><%=dr1["product_name"]%> </a></h3>
                                                </div>
                                                <div class="star-rating" title="Rated 4 out of 5"><span id="span_d016_0"><strong class="rating">4</strong> out of 5</span></div> <span class="price"><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#x20b9;


                                                         </span>
                                                    
                                                    
                                                    
                                                 




                                                                                                                                                                                                     </span>
                                                </span>
                                                <div class="cart-wrap nz-clearfix">
                                                    <div class="shop-loader">
                                                        <div></div>
                                                        <div></div>
                                                        <div></div>
                                                        <div></div>
                                                        <div></div>
                                                    </div>
                                                    <a rel="nofollow" href="indexada7.html?add-to-cart=2790" data-quantity="1" data-product_id="2790" data-product_sku="" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a> </div>
                                            </div>
                                        </li>


                                        <%}
                                            } %>


                                     
                                    </ul>
                                </div>--%>
                            </section>



                               

                            <aside class="sidebar">
                                <div class='shop-widget-area-single widget-area'>
                                 
                                    <div id="woocommerce_product_categories-3" class="widget woocommerce widget_product_categories">
                                        <h6 class="widget_title">Product Categories</h6>
                                        <ul class="product-categories">

                                         
                                            <asp:literal id="ltrChildCatId" runat="server"></asp:literal>

                                           <%-- <li class="cat-item cat-item-96"><a href="#">Bags</a></li>
                                            <li class="cat-item cat-item-97"><a href="#">Calculator</a></li>
                                            <li class="cat-item cat-item-98"><a href="#">Carbon Paper</a></li>
                                            <li class="cat-item cat-item-99 current-cat"><a href="#">Cash Box</a></li>--%>


                                        </ul>
                                    </div>
                                    <div id="woocommerce_top_rated_products-3" class="widget woocommerce widget_top_rated_products">
                                        <h6 class="widget_title">Related Products</h6>
                                        <ul class="product_list_widget">
                                            

                                      <% System.Data.DataTable dtrp = BindRelatedProduct(row["Product_id"].ToString());
                                         if (dtrp != null && dtt.Rows.Count > 0)
                                        {

                                        foreach (System.Data.DataRow dr1 in dtrp.Rows)
                                            {

                                          %>

                                            <li>
                                                <a href="ShopDetails.aspx?PId=<%=dr1["Product_id"]%>" title="<%=dr1["product_name"]%>">
                                                    <img width="90" height="90" src="../Product_image/<%=dr1["Mainproduct_image"]%>" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="<%=dr1["product_name"]%>"  /> <span class="product-title"><%=dr1["product_name"]%></span>
                                                </a>
                                                <div class="star-rating" title="Rated 5 out of 5"><span id="span_d016_4"><strong class="rating">5</strong> out of 5</span></div> <span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#x20b9;

                                               </span>
                                                    
                                                    
                                                    
                                                    <%
                                                  System.Data.DataTable dt4 = BindProductPrice(row["Product_id"].ToString());
                                                 if (dt4 != null && dt4.Rows.Count > 0)
                                                        {

                                                         foreach (System.Data.DataRow rowp1 in dt4.Rows)
                                                          {


                                                             %>

                                                                <%=rowp1["MrpPrice"]%>

                                                        <%}
                                                        } %>



                                                                                                                                                                                 </span>
                                            </li>

                                           
                                            <%}
                                               } %>

                                        </ul>
                                    </div>
                                </div>
                            </aside>


                             <%}
                                                } %>

                        </div>
                    </section>
                </div>
    <script src="zoomsl.js" ></script>

    <script>
        function openCity(cityName) {
            var i;
            var x = document.getElementsByClassName("city");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            document.getElementById(cityName).style.display = "block";
        }
    </script>
    <script>
        function closeCity(cityName) {
            var i;
            var x = document.getElementsByClassName("state");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            document.getElementById(cityName).style.display = "block";
        }
    </script>




    <script type="text/javascript">
	$(document).ready(function(){
		$(".small_img").hover(function(){
			$(".big_img").attr('src',$(this).attr('src'));
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".big_img").imagezoomsl({
			zoomrange: [3, 3]
		});
	});
</script>


    <script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("size-guide");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
function getPrc(pid,mrp,sprc,psid)
{
    var sz = document.getElementById('size_' + psid + '').innerHTML;
    $(".size-item > span").removeClass('size-active');
    $('#size_' + psid + '').addClass('size size-active');
    document.getElementById("prdPrc").innerHTML = sprc;
    //alert(document.getElementById("prdQnt").value);
    var qnt = document.getElementById("prdQnt").value;
    document.getElementById('<%= hdfMrpPrc.ClientID %>').value = mrp;
    document.getElementById('<%= hdfSelSize.ClientID %>').value = sz;
    var pimg = document.getElementById('hdfSelImg').value;
    var pimgNam = document.getElementById('hdfSelImgName').value;
    $(".product-colors > a > img").removeClass('c-image-active');
    $('#pimg_' + pimg + '').addClass('colors-image c-image-active');
    //alert(pimg);
    
    document.getElementById("addToCrt").innerHTML = "<a href='javascript:void(0)' class='single_add_to_cart_button button alt' onclick=\"ShowAddToCart('" + pid + "','" + qnt + "','','','" + pimgNam + "','" + sz + "','" + sprc + "','" + mrp + "','','')\">Add To Cart</a>";
    //alert(sprc);
}
function getImg(pid,pImg,pimgid)
{
    //var sz = document.getElementById('size_' + psid + '').innerHTML;
    var sz = document.getElementById('<%= hdfSelSize.ClientID %>').value;
    sprc=document.getElementById("prdPrc").innerHTML;

    var qnt = document.getElementById("prdQnt").value;
    var mrp = document.getElementById('<%= hdfMrpPrc.ClientID %>').value;
    document.getElementById('hdfSelImg').value = pimgid;
    document.getElementById('hdfSelImgName').value = pImg;
    $(".product-colors > a > img").removeClass('c-image-active');
    $('#pimg_' + pimgid + '').addClass('colors-image c-image-active');

    //alert(pImg);
    //document.getElementById("addToCrt").innerHTML = "";
    document.getElementById("addToCrt").innerHTML = "<a href='javascript:void(0)' class='single_add_to_cart_button button alt' onclick=\"ShowAddToCart('" + pid + "','" + qnt + "','','','" + pImg + "','" + sz + "','" + sprc + "','" + mrp + "','','')\">Add To Cart</a>";

}
</script>





</asp:Content>

