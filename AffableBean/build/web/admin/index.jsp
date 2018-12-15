<%--
 * author: VLAD
--%>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <a class="btn btn-primary" href="<c:url value='viewProducts'/>">view all products</a>
        </div>
        <div class="col-md-3">
            <a class="btn btn-primary" href="<c:url value='viewCustomers'/>">view all customers</a>
        </div>
        <div class="col-md-2">
            <a class="btn btn-primary" href="<c:url value='viewOrders'/>">view all orders</a>
        </div>

        <div class="col-md-2 offset-md-2">
            <a class="btn btn-secondary" href="<c:url value='logout'/>">log out</a>
        </div>
    </div>

    <%-- productList is requested --%>
    <c:if test="${!empty productList}">
        <div class="text-left mt-5 mb-2">
            <h4 class="mb-3 ">Products</h4>
            <!--<a class="btn btn-success text-white">Add new product</a>-->
        </div>
        <table class="table table-hover table-striped table-bordered">
            <thead class="thead-dark">
                <tr >
                    <th scope="col">Product id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>       
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody >
                <c:forEach var="product" items="${productList}" varStatus="iter">
                    <tr>
                        <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.price}</a></td>
                        <td>${product.getCategory().name}</td>
                        <td>
                            <a class="btn btn-warning"><i class="far fa-edit text-white"></i></a>
                            <a class="btn btn-danger"><i class="fas fa-trash text-white"></i></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <%-- customerList is requested --%>
    <c:if test="${!empty customerList}">
        <h4 class="mb-3 mt-5 text-left">Customers</h4>
        <table class="table table-hover table-striped table-bordered">
            <thead class="thead-dark">
                <tr >
                    <th scope="col">Customer id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone</th>
                </tr>
            </thead>
            <tbody >
                <c:forEach var="customer" items="${customerList}" varStatus="iter">
                    <tr onclick="document.location.href = 'customerRecord?${customer.id}'">
                        <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                        <td><a  class="text-dark"  href="customerRecord?${customer.id}" >${customer.id}</a></td>
                        <td><a  class="text-dark"  href="customerRecord?${customer.id}" >${customer.name}</a></td>
                        <td><a  class="text-dark"  href="customerRecord?${customer.id}" >${customer.email}</a></td>
                        <td><a  class="text-dark"  href="customerRecord?${customer.id}" >${customer.phone}</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <%-- orderList is requested --%>
    <c:if test="${!empty orderList}">
        <h4 class="mb-3 mt-5 text-left">Orders</h4>
        <table class="table table-hover table-striped table-bordered">
            <thead class="thead-dark">
                <tr >
                    <th scope="col">Order id</th>
                    <th scope="col">Confirmation number</th>
                    <th scope="col">Amount</th>
                    <th scope="col">Date created</th>
                </tr>
            </thead>
            <tbody >
                <c:forEach var="order" items="${orderList}" varStatus="iter">
                    <tr onclick="document.location.href = 'orderRecord?${order.id}'">
                        <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                        <td><a  class="text-dark"  href="orderRecord?${order.id}" >${order.id}</a></td>
                        <td><a  class="text-dark"  href="orderRecord?${order.id}" >${order.confirmationNumber}</a></td>
                        <td><a  class="text-dark"  href="orderRecord?${order.id}" >
                                <fmt:formatNumber type="currency"
                                                  currencySymbol="&euro; "
                                                  value="${order.amount}"/></a></td>
                        <td><a  class="text-dark"  href="orderRecord?${order.id}" >
                                <fmt:formatDate value="${order.dateCreated}"
                                                type="both"
                                                dateStyle="short"
                                                timeStyle="short"/></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <%-- customerRecord is requested --%>
    <c:if test="${!empty customerRecord}">
        <h4 class="mb-3 mt-5 text-left">Customer details</h4>
        <table class="table table-hover table-striped table-bordered">
            <tbody>
                <tr>
                    <td><strong>customer id:</strong></td>
                    <td>${customerRecord.id}</td>
                </tr>
                <tr>
                    <td><strong>name:</strong></td>
                    <td>${customerRecord.name}</td>
                </tr>
                <tr>
                    <td><strong>email:</strong></td>
                    <td>${customerRecord.email}</td>
                </tr>
                <tr>
                    <td><strong>phone:</strong></td>
                    <td>${customerRecord.phone}</td>
                </tr>
                <tr>
                    <td><strong>address:</strong></td>
                    <td>${customerRecord.address}</td>
                </tr>
                <tr>
                    <td><strong>city region:</strong></td>
                    <td>${customerRecord.cityRegion}</td>
                </tr>
                <tr>
                    <td><strong>credit card number:</strong></td>
                    <td>${customerRecord.ccNumber}</td>
                </tr>
                <tr onclick="document.location.href = 'orderRecord?${order.id}'">
                    <td class="bg-primary" colspan="2">
                        <%-- Anchor tag is provided in case JavaScript is disabled --%>
                        <a class="text-white" href="orderRecord?${order.id}">
                            <strong>View order summary <i class="fa fa-arrow-right" aria-hidden="true"></strong></a></td>
                </tr>
            </tbody>
        </table>

    </c:if>

    <%-- orderRecord is requested --%>
    <c:if test="${!empty orderRecord}">
        <h4 class="mb-3 mt-5 text-left">Order summary</h4>
        <table class="table table-hover table-striped table-bordered">
            <tbody >
                <tr>
                    <td colspan="2"><strong>Order id:</strong></td>
                    <td>${orderRecord.id}</td>
                </tr>
                <tr>
                    <td colspan="2"><strong>Confirmation number:</strong></td>
                    <td>${orderRecord.confirmationNumber}</td>
                </tr>
                <tr>
                    <td colspan="2"><strong>Date processed:</strong></td>
                    <td>
                        <fmt:formatDate value="${orderRecord.dateCreated}"
                                        type="both"
                                        dateStyle="short"
                                        timeStyle="short"/></td>
                </tr>
                <tr class="bg-dark text-white">
                    <td>Product</td>
                    <td>Quantity</td>
                    <td>Price</td>
                </tr>

                <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">
                    <tr>
                        <td>
                            ${products[iter.index].name}
                        </td>
                        <td>
                            ${orderedProduct.quantity}
                        </td>
                        <td class="confirmationPriceColumn">
                            <fmt:formatNumber type="currency" currencySymbol="&euro; "
                                              value="${products[iter.index].price * orderedProduct.quantity}"/>
                        </td>
                    </tr>

                </c:forEach>
                <tr>
                    <td colspan="2" class="text-right"><strong>Delivery surcharge:</strong></td>
                    <td>
                        <fmt:formatNumber type="currency"
                                          currencySymbol="&euro; "
                                          value="${initParam.deliverySurcharge}"/></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-right"><strong>total amount:</strong></td>
                    <td><strong>
                            <fmt:formatNumber type="currency"
                                              currencySymbol="&euro; "
                                              value="${orderRecord.amount}"/></strong></td>
                </tr>
                <tr onclick="document.location.href = 'customerRecord?${customer.id}'">
                    <td colspan="3" class="bg-primary">
                        <%-- Anchor tag is provided in case JavaScript is disabled --%>
                        <a class="text-white" href="customerRecord?${customer.id}">
                            <strong>view customer details <i class="fa fa-arrow-right" aria-hidden="true"></strong></a></td>
                </tr>

            </tbody>
        </table>
    </c:if>
</div>