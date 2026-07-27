{
  time.timeZone = "Europe/Moscow";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_TIME = "en_GB.UTF-8";
    };

    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
      "en_GB.UTF-8/UTF-8"
    ];

    inputMethod = {
      enable = true;
      type = "ibus";
    };
  };

  services.xserver.xkb = {
    layout = "us,ru";
    options = "caps:none,grp:caps_toggle,compose:ralt";
  };
}
