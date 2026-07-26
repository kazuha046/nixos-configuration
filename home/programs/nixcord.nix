{ config, ... }:

{
  home.file.".config/Equicord/settings/quickCss.css".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/Equicord/themes/noctalia-material.theme.css";

  programs.nixcord = {
    enable = true;

    discord.equicord.enable = true;

    config = {
      useQuickCss = true;
      frameless = true;

      plugins = {
        openInApp.enable = true;
        betterGifPicker.enable = true;
        callTimer.enable = true;
        clearUrls.enable = true;
        fakeNitro.enable = true;
        favoriteEmojiFirst.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        imageZoom.enable = true;
        messageClickActions.enable = true;
        noReplyMention.enable = true;
        platformIndicators.enable = true;
        readAllNotificationsButton.enable = true;
        relationshipNotifier.enable = true;
        serverInfo.enable = true;
        showConnections.enable = true;
        silentTyping.enable = true;
        typingIndicator.enable = true;
        viewIcons.enable = true;
        voiceDownload.enable = true;
        themeAttributes.enable = true;
        colorSighted.enable = true;
        roleColorEverywhere.enable = true;
        memberCount.enable = true;
        serverListIndicators.enable = true;
        betterRoleContext.enable = true;
        betterSettings.enable = true;
        messageLogger.enable = true;
        copyFileContents.enable = true;
        copyEmojiMarkdown.enable = true;
        reverseImageSearch.enable = true;
        voiceMessages.enable = true;
        volumeBooster.enable = true;
        voiceChatDoubleClick.enable = true;
        webScreenShareFixes.enable = true;
        mediaPlaybackSpeed.enable = true;
        permissionsViewer.enable = true;
        whoReacted.enable = true;
        userMessagesPronouns.enable = true;
        copyUserUrls.enable = true;
        reviewDb.enable = true;
        shikiCodeblocks.enable = true;
        crashHandler.enable = true;
        gameActivityToggle.enable = true;
        clientTheme.enable = true;
        customRpc.enable = true;
        betterSessions.enable = true;
        lastFmRichPresence.enable = true;
        showBadgesInChat.enable = true;
        messageLatency.enable = true;

        translatePlus = {
          enable = true;
          target = "ru";
        };
      };
    };
  };
}
