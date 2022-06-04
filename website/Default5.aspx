<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
</head>
<body>
     <form id="form1" method="post" action="RazorpayCallBack.aspx">
    <div>
    <button id="rzp-button1" hidden>Pay</button>
      <button type="submit" id="rzp-paymentresponse" class="btn btn-primary" hidden>Submit</button>
    <input id="rzp_paymentid" type="hidden" />
    <input id="rzp_orderid" type="hidden" />
        <input id="rzp_signature" type="hidden" />
      <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
     <script>
   
var options = {
    "key":"<%=key %>", // Enter the Key ID generated from the Dashboard
    "amount": <%= amount %>, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "<%=name %>",
    "description":" <%= desc %>",
    "image": "https://example.com/your_logo", // You can give your logo url
    "order_id": "<%= orderId %>", 
    "handler": function (response){
        // After payment successfully made response will come here
        // Set the data in hidden form
        document.getElementById('rzp_paymentid').value = response.razorpay_payment_id;
        document.getElementById('rzp_orderid').value = response.razorpay_order_id;
        document.getElementById('rzp_signature').value=response.razorpay_signature;
        // alert(response.razorpay_signature);
        window.location.href="RazorpayCallBack.aspx?pi='"+response.razorpay_payment_id+"'&oi='"+response.razorpay_order_id+"'&sgn='"+response.razorpay_signature+"'";

         //$.ajax({
         //           type: "POST",
         //           url: "Default5.aspx/updPay",
         //           data: "{'payId':'" + response.razorpay_payment_id + "','ordId':'" + response.razorpay_order_id + "','signt':'" + response.razorpay_signature + "'}",
         //           contentType: "application/json; charset=utf-8",
         //           dataType: "json",
         //           success: function (msg) { 
                        
                       
         //           },
         //           error: function (data) {
         //               alert('Something Went Wrong')
         //           }
         //       });
       // alert(response.razorpay_payment_id);
        // // Let's submit the form automatically
        //document.getElementById('rzp-paymentresponse').click();
       // window.location.href="RazorpayCallBack.aspx";
    },
    "prefill": {
        "name": "<%= name %>",
        "email":"<%= email %>",
        "contact": "<%= contact %>"
    },
    "notes": {
        "address": "<%= addr %>"
    },
    "theme": {
        "color": "#F37254"
    }
};
var rzp1 = new Razorpay(options);


window.onload = function(){
   
    document.getElementById('rzp-button1').click();
};

document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
    e.preventDefault();
}

    

</script>
   
    
    </div>
    </form>
   
</body>
</html>
