<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.urlshortner.model.url" %>
<%
  url Url = (url) request.getAttribute("url");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>LinkSnap — Link Details</title>
  <meta name="description" content="View details for your shortened link." />

  <!-- Favicon -->
  <link rel="icon" type="image/svg+xml"
        href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='8' fill='%236366f1'/%3E%3Cpath d='M10 16a6 6 0 0 1 6-6h2a6 6 0 0 1 0 12h-2' stroke='white' stroke-width='2.2' stroke-linecap='round' fill='none'/%3E%3Cpath d='M22 16a6 6 0 0 1-6 6h-2a6 6 0 0 1 0-12h2' stroke='white' stroke-width='2.2' stroke-linecap='round' fill='none' opacity='0.6'/%3E%3C/svg%3E" />

  <link rel="stylesheet" href="css/linksnap.css" />
</head>
<body>

  <!-- Animated background orbs -->
  <div class="orb orb-1" aria-hidden="true"></div>
  <div class="orb orb-2" aria-hidden="true"></div>
  <div class="orb orb-3" aria-hidden="true"></div>

  <div class="page-wrapper">

    <!-- Brand (compact) -->
    <div class="brand">
      <div class="brand-icon" aria-hidden="true">🔗</div>
      <span class="brand-name">LinkSnap</span>
    </div>

    <!-- Details card -->
    <div class="card">

      <%
        if (Url == null) {
      %>
        <!-- Error state: URL not found -->
        <div class="alert alert-error" role="alert">
          <span class="alert-icon" aria-hidden="true">⚠</span>
          <span>Link not found. It may have been removed or the code is invalid.</span>
        </div>
        <a class="btn btn-primary" href="index.jsp">← Back to Home</a>

      <%
        } else {
          /* Build the full short URL from the request context so it matches
             exactly what UrlServlet generates. */
          String contextPath = request.getContextPath();
          String baseUrl = request.getScheme()
              + "://"
              + request.getServerName()
              + ":"
              + request.getServerPort()
              + contextPath;
          String fullShortUrl = baseUrl + "/r/" + Url.getShortCode();
      %>

      <!-- Page header -->
      <div class="page-header">
        <div class="page-badge">
          <span aria-hidden="true">✓</span> Active Link
        </div>
        <h1 class="page-title">Link Details</h1>
        <p class="page-subtitle">All information about your shortened link.</p>
      </div>

      <!-- Original URL card -->
      <div class="info-card">
        <div class="info-label">
          <span class="info-label-icon" aria-hidden="true">🌐</span>
          Original URL
        </div>
        <div class="info-value">
          <a href="<%= Url.getOriginalUrl() %>"
             target="_blank"
             rel="noopener noreferrer"
             title="<%= Url.getOriginalUrl() %>"
          ><%= Url.getOriginalUrl() %></a>
        </div>
      </div>

      <!-- Short Code card -->
      <div class="info-card">
        <div class="info-label">
          <span class="info-label-icon" aria-hidden="true">⚡</span>
          Short Code
        </div>
        <div class="info-value mono"><%= Url.getShortCode() %></div>
      </div>

      <!-- Full Short URL card with copy -->
      <div class="info-card">
        <div class="info-label">
          <span class="info-label-icon" aria-hidden="true">🔗</span>
          Short URL
        </div>
        <div class="short-url-row">
          <div class="info-value mono">
            <a href="<%= fullShortUrl %>"
               target="_blank"
               rel="noopener noreferrer"
            ><%= fullShortUrl %></a>
          </div>
          <button
            class="btn-copy"
            type="button"
            onclick="copyToClipboard('<%= fullShortUrl %>', this)"
            aria-label="Copy short URL to clipboard"
          >Copy</button>
        </div>
      </div>

      <div class="divider"></div>

      <!-- Back button -->
      <a class="btn btn-primary" href="index.jsp">
        <span aria-hidden="true">←</span> Shorten Another URL
      </a>

      <%
        }
      %>

    </div><!-- /.card -->

    <footer class="page-footer">
      LinkSnap &nbsp;·&nbsp; Built with Java Servlets &amp; JSP
    </footer>

  </div><!-- /.page-wrapper -->

  <script src="js/linksnap.js"></script>
</body>
</html>
