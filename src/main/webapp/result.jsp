<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>LinkSnap — Your Short URL is Ready</title>
  <meta name="description" content="Your shortened link has been created. Copy and share it instantly." />

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

    <!-- Result card -->
    <div class="card">

      <!-- Success indicator -->
      <div class="success-icon-wrap" aria-hidden="true">✓</div>

      <h1 class="result-headline">Your link is ready!</h1>
      <p class="result-subtext">Copy the short URL below and share it anywhere.</p>

      <!-- Short URL display with copy button -->
      <div class="url-box">
        <a
          id="short-url-display"
          class="url-link"
          href="${shortUrl}"
          target="_blank"
          rel="noopener noreferrer"
          title="${shortUrl}"
        >${shortUrl}</a>
        <button
          class="btn-copy"
          type="button"
          onclick="copyToClipboard('${shortUrl}', this)"
          aria-label="Copy short URL to clipboard"
        >Copy</button>
      </div>

      <!-- Action buttons -->
      <div class="action-row">
        <a
          class="btn btn-secondary"
          href="stats?code=${shortUrl.substring(shortUrl.lastIndexOf('/')+1)}"
        >
          <span aria-hidden="true">📊</span> View Details
        </a>
        <a class="btn btn-ghost" href="index.jsp">
          <span aria-hidden="true">+</span> New URL
        </a>
      </div>

      <div class="divider"></div>

      <!-- Tip -->
      <p style="font-size:0.8rem; color:var(--text-muted); text-align:center;">
        Tip — click the short URL above to test the redirect right now.
      </p>

    </div><!-- /.card -->

    <footer class="page-footer">
      LinkSnap &nbsp;·&nbsp; Built with Java Servlets &amp; JSP
    </footer>

  </div><!-- /.page-wrapper -->

  <script src="js/linksnap.js"></script>
</body>
</html>
