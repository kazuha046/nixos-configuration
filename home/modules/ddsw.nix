{
  services.dynamic-drpc-wayland = {
    enable = true;

    classes = {
      telegram = {
        match = "com.ayugram.desktop";

        state = "Using Telegram";
        details = "Chatting with friends";
        small_text = "Telegram Desktop";
      };
    };
  };
}
