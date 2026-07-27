{
  programs.librewolf = {
    enable = true;

    settings = {
      "browser.startup.page" = 3;
      "browser.sessionstore.restore_on_demand" = true;
      "browser.sessionstore.restore_pinned_tabs_on_demand" = false;

      "browser.search.suggest.enabled" = true;
      "browser.urlbar.suggest.searches" = true;
      "dom.forms.autocomplete.formautofill" = true;
      "signon.autofillForms" = true;
      "signon.rememberSignons" = true;
      "extensions.formautofill.addresses.enabled" = true;
      "extensions.formautofill.creditCards.enabled" = true;

      "privacy.clearOnShutdown_v2.cache" = false;
      "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
      "privacy.sanitize.sanitizeOnShutdown" = false;
      "privacy.history.custom" = true;

      "privacy.resistFingerprinting" = false;
      "privacy.fingerprintingProtection" = true;
      "privacy.query_stripping.enabled" = true;
      "privacy.trackingprotection.enabled" = true;
      "privacy.trackingprotection.socialtracking.enabled" = true;
      "privacy.trackingprotection.emailtracking.enabled" = true;
      "dom.security.https_only_mode_ever_enabled" = true;

      "media.eme.enabled" = true;
      "network.trr.mode" = 0;
      "network.trr.custom_uri" = "https://cloudflare-dns.com/dns-query";
      "network.captive-portal-service.enabled" = false;
      "network.connectivity-service.enabled" = false;
      "network.prefetch-next" = false;

      "browser.theme.content-theme" = 0;
      "browser.theme.toolbar-theme" = 0;
      "layout.css.prefers-color-scheme.content-override" = 0;
      "accessibility.typeaheadfind.flashBar" = 0;
    };
  };
}
