<%--
    Document   : checkout
    Author     : VLAD
--%>
<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Russian. --%>
<c:set var='view' value='/checkout' scope='session' />

<script src="js/jquery.validate.js" type="text/javascript"></script>

<script type="text/javascript">

    $(document).ready(function () {
        $("#checkoutForm").validate({
            rules: {
                name: "required",
                email: {
                    required: true,
                    email: true
                },
                phone: {
                    required: true,
                    number: true,
                    minlength: 9
                },
                address: {
                    required: true
                },
                creditcard: {
                    required: true,
                    creditcard: true
                }
            }
        });
    });
</script>
<div class="container">
    <div class="py-5 text-center yobject-marked">
        <h2><fmt:message key="checkout"/></h2>
        <p class="lead"><fmt:message key="checkoutText"/></p>
    </div>
    <div class="row">

        <c:if test="${!empty orderFailureFlag}">
            <p class="error"><fmt:message key="orderFailureError"/></p>
        </c:if>
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3"><fmt:message key="billing"/></h4>
            <form  action="<c:url value='purchase'/>" method="post" id="checkoutForm">
                <c:if test="${!empty validationErrorFlag}">
                    <span class="error smallText"><fmt:message key="validationErrorMessage"/>:

                        <c:if test="${!empty nameError}">
                            <br><span class="indent"><fmt:message key="nameError"/>
                            </c:if>
                            <c:if test="${!empty emailError}">
                                <br><span class="indent"><fmt:message key="emailError"/>
                                </c:if>
                                <c:if test="${!empty phoneError}">
                                    <br><span class="indent"><fmt:message key="phoneError"/>
                                    </c:if>
                                    <c:if test="${!empty addressError}">
                                        <br><span class="indent"><fmt:message key="addressError"/>
                                        </c:if>
                                        <c:if test="${!empty cityRegionError}">
                                            <br><span class="indent"><fmt:message key="cityRegionError"/>
                                            </c:if>
                                            <c:if test="${!empty ccNumberError}">
                                                <br><span class="indent"><fmt:message key="ccNumberError"/>
                                                </c:if>
                                            </span>
                                        </c:if>
                                        <div class="mb-3">
                                            <label for="name"><fmt:message key="customerName"/>:</label>
                                            <input required class="form-control" type="text" size="31" maxlength="45" id="name" name="name" value="${param.name}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="email"><fmt:message key="email"/>:</label>
                                            <input required class="form-control" type="text" size="31" maxlength="45" id="email" name="email" value="${param.email}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="phone"><fmt:message key="phone"/>:</label>
                                            <input required class="form-control" type="text" size="31" maxlength="16" id="phone" name="phone" value="${param.email}">
                                        </div>
                                        <div class="row">
                                            <div class="col-md-8 mb-3">
                                                <label for="address"><fmt:message key="address"/>:</label>
                                                <input required class="form-control" type="text" size="31" maxlength="45" id="address" name="address" value="${param.address}">
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label><fmt:message key="region"/></label>
                                                <select name="cityRegion" class="custom-select d-block w-100">
                                                    <option value="1" selected>Minsk</option>
                                                    <option value="2">Grodno</option>
                                                    <option value="3">Vitebsk</option>
                                                    <option value="4">Mogilev</option>
                                                    <option value="5">Brest</option>                                  
                                                    <option value="6">Gomel</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="creditcard"><fmt:message key="creditCard"/>:</label>
                                            <input required class="form-control" type="text" size="31" maxlength="19" id="creditcard" name="creditcard" value="${param.creditcard}">
                                        </div>
                                        <button class="btn btn-primary btn-lg btn-block" type="submit"><fmt:message key='submit'/></button>
                                        </form>
                                        </div>
                                        <div class="col-md-4 order-md-2 mb-4">
                                            <ul class="list-group mb-3">
                                                <li class="list-group-item d-flex justify-content-between lh-condensed"><fmt:message key="nextDayGuarantee"/></li>
                                                <li class="list-group-item d-flex justify-content-between lh-condensed"><fmt:message key="deliveryFee1"/>&nbsp;
                                                    <fmt:formatNumber type="currency" currencySymbol="&euro; " value="${initParam.deliverySurcharge}"/>&nbsp;
                                                    <fmt:message key="deliveryFee2"/></li>
                                            </ul>

                                            <ul class="list-group mb-3">
                                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                                    <div>
                                                        <h6 class="my-0"><fmt:message key="subtotal"/></h6>
                                                    </div>
                                                    <span class="text-muted"><fmt:formatNumber type="currency" currencySymbol="&euro; " value="${cart.subtotal}"/></span>
                                                </li>
                                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                                    <div>
                                                        <h6 class="my-0"><fmt:message key="surcharge"/></h6>
                                                    </div>
                                                    <span class="text-muted"><fmt:formatNumber type="currency" currencySymbol="&euro; " value="${initParam.deliverySurcharge}"/></span>
                                                </li>
                                                <li class="list-group-item d-flex justify-content-between">
                                                    <span><fmt:message key="total"/></span>
                                                    <strong><fmt:formatNumber type="currency" currencySymbol="&euro; " value="${cart.total}"/></strong>
                                                </li>
                                            </ul>
                                        </div>
                                        </div>
                                        </div>