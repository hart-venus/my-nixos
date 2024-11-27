{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "hart";
  home.homeDirectory = "/home/hart";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/hart/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  xdg.desktopEntries = {
    zen = {
      name = "Zen";
      genericName = "Web Browser";
      exec = "appimage-run /home/hart/AppImages/zen.AppImage";
      terminal = false;
      categories = [
        "Network"
        "WebBrowser"
      ];
      mimeType = [
        "text/html"
        "text/xml"
      ];
    };
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.kitty = {
    enable = true;
    font.name = "Cartograph CF";
    font.size = 18;
    settings = {
      background_opacity = "0.85";
      confirm_os_window_close = 0;
      foreground = "#a5979a";
      background = "#242323";
      selection_foreground = "#a5979a";
      selection_background = "#373434";

      cursor = "#e24f32";
      cursor_text_color = "#242323";

      url_color = "#dec9cc";

      active_border_color = "#5a5354";
      inactive_border_color = "#242323";
      bell_border_color = "#674c50";
      visual_bell_color = "none";

      wayland_titlebar_color = "#373434";
      macos_titlebar_color = "#373434";

      active_tab_foreground = "#fbf9f9";
      active_tab_background = "#242323";
      inactive_tab_foreground = "#b9aeac";
      inactive_tab_background = "#373434";
      tab_bar_background = "#373434";
      tab_bar_margin_color = "none";

      mark1_foreground = "#242323";
      mark1_background = "#7d5e63";
      mark2_foreground = "#242323";
      mark2_background = "#978a87";
      mark3_foreground = "#242323";
      mark3_background = "#ea5f43";

      color0 = "#242323";
      color8 = "#766b6c";

      color1 = "#956f76";
      color9 = "#ffa28f";

      color2 = "#f8917c";
      color10 = "#373434";

      color3 = "#ffc8bd";
      color11 = "#5a5354";

      color4 = "#a7868b";
      color12 = "#86797b";

      color5 = "#f8917c";
      color13 = "#dec9cc";

      color6 = "#b89da2";
      color14 = "#f77c64";

      color7 = "#a5979a";
      color15 = "#f0dbdf";
    };
  };
}
