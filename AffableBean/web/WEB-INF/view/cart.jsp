<%--
    Document   : cart
    Author     : VLAD
--%>
<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Russian. --%>
<c:set var='view' value='/cart' scope='session' />


<div class="container">
    <div class="py-5 text-center yobject-marked">
        <h2><fmt:message key="cart"/></h2>
        <c:choose>
            <c:when test="${cart.numberOfItems == 1}">
                <p><fmt:message key="yourCartContains"/>&nbsp;${cart.numberOfItems}&nbsp;<fmt:message key="item"/>.</p>
            </c:when>
            <c:when test="${cart.numberOfItems == 2 ||
                            cart.numberOfItems == 3 ||
                            cart.numberOfItems == 4}">
                    <p><fmt:message key="yourCartContains"/>&nbsp;${cart.numberOfItems}&nbsp;<fmt:message key="items2-4"/>.</p>
            </c:when>
            <c:when test="${cart.numberOfItems >= 5}">
                <p><fmt:message key="yourCartContains"/>&nbsp;${cart.numberOfItems}&nbsp;<fmt:message key="items" />.</p>
            </c:when>
            <c:otherwise>
                <p><fmt:message key="yourCartEmpty"/></p>
            </c:otherwise>
        </c:choose>
    </div>


    <c:if test="${!empty cart && cart.numberOfItems != 0}">

        <table class="table table-striped">
            <thead  class="thead-dark">
                <tr>
                    <th scope="col"><fmt:message key="product"/></th>
                    <th scope="col"><fmt:message key="name"/></th>
                    <th scope="col"><fmt:message key="price"/></th>
                    <th scope="col"><fmt:message key="quantity"/></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">

                    <c:set var="product" value="${cartItem.product}"/>

                    <tr>
                        <td>
                            <img src="${initParam.productImagePath}${product.id}.jpg" class="card-img card-img-xs"
                                 alt="${product.name}">
                        </td>

                        <td>${product.name}</td>

                        <td>
                            <fmt:formatNumber type="currency" currencySymbol="&euro; " value="${cartItem.total}"/>
                            <br>
                            <span class="smallText">(
                                <fmt:formatNumber type="currency" currencySymbol="&euro; " value="${product.price}"/>
                                / <fmt:message key="unit"/> )</span>
                        </td>

                        <td>
                            <form action="<c:url value='updateCart'/>" method="post">
                                <input type="hidden"
                                       name="productId"
                                       value="${product.id}">
                                <input type="text"
                                       maxlength="2"
                                       size="2"
                                       value="${cartItem.quantity}"
                                       name="quantity"
                                       style="margin:5px">
                                <input type="submit"
                                       name="submit"
                                       class="btn btn-dark"
                                       value="<fmt:message key='update'/>">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="row">
            <h4 class="col-md-4 offset-md-8 text-right"><fmt:message key="subtotal"/>:
                <fmt:formatNumber type="currency" currencySymbol="&euro; " value="${cart.subtotal}"/>
            </h4>
        </div>
    </c:if>

    <div class="row">
        <%-- clear cart widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <div class="col-lg-2 col-md-3 col-sm-4 text-left">

                <c:url var="url" value="viewCart">
                    <c:param name="clear" value="true"/>
                </c:url>

                <a href="${url}" class="btn btn-secondary"><fmt:message key="clearCart"/></a>       
            </div>
        </c:if>
        <div class="col-lg-2 col-md-2 col-sm-4 text-left">
            <%-- continue shopping widget --%>
            <c:set var="value">
                <c:choose>
                    <%-- if 'selectedCategory' session object exists, send user to previously viewed category --%>
                    <c:when test="${!empty selectedCategory}">
                        category
                    </c:when>
                    <%-- otherwise send user to welcome page --%>
                    <c:otherwise>
                        index.jsp
                    </c:otherwise>
                </c:choose>
            </c:set>
            <c:url var="url" value="${value}"/>
            <a href="${url}" class="btn btn-secondary"><fmt:message key="continueShopping"/></a>
        </div>
        <%-- checkout widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <div class="col-lg-2 col-md-2 offset-md-5 offset-lg-6 col-sm-4 text-right">

                <a href="<c:url value='checkout'/>" class="btn btn-primary"><fmt:message key="proceedCheckout"/>
                    <i class="fa fa-arrow-right" aria-hidden="true"></i>
                </a>      
            </div>

        </c:if>
    </div>
</div>
</div>