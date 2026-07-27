{ pkgs, ... }:

{
  home.file.".vscode/extensions/mrkir.raiden-theme" = {
    source = ../../assets/vscode/raiden-theme;
    recursive = true;
  };

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;

    profiles.default = {
      keybindings = [
        {
          key = "ctrl+c";
          command = "workbench.action.terminal.copySelection";
          when = "terminalFocus && terminalProcessSupported && terminalTextSelected";
        }
        {
          key = "ctrl+v";
          command = "workbench.action.terminal.paste";
          when = "terminalFocus && terminalProcessSupported";
        }
      ];

      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        ms-dotnettools.csharp
        rust-lang.rust-analyzer
        bradlc.vscode-tailwindcss
        esbenp.prettier-vscode
        dbaeumer.vscode-eslint
        eamodio.gitlens
        arrterian.nix-env-selector
        jnoortheen.nix-ide
        mkhl.direnv
        pkief.material-icon-theme
        ritwickdey.liveserver
        formulahendry.auto-rename-tag
        usernamehw.errorlens
        prisma.prisma
        ms-azuretools.vscode-docker
        vue.volar
        christian-kohler.path-intellisense
      ];

      userSettings = {
        keyboard.dispatch = "keyCode";
        
        chat.commandCenter.enabled = false;

        extensions.ignoreRecommendations = true;

        files = {
          insertFinalNewLine = true;
          autoSave = "afterDelay";
        };

        terminal.integrated = {
          fontFamily = "JetBrainsMono Nerd Font";
          fontSize = 13;
        };

        github.copilot = {
          enable = {
            "*" = false;
          };

          inlineSuggest.enable = false;
        };

        workbench = {
          colorTheme = "Raiden Theme";
          iconTheme = "material-icon-theme";

          tree = {
            indent = 14;

            renderIndentGuides = "none";
          };

          sideBar.location = "right";
          activityBar.location = "hidden";

          layoutControl.enabled = false;
          tips.enabled = false;

          view = {
            explorer = {
              outline.visible = false;
              timeline.visible = false;
            };
          };
        };

        editor = {
          tabSize = 4;

          multiCursorModifier = "ctrlCmd";
          cursorBlinking = "solid";

          fontFamily = "'JetBrains Mono', 'bold', bold";
          fontSize = 22;

          minimap.enabled = false;
          stickyScroll.enabled = true;

          overviewRulerBorder = false;
          detectIndentation = false;
          hideCursorInOverviewRuler = true;

          occurrencesHighlight = "off";
          matchBrackets = "never";
        };

        window = {
          zoomLevel = 1;

          customTitleBarVisibility = "never";
          titleBarStyle = "native";
          menuBarVisibility = "toggle";
        };

        explorer = {
          confirmDelete = false;
          confirmDragAndDrop = false;
          confirmPasteNative = false;
        };

        codeium.enableConfig = {
          "*" = true;
          nix = true;
        };

        nix = {
          enableLanguageServer = true;
          serverPath = "nixd";

          serverSettings = {
            nixd = {
              formatting = {
                command = [ "nixfmt" ];
              };
              options = {
                nixos = {
                  expr = "(builtins.getFlake \"\${workspaceFolder}\").nixosConfigurations.laptop.options";
                };

                home-manager = {
                  expr = "(builtins.getFlake \"\${workspaceFolder}\").homeConfigurations.mrkir.options";
                };
              };
            };
          };
        };

        "[nix]" = {
          editor = {
            tabSize = 2;

            defaultFormatter = "jnoortheen.nix-ide";
            formatOnSave = true;
          };
        };
        "[json]" = {
          editor.tabSize = 2;
        };
        "[jsonc]" = {
          editor.tabSize = 2;
        };
      };
    };
  };
}
