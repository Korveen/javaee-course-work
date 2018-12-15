<%--
    Document   : confirmation
    Author     : VLAD
--%>


<div class="container">
    <div class="row">
        <div class="col-md-8 offset-md-2 bg-light my-5 rounded">
            <h1 class="jumbotron-heading">Order successful</h1>
            <p class="lead text-muted">
                <strong><fmt:message key="successMessage"/></strong>
                <br><br>
                <fmt:message key="confirmationNumberMessage"/>
                <strong>${orderRecord.confirmationNumber}</strong>
                <br>
                <fmt:message key="contactMessage"/>
                <br><br>
                <fmt:message key="thankYouMessage"/>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" >
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <fmt:message key="orderSummary"/>
            </h4>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col"><fmt:message key="product"/></th>
                        <th scope="col"><fmt:message key="quantity"/></th>
                        <th scope="col"><fmt:message key="price"/></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">
                        <tr>
                            <td>${products[iter.index].name}</td>
                            <td>${orderedProduct.quantity}</td>
                            <td><fmt:formatNumber type="currency" currencySymbol="&euro; "
                                              value="${products[iter.index].price * orderedProduct.quantity}"/></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="2" class="text-right"><strong><fmt:message key="surcharge"/>:</strong></td>
                        <td><fmt:formatNumber type="currency"
                                          currencySymbol="&euro; "
                                          value="${initParam.deliverySurcharge}"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-right"><strong><fmt:message key="total"/>:</strong></td>
                        <td>
                            <strong<fmt:formatNumber type="currency"
                                              currencySymbol="&euro; "
                                              value="${orderRecord.amount}"/>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <strong><fmt:message key="dateProcessed"/>:</strong>
                        <fmt:formatDate value="${orderRecord.dateCreated}"
                                        type="both"
                                        dateStyle="short"
                                        timeStyle="short"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="col-md-6" >
        <h4 class="d-flex justify-content-between align-items-center mb-3">
            <fmt:message key="deliveryAddress"/>
        </h4>
        <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                    <h6 class="my-0"><fmt:message key="customerName"/></h6>
                    <small>${customer.name}</small>
                </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                    <h6 class="my-0"><fmt:message key="address"/></h6>
                    <small>${customer.address}</small>
                </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                    <h6 class="my-0"><fmt:message key="region"/></h6>
                    <small>${customer.cityRegion}</small>
                </div>
            </li>
            <li class="list-group-item d-flex justify-content-between bg-light">
                <div>
                    <h6 class="my-0"><fmt:message key="email"/></h6>
                    <small>${customer.email}</small>
                </div>
            </li>
            <li class="list-group-item d-flex justify-content-between bg-light">
                <div>
                    <h6 class="my-0"><fmt:message key="phone"/></h6>
                    <small>${customer.phone}</small>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="row">
    <a href="/AffableBean/index.jsp" class="btn btn-primary btn-lg btn-block col-md-2 offset-md-5">Home Page
    </a>
</div>

</div>
</div>