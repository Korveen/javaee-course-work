<%-- 
    Document   : product
    Created on : Dec 11, 2018, 10:41:36 PM
    Author     : VLAD
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Russian. --%>
<c:set var='view' value='/product' scope='session' />


<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 shadow-sm">
            <img src="${initParam.productImagePath}${selectedProduct.id}.jpg"
                 alt="${selectedProduct.name}" class="card mb-4 shadow-sm card-img card-img-md">
        </div>
        <div class="col-md-6">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span>${selectedProduct.name}</span>
                <span class="badge badge-secondary badge-pill">
                    <fmt:formatNumber type="currency" currencySymbol="&euro; " value="${selectedProduct.price}"/>
                </span>
            </h4>
            <div>
                <a href="<c:url value='category?${selectedProduct.category.id}'/>" class="btn btn-sm btn-secondary my-2">
                    <fmt:message key="cat${selectedProduct.category.id}"/>
                </a>
            </div>
            <div class="card">
                <div class="card-body  shadow-sm">
                    <p class="card-text text-muted">
                        ${selectedProduct.description}
                    </p>
                </div>
            </div>
            <div class="my-5 text-right">
                <form action="<c:url value='addToCart'/>" method="post" id="addToCart" >
                    <input type="hidden"
                           name="productId"
                           value="${selectedProduct.id}">
                </form>
                <button type="submit"
                        name="submit"
                        form="addToCart"
                        class="btn btn-primary" ><fmt:message key='addToCart'/></button>
            </div>
        </div>
    </div>
</div>
