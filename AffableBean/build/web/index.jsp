<%--
    Document   : index
    Athor     : VLAD
--%>

<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Russian. --%>
<c:set var='view' value='/index' scope='session' />

<section class="jumbotron text-center">
    <h1 class="jumbotron-heading"><fmt:message key='greeting' /></h1>
    <p class="lead text-muted">
        <fmt:message key='introText' />
    </p>
</section>

<div class="py-5">
    <div class="container">
        <div class="row">
            <c:forEach var="category" items="${categories}">
                <div class="col-lg-3 col-md-6 shadow-sm">
                    <a href="<c:url value='category?${category.id}'/>" >
                        <figure class="card mb-4 shadow-sm">
                            <div class="card mb-4 shadow-sm div-hidden">
                                <img src="${initParam.categoryImagePath}${category.id}.jpg"
                                     alt="<fmt:message key='cat${category.id}'/>" class="card img-hover card-img card-img-sm">
                            </div>
                            <figcaption class="card-body">
                                <span class="card-text text-dark"><fmt:message key='cat${category.id}'/></span>
                            </figcaption>
                        </figure>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>