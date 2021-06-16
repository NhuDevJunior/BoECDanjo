$(document).ready(function () {
  // Init product category
  let url = `/${window.location.pathname.split("/")[1]}/categories`;
  $.ajax({
    type: "GET",
    url,
    success: function (res) {
      product_categories = JSON.parse(res["product_categories"]);
      result = "";
      for (let item in product_categories) {
        let name =
          product_categories[item]["fields"][
            `name_${window.location.pathname.split("/")[1]}`
          ];
        let url = `product?category=${product_categories[item].pk}`;
        result += `<li><a href="${url}">${name}</a></li>`;
      }
      $(".all-category").html(result);
    },
  });

  // Init shopping cart
  url = `/${window.location.pathname.split("/")[1]}/get-shopping-cart`;
  $.ajax({
    type: "GET",
    url,
    success: function (res) {
      $('.total-cart-span').html(res.total)
    },
  });


  // Handle add to cart of product components
  $(".add-to-card-component-btn").click(function () {
    const data = {
      product_id: $(this).data('id'),
      quantity: 1,
    };

    const url = `/${window.location.pathname.split("/")[1]}/add-product-to-cart`;
    $.ajax({
      url,
      type: "POST",
      headers: {
        "X-CSRFTOKEN": $("[name=csrfmiddlewaretoken]").val(),
      },
      dataType: "json",
      processData: false,
      contentType: "application/json; charset=utf-8",
      data: JSON.stringify(data),
      success: function (data) {
        if (data.success) {
          toastr.success(data.message);
          $('.total-cart-span').html(data.data.total)
        } else {
          toastr.warning(data.message);
        }
      },
    });
  });

  $('.hero__categories__all').on('click', function() {
      $('.hero__categories ul').slideToggle(400);
  });

});
