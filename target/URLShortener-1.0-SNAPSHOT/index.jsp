<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>LinkSnap — Shorten &amp; Share Links Instantly</title>
  <meta name="description" content="LinkSnap — a fast, modern URL shortener. Paste a long link and get a clean short URL in seconds." />

  <!-- Favicon (inline SVG as data URI) -->
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

    <!-- Brand -->
    <div class="brand">
      <div class="brand-icon" aria-hidden="true">🔗</div>
      <span class="brand-name">LinkSnap</span>
      <p class="brand-tagline">Shorten and manage links instantly</p>
    </div>

    <!-- Main card -->
    <div class="card">

      <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
      %>
      <div class="alert alert-error" role="alert">
        <span class="alert-icon" aria-hidden="true">⚠</span>
        <span><%= error %></span>
      </div>
      <%
        }
      %>

      <form id="shorten-form" action="shorten" method="post" novalidate>

        <div class="form-group">
          <label class="form-label" for="url-input">Paste your long URL</label>
          <input
            id="url-input"
            class="form-input"
            type="url"
            name="originalUrl"
            placeholder="https://example.com/some/very/long/path"
            autocomplete="off"
            autocorrect="off"
            autocapitalize="none"
            spellcheck="false"
            required
            <%
              /* Re-populate the field value on validation error */
              String prevUrl = request.getParameter("originalUrl");
              if (prevUrl != null && !prevUrl.isEmpty()) {
            %>
            value="<%= prevUrl %>"
            <%
              }
            %>
          />
        </div>

        <button id="submit-btn" class="btn btn-primary" type="submit">
          <span class="btn-label">Generate Short URL</span>
          <span class="spinner" aria-hidden="true"></span>
        </button>

      </form>

      <div class="divider"></div>

      <p style="font-size:0.8rem; color:var(--text-muted); text-align:center; line-height:1.6;">
        Free forever &nbsp;·&nbsp; No login required &nbsp;·&nbsp; Duplicate URLs reuse existing codes
      </p>

    </div><!-- /.card -->

    <footer class="page-footer">
      LinkSnap &nbsp;·&nbsp; Built with Java Servlets &amp; JSP
    </footer>

  </div><!-- /.page-wrapper -->

  <script src="js/linksnap.js"></script>
</body>
</html>
