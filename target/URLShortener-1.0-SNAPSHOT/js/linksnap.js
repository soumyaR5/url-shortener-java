/* ============================================================
   LinkSnap — Shared JavaScript
   Handles: copy-to-clipboard, loading state, toast, animations
   ============================================================ */

'use strict';

/* ── Toast Notification ───────────────────────────────────── */
function showToast(message, icon) {
  var existing = document.getElementById('ls-toast');
  if (existing) existing.remove();

  var toast = document.createElement('div');
  toast.id = 'ls-toast';
  toast.className = 'toast';
  toast.innerHTML = '<span>' + (icon || '✓') + '</span><span>' + message + '</span>';
  document.body.appendChild(toast);

  // Trigger show after paint
  requestAnimationFrame(function () {
    requestAnimationFrame(function () {
      toast.classList.add('show');
    });
  });

  // Auto-dismiss after 2.6s
  setTimeout(function () {
    toast.classList.remove('show');
    setTimeout(function () {
      if (toast.parentNode) toast.parentNode.removeChild(toast);
    }, 420);
  }, 2600);
}

/* ── Copy to Clipboard ────────────────────────────────────── */
function copyToClipboard(text, btn) {
  if (!text) return;

  function onSuccess() {
    if (btn) {
      var original = btn.textContent;
      btn.textContent = '✓ Copied!';
      btn.classList.add('copied');
      setTimeout(function () {
        btn.textContent = original;
        btn.classList.remove('copied');
      }, 2200);
    }
    showToast('Link copied to clipboard!', '✓');
  }

  function onError() {
    // Fallback: textarea select trick
    try {
      var ta = document.createElement('textarea');
      ta.value = text;
      ta.style.cssText = 'position:fixed;top:-9999px;left:-9999px;opacity:0;';
      document.body.appendChild(ta);
      ta.focus();
      ta.select();
      document.execCommand('copy');
      document.body.removeChild(ta);
      onSuccess();
    } catch (e) {
      showToast('Press Ctrl+C to copy', '⚠');
    }
  }

  if (navigator.clipboard && window.isSecureContext) {
    navigator.clipboard.writeText(text).then(onSuccess, onError);
  } else {
    onError();
  }
}

/* ── Loading State on Form Submit ─────────────────────────── */
function initFormLoading() {
  var form = document.getElementById('shorten-form');
  var btn  = document.getElementById('submit-btn');
  if (!form || !btn) return;

  form.addEventListener('submit', function (e) {
    var input = form.querySelector('input[name="originalUrl"]');
    if (!input || !input.value.trim()) return;

    // Basic URL sanity check before letting the server validate
    var val = input.value.trim();
    if (!val.startsWith('http://') && !val.startsWith('https://')) {
      // Prepend https:// silently so the server sees a full URL
      input.value = 'https://' + val;
    }

    btn.classList.add('loading');
    var label = btn.querySelector('.btn-label');
    if (label) label.textContent = 'Shortening…';
  });
}

/* ── Auto-select short URL on click ──────────────────────── */
function initUrlSelect() {
  var urlLink = document.getElementById('short-url-display');
  if (!urlLink) return;
  urlLink.addEventListener('click', function (e) {
    if (window.getSelection) {
      var sel = window.getSelection();
      var range = document.createRange();
      range.selectNodeContents(urlLink);
      sel.removeAllRanges();
      sel.addRange(range);
    }
  });
}

/* ── Init ─────────────────────────────────────────────────── */
document.addEventListener('DOMContentLoaded', function () {
  initFormLoading();
  initUrlSelect();
});
