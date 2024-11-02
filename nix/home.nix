{ config, pkgs, ... }:

{
  home.username = "rivaldoe";
  home.homeDirectory = "/home/rivaldoe";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [

    # User Interface and Tools
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    blueman 
    kitty
    waybar
    libnotify
    wezterm
    rofi-wayland
    alacritty
    tmux
    wofi
    brightnessctl
    btop
    fastfetch
    lsd
    zoxide
    starship
    bat
    fd
    fnm
    font-awesome
    hyprshot
    hyprlock
    hypridle
    hyprpaper
    swaynotificationcenter
    pfetch
    tree
    nwg-look
    catppuccin-gtk

    # Development Tools
    vim
    neovim
    zsh
    gcc
    zig
    cargo
    lua
    ripgrep
    fzf

    # Downloading and Version Control
    wget
    git
    unzip
    zip

    (pkgs.nerdfonts.override { fonts = [ "IosevkaTerm" ]; })

    (python3.withPackages (ps: with ps; [
      dbus-python
      pygobject3     # Common dependency for desktop integration
      pycairo        # Often required with pygobject
      pip
      ipython
    ]))

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
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
