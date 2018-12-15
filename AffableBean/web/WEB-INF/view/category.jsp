<%--
    Document   : category
    Author     : VLAD
--%>
<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Russian. --%>
<c:set var='view' value='/category' scope='session' />

<section class="jumbotron text-center">
    <div class="container">
        <p>
            <c:forEach var="category" items="${categories}">
                <c:choose>
                    <c:when test="${category.name == selectedCategory.name}">
                        <a href="#" class="btn btn-secondary my-2">
                            <fmt:message key="cat${category.id}"/>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='category?${category.id}'/>" class="btn btn-primary my-2">
                            <fmt:message key="cat${category.id}"/>
                        </a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </p>
    </div>
</section>

<div class="py-5 bg-light">
    <div class="container">
        <div class="row">
            <c:forEach var="product" items="${categoryProducts}" varStatus="iter">
                <div class="col-lg-3 col-md-6 shadow-sm">
                    <figure class="card mb-4 shadow-sm">
                        <a href="<c:url value='product?${product.id}'/>">
                            <div class="card mb-4 shadow-sm div-hidden">
                                <img src="${initParam.productImagePath}${product.id}.jpg" class="img-hover card-img card-img-sm"
                                     alt="${product.name}" >
                            </div>
                        </a>
                        <figcaption class="card-body">
                            <p class="card-text">
                                ${product.name}
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">

                                    <form action="<c:url value='addToCart'/>" method="post" id="addToCart${product.id}" >
                                        <input type="hidden"
                                               name="productId"
                                               value="${product.id}">
                                    </form>
                                    <button type="submit"
                                            name="submit"
                                            form="addToCart${product.id}"
                                            class="btn btn-sm btn-outline-secondary" ><fmt:message key='addToCart'/></button>
                                    <a href="<c:url value='product?${product.id}'/>" class="btn btn-sm btn-outline-secondary"><fmt:message key='info'/></a>
                                </div>
                                <small class="text-muted">
                                    <fmt:formatNumber type="currency" currencySymbol="&euro; " value="${product.price}"/>
                                </small>
                            </div>
                        </figcaption>
                    </figure>
                </div>
            </c:forEach>
        </div>
    </div>
</div>