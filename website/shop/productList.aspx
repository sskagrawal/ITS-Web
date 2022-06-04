﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="productList.aspx.cs" Inherits="shop_productList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
      <header class="rich-header page-header version1" data-parallax="true" id="header_12e6_0">
                    <div class="parallax-container" id="div_12e6_0">&nbsp;</div>
                    <div class="container nz-clearfix">

                        <div class="rh-content">
                            <h1 >Montserrat Shop</h1>
                            <div class="rh-separator">&nbsp;</div>
                            <div id="div_12e6_1" class="nz-breadcrumbs nz-clearfix"><a href="http://astritbublaku.com/demos/montserrat/index.html"  property="v:title">Home</a><span class="current">Shop</span></div>
                        </div>
                    </div>
                    <div id="slider-arrow" data-target="#nz-target" data-from="90" data-offset="90" class="i-separator animate nz-clearfix"><i class="icon-arrow-down10"></i></div>
                </header>

                <div class="shop-layout-wrap small" id="nz-target">
                    <div class="loop">
                        <div class="container">
                            <section class="content lazy shop-layout nz-clearfix">

                                <p class="woocommerce-result-count">
                                    Showing 1&ndash;12 of 15 results</p>
                                <form class="woocommerce-ordering" method="get">
                                    <select name="orderby" class="orderby">
                                        <option value="popularity">Sort by popularity</option>
                                        <option value="rating">Sort by average rating</option>
                                        <option value="date" selected='selected'>Sort by newness</option>
                                        <option value="price">Sort by price: low to high</option>
                                        <option value="price-desc">Sort by price: high to low</option>
                                    </select>
                                    <input type="hidden" name="shop_layout" value="small" />
                                </form>

                                <ul class="products">

                                    <li class="post-2790 product type-product status-publish has-post-thumbnail product_cat-carbon-paper product_tag-cutting-mat product_tag-envelope product_tag-fax-paper first instock purchasable product-type-simple">
                                        <div class="woocommerce-LoopProduct-link">
                                            <div class="nz-thumbnail">
                                                <img width="383" height="440" src="http://astritbublaku.com/demos/montserrat/upload/product1-383x440.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="product1" title="product1" /> <img class="hover-img" src="http://astritbublaku.com/demos/montserrat/upload/product5.jpg" alt="Office pens"> </div>
                                            <div class="product-details">
                                                <h3>Office pens</h3>
                                                <span class="price"><span class="star-rating" title="Rated 4 out of 5"><span id="span_12e6_0"><strong class="rating">4</strong> out of 5</span></span><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>3.75</span>
                                            </span>
                                        </div>
                                        <div class="cart-wrap nz-clearfix">
                                            <a href="#" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                                            <div class="shop-loader">
                                                <div></div>
                                                <div></div>
                                                <div></div>
                                                <div></div>
                                                <div></div>
                                            </div>
                                        </div>
                        </div>
                        </li>

                        <li class="post-2788 product type-product status-publish has-post-thumbnail product_cat-calculator product_tag-cutting-mat product_tag-envelope product_tag-fax-paper  instock purchasable product-type-simple">
                            <div class="woocommerce-LoopProduct-link">
                                <div class="nz-thumbnail">
                                    <img width="383" height="440" src="../upload/product2-383x440.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="product2" title="product2"  /> <img class="hover-img" src="../upload/product9.jpg" alt="Office pencils"> </div>
                                <div class="product-details">
                                    <h3>Office pencils</h3>
                                    <span class="price"><span class="star-rating" title="Rated 4 out of 5"><span id="span_12e6_1"><strong class="rating">4</strong> out of 5</span></span><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>5.99</span>
                                </span>
                            </div>
                            <div class="cart-wrap nz-clearfix">
                                <a rel="nofollow" href="#" data-quantity="1" data-product_id="2788" data-product_sku="" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                                <div class="shop-loader">
                                    <div></div>
                                    <div></div>
                                    <div></div>
                                    <div></div>
                                    <div></div>
                                </div>
                            </div>
                    </div>
                    </li>

                    <li class="post-2786 product type-product status-publish has-post-thumbnail product_cat-cash-box product_tag-cutting-mat product_tag-envelope product_tag-fax-paper  instock shipping-taxable purchasable product-type-simple">
                        <div class="woocommerce-LoopProduct-link">
                            <div class="nz-thumbnail">
                                <img width="383" height="440" src="http://astritbublaku.com/demos/montserrat/upload/product10-383x440.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="product10" title="product10" /> <img class="hover-img" src="http://astritbublaku.com/demos/montserrat/upload/product12.jpg" alt="Business cards"> </div>
                            <div class="product-details">
                                <h3>Business cards</h3>
                                <span class="price"><span class="star-rating" title="Rated 4 out of 5"><span id="span_12e6_2"><strong class="rating">4</strong> out of 5</span></span><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>4.55</span>
                            </span>
                        </div>
                        <div class="cart-wrap nz-clearfix">
                            <a rel="nofollow" href="#" data-quantity="1" data-product_id="2786" data-product_sku="16351684" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                            <div class="shop-loader">
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                            </div>
                        </div>
                </div>
                </li>

                <li class="post-2784 product type-product status-publish has-post-thumbnail product_cat-bags product_tag-cutting-mat product_tag-envelope product_tag-fax-paper last instock purchasable product-type-simple">
                    <div class="woocommerce-LoopProduct-link">
                        <div class="nz-thumbnail">
                            <img width="383" height="440" src="http://astritbublaku.com/demos/montserrat/upload/product5-383x440.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="product5" title="product5"  /> <img class="hover-img" src="http://astritbublaku.com/demos/montserrat/upload/product1.jpg" alt="Portable USB"> </div>
                        <div class="product-details">
                            <h3>Portable USB</h3>
                            <span class="price"><span class="star-rating" title="Rated 4 out of 5"><span id="span_12e6_3"><strong class="rating">4</strong> out of 5</span></span><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>8.99</span>
                        </span>
                    </div>
                    <div class="cart-wrap nz-clearfix">
                        <a rel="nofollow" href="#" data-quantity="1" data-product_id="2784" data-product_sku="" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                        <div class="shop-loader">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                    </div>
                </li>

                <li class="post-2554 product type-product status-publish has-post-thumbnail product_cat-carbon-paper product_tag-cutting-mat product_tag-envelope product_tag-fax-paper first instock purchasable product-type-simple">
                    <div class="woocommerce-LoopProduct-link">
                        <div class="nz-thumbnail">
                            <img width="383" height="440" src="http://astritbublaku.com/demos/montserrat/upload/product9-383x440.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="product9" title="product9" /> <img class="hover-img" src="http://astritbublaku.com/demos/montserrat/upload/product2.jpg" alt="Office manager"> </div>
                        <div class="product-details">
                            <h3>Office manager</h3>
                            <span class="price"><span class="star-rating" title="Rated 2 out of 5"><span id="span_12e6_4"><strong class="rating">2</strong> out of 5</span></span><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>7.99</span>
                        </span>
                    </div>
                    <div class="cart-wrap nz-clearfix">
                        <a rel="nofollow" href="#" data-quantity="1" data-product_id="2554" data-product_sku="" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                        <div class="shop-loader">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                    </div>
                </li>

                <li class="post-2553 product type-product status-publish has-post-thumbnail product_cat-bags product_tag-cutting-mat product_tag-envelope product_tag-fax-paper  instock purchasable product-type-simple">
                    <div class="woocommerce-LoopProduct-link">
                        <div class="nz-thumbnail">
                            <img width="383" height="440" src="http://astritbublaku.com/demos/montserrat/upload/product3-383x440.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="product3" title="product3" /> <img class="hover-img" src="http://astritbublaku.com/demos/montserrat/upload/product7.jpg" alt="Office Keys"> </div>
                        <div class="product-details">
                            <h3>Office Keys</h3>
                            <span class="price"><span class="star-rating" title="Rated 5 out of 5"><span id="span_12e6_5"><strong class="rating">5</strong> out of 5</span></span><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>5.99</span>
                        </span>
                    </div>
                    <div class="cart-wrap nz-clearfix">
                        <a rel="nofollow" href="#" data-quantity="1" data-product_id="2553" data-product_sku="" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                        <div class="shop-loader">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                    </div>
                </li>

                <li class="post-2540 product type-product status-publish has-post-thumbnail product_cat-calculator product_tag-cutting-mat product_tag-envelope product_tag-fax-paper  instock purchasable product-type-simple">
                    <div class="woocommerce-LoopProduct-link">
                        <div class="nz-thumbnail">
                            <img width="383" height="440" src="http://astritbublaku.com/demos/montserrat/upload/product7-383x440.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="product7" title="product7" /> <img class="hover-img" src="http://astritbublaku.com/demos/montserrat/upload/product3.jpg" alt="Two blue pens"> </div>
                        <div class="product-details">
                            <h3>Two blue pens</h3>
                            <span class="price"><span class="star-rating" title="Rated 4 out of 5"><span id="span_12e6_6"><strong class="rating">4</strong> out of 5</span></span><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>3.99</span>
                        </span>
                    </div>
                    <div class="cart-wrap nz-clearfix">
                        <a rel="nofollow" href="#" data-quantity="1" data-product_id="2540" data-product_sku="" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                        <div class="shop-loader">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                    </div>
                </li>

                <li class="post-2534 product type-product status-publish has-post-thumbnail product_cat-cash-box product_tag-cutting-mat product_tag-envelope product_tag-fax-paper last instock sale purchasable product-type-simple">
                    <div class="woocommerce-LoopProduct-link"> <span class="product-status onsale">-26%</span>
                        <div class="nz-thumbnail">
                            <img width="383" height="440" src="http://astritbublaku.com/demos/montserrat/upload/product4-383x440.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="product4" title="product4" /> <img class="hover-img" src="http://astritbublaku.com/demos/montserrat/upload/product6.jpg" alt="Office printer"> </div>
                        <div class="product-details">
                            <h3>Office printer</h3>
                            <span class="price"><span class="star-rating" title="Rated 5 out of 5"><span id="span_12e6_7"><strong class="rating">5</strong> out of 5</span></span><del><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>7.99</span></del> <ins><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>5.99</span></ins></span>
                    </div>
                    <div class="cart-wrap nz-clearfix">
                        <a rel="nofollow" href="#" data-quantity="1" data-product_id="2534" data-product_sku="" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                        <div class="shop-loader">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                    </div>
                </li>

                <li class="post-2531 product type-product status-publish has-post-thumbnail product_cat-cash-box product_tag-cutting-mat product_tag-envelope product_tag-fax-paper first instock purchasable product-type-simple">
                    <div class="woocommerce-LoopProduct-link">
                        <div class="nz-thumbnail">
                            <img width="383" height="440" src="http://astritbublaku.com/demos/montserrat/upload/product8-383x440.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="product8" title="product8" /> <img class="hover-img" src="http://astritbublaku.com/demos/montserrat/upload/product11.jpg" alt="Office Specialist"> </div>
                        <div class="product-details">
                            <h3>Office Specialist</h3>
                            <span class="price"><span class="star-rating" title="Rated 4 out of 5"><span id="span_12e6_8"><strong class="rating">4</strong> out of 5</span></span><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>5.55</span>
                        </span>
                    </div>
                    <div class="cart-wrap nz-clearfix">
                        <a rel="nofollow" href="#" data-quantity="1" data-product_id="2531" data-product_sku="" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                        <div class="shop-loader">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                    </div>
                </li>

                <li class="post-2528 product type-product status-publish has-post-thumbnail product_cat-cash-box product_tag-cutting-mat product_tag-envelope product_tag-fax-paper  instock sale purchasable product-type-simple">
                    <div class="woocommerce-LoopProduct-link"> <span class="product-status onsale">-19%</span>
                        <div class="nz-thumbnail">
                            <img width="383" height="440" src="http://astritbublaku.com/demos/montserrat/upload/product6-383x440.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="product6" title="product6" /> <img class="hover-img" src="http://astritbublaku.com/demos/montserrat/upload/product8.jpg" alt="Customer care"> </div>
                        <div class="product-details">
                            <h3>Customer care</h3>
                            <span class="price"><span class="star-rating" title="Rated 4 out of 5"><span id="span_12e6_9"><strong class="rating">4</strong> out of 5</span></span><del><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>10.99</span></del> <ins><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>8.99</span></ins></span>
                    </div>
                    <div class="cart-wrap nz-clearfix">
                        <a rel="nofollow" href="#" data-quantity="1" data-product_id="2528" data-product_sku="" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                        <div class="shop-loader">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                    </div>
                </li>

                <li class="post-2525 product type-product status-publish has-post-thumbnail product_cat-calculator product_tag-cutting-mat product_tag-envelope product_tag-fax-paper  instock purchasable product-type-simple">
                    <div class="woocommerce-LoopProduct-link">
                        <div class="nz-thumbnail">
                            <img width="383" height="440" src="http://astritbublaku.com/demos/montserrat/upload/product11-383x440.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="product11" title="product11"  /> <img class="hover-img" src="http://astritbublaku.com/demos/montserrat/upload/product6.jpg" alt="Human Resources"> </div>
                        <div class="product-details">
                            <h3>Human Resources</h3>
                            <span class="price"><span class="star-rating" title="Rated 4 out of 5"><span id="span_12e6_10"><strong class="rating">4</strong> out of 5</span></span><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>7.99</span>
                        </span>
                    </div>
                    <div class="cart-wrap nz-clearfix">
                        <a rel="nofollow" href="#" data-quantity="1" data-product_id="2525" data-product_sku="" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                        <div class="shop-loader">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                    </div>
                </li>

                <li class="post-2523 product type-product status-publish has-post-thumbnail product_cat-calculator product_tag-cutting-mat product_tag-envelope product_tag-fax-paper last instock purchasable product-type-simple">
                    <div class="woocommerce-LoopProduct-link">
                        <div class="nz-thumbnail">
                            <img width="383" height="440" src="http://astritbublaku.com/demos/montserrat/upload/product12-383x440.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="product12" title="product12"  /> <img class="hover-img" src="http://astritbublaku.com/demos/montserrat/upload/product10.jpg" alt="Creative vcards"> </div>
                        <div class="product-details">
                            <h3>Creative vcards</h3>
                            <span class="price"><span class="star-rating" title="Rated 4 out of 5"><span id="span_12e6_11"><strong class="rating">4</strong> out of 5</span></span><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&pound;</span>5.99</span>
                        </span>
                    </div>
                    <div class="cart-wrap nz-clearfix">
                        <a rel="nofollow" href="#" data-quantity="1" data-product_id="2523" data-product_sku="" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                        <div class="shop-loader">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                    </div>
                </li>

                </ul>

                <nav class="woocommerce-pagination">
                    <ul class='page-numbers'>
                        <li><span class='page-numbers current'>1</span></li>
                        <li><a class='page-numbers' href='#'>2</a></li>
                        <li><a class="next page-numbers" href="#">&rarr;</a></li>
                    </ul>
                </nav>

                </section>

                </div>
                </div>
                </div>
        
</asp:Content>

