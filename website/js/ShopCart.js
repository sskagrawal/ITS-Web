var baseURL = window.location.protocol + "//" + window.location.host + "//";



function ShowAddToCart(PrdID, Qnt, offerPrice, offerPerc, pclr, size, prdPrc, prdMrpPrc, isEggless, eggLessPrc) {
    //alert("hi");
 //alert(window.location.host);   
   

    //if (document.getElementById('cart_num1') != null) {
    //    Qnt = document.getElementById('cart_num1').value;
    //}

   //var sizeId = '';
    //var selImg = document.getElementById('hdfSelImg').value;
   // alert(document.getElementById('hdfSelSize').value);
    var color = '';
    $.ajax({
        type: "POST",
        url: "" + baseURL + "WebMethod/AutoComplete.asmx/Item_Add_To_Cart",
        data: "{'PrdID':'" + PrdID + "','Qnt':'" + Qnt + "','offrPrc':'" + offerPrice + "','offrprcntg':'" + offerPerc + "','PrdColor':'" + pclr + "','PrdSize':'" + size + "','SellPrc':'" + prdPrc + "','MrpPrc':'" + prdMrpPrc + "','isEgLess':'" + isEggless + "','egglessPrc':'" + eggLessPrc + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            if (data.d != "")
            {
                ShopCartItem();
                notify("Successfully Added to Cart, <a href='cart.aspx'>Click Here</a>", 'success', 'bottom', 'right');
                //ShopCartItemApp();

                //FillShopCart();
                //ShowAddedMsg("Product Added Successfully");
            }
            
          //  alert("hi");
          
          
        },
        error: function () {
           
        }
    });

    
    return false;
}
function ShowAddToCartApp(PrdID, Qnt, offerPrice, offerPerc, size, prdPrc, prdMrpPrc, isEggless, eggLessPrc) {
    //alert(window.location.host);   


    //if (document.getElementById('cart_num1') != null) {
    //    Qnt = document.getElementById('cart_num1').value;
    //}

    //var sizeId = '';
    //var selImg = document.getElementById('hdfSelImg').value;
    // alert(document.getElementById('hdfSelSize').value);
    var color = '';
    $.ajax({
        type: "POST",
        url: "" + baseURL + "WebMethod/AutoComplete.asmx/Item_Add_To_Cart",
        data: "{'PrdID':'" + PrdID + "','Qnt':'" + Qnt + "','offrPrc':'" + offerPrice + "','offrprcntg':'" + offerPerc + "','PrdColor':'" + color + "','PrdSize':'" + size + "','SellPrc':'" + prdPrc + "','MrpPrc':'" + prdMrpPrc + "','isEgLess':'" + isEggless + "','egglessPrc':'" + eggLessPrc + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            if (data.d != "") {
                
                
                ShopCartItemApp();

                FillShopCart();
                notify("Successfully Added to Cart, <a href='cart.aspx'>Click Here</a>", 'success', 'bottom', 'right');
                //ShowAddedMsg("Product Added Successfully");
            }

            //  alert("hi");


        },
        error: function () {

        }
    });


    return false;
}
function notify(msg, typ, fa, ali) {
    $.notify({
        title: '',
        icon: '',
        message: msg
    }, {
        type: typ,
        animate: {
            enter: 'animated fadeInUp',
            exit: 'animated fadeOutRight'
        },
        placement: {
            from: fa,
            align: ali
        },
        offset: 20,
        spacing: 10,
        z_index: 1031,
    });
}
function ShowAddToWishList(PrdID) {



    return false;
}


function ShopCartItem() {
    $.ajax({
        type: "POST",
        url: "" + baseURL + "WebMethod/AutoComplete.asmx/ShopCartItem",
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            document.getElementById("cart_num1").innerHTML = data.d;
        },
        error: function () {
            
        }
    });

}

function ShopCartItemApp() {
    $.ajax({
        type: "POST",
        url: "" + baseURL + "WebMethods/AutoComplete.asmx/ShopCartItem",
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            document.getElementById("cart_num1App").innerHTML = data.d;
        },
        error: function () {

        }
    });

}

function WidhListItem() {
    $.ajax({
        type: "POST",
        url: "" + baseURL + "WebMethods/AutoComplete.asmx/WishListItem",
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
        
        },
        error: function () {
            alert("There is problem to call server method");
        }
    });

}

function FillShopCart() {
    $.ajax({
        type: "POST",
        url: "" + baseURL + "WebMethod/AutoComplete.asmx/FillShopCart",
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var imgUrl = "" + baseURL + "/img/icon/cart.png";
          
            var jsondata = $.parseJSON(data.d);
            if (jsondata == "") {
               
               

                //var iconHtml = "<a class='ht-cart-box' href='cart.aspx'><img src='"+imgUrl+"' alt=''><span>1 items - Rs 0</span></a>";


               // document.getElementById("cartView").innerHTML = "0";
             
                //document.getElementById("slidedown-cart").innerHTML = "<ul class='list-unstyled cart-list'><li>Your cart is currently empty!</li></ul>";
                //document.getElementById("slidedown-cart").innerHTML += "<a class='btn' href='javascript:void(0)'>Continue shopping</a></p></div>";


              
            }
            else {
                var TAmount = 0.0;
                var DelCharge = 0.0;
                var qntt = 0;
                
                var htmlString = "<ul class='list-unstyled cart-list'>";
                var count = 0;

                $.each(jsondata, function (index, value) {
                    var prdimgUrl = "" + baseURL + "/Product_image/" + this.Prd_Image;
                    count = parseInt(count) + 1;

                    TAmount = TAmount + (parseFloat(this.SellingPrice) * parseFloat(this.Qnt));
                    
                    htmlString += "<li>";
                    htmlString += "<div class='cart-item'><div class='item-text dish-list-text'>";

                    htmlString += "<h4><a href='#'>" + this.Prd_Name + "</a></h4><p>" + this.prdSize + "</p>";
                    htmlString += "<h5>Qty: " + this.Qnt + " x " + this.SellingPrice + "</h5></div>";
                    htmlString += "<div class='item-img'><a href='#'><img src='" + prdimgUrl + "' alt='" + this.Prd_Name + "' class='img-responsive'></a></div>";
                    htmlString += "<h4 class='total'>Total: <span>" + TAmount + "</span></h4>";

                    htmlString += "<div class='item-close'><a href='javascript:void(0)' onClick='return DeleteShopCartItem(" + this.Prd_ID + ")' title='Remove This Item' class='btn'>";
                    htmlString += "<span><i class='fa fa-times-circle'></i></span></a></div></div></li>";

                    
                    qntt += parseInt(this.Qnt);

                });
                htmlString += "</ul>";
                htmlString += "<div class='cart-info text-right'><h4>Item(s) : <span>"+qntt+"</span></h4>";
                htmlString += "<h4>Total Price: <span>"+TAmount+"</span></h4>";
                htmlString += "<a href='cart.aspx' class='btn btn-black'>View Cart</a>";
                //htmlString += "<a href='checkout.html' class='btn btn-orange'>Checkout</a>";
                
                                
                  
                //document.getElementById("cartView").innerHTML = count;<a href='" + baseURL + "/cart.aspx'><a href='" + baseURL + "/Buyer/checkout.aspx'>
                document.getElementById("slidedown-cart").innerHTML = htmlString;

                
            }

        },
        error: function () {
           
        }
    });
}



function DeleteShopCartItem(PrdID) {
    $.ajax({
        type: "POST",
        url: "" + baseURL + "WebMethod/AutoComplete.asmx/DeleteShopCartItem",
        data: "{'PrdID':'" + PrdID + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function () {
            ShopCartItemApp();
            FillShopCart();
            notify("Item is successfully Deleted,", 'success', 'bottom', 'right');
        },
        error: function () {
            alert("There is problem to call server method");
        }
    });

    return false;
}
function GoToCart() {

    window.location = baseURL + "Registration.aspx";
}
function ShowAddedMsg(val) {
    var x = document.getElementById("snackbar");
    x.innerHTML = val;
    x.className = "show";
    setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
}
