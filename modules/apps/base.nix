{ inputs, pkgs, ... }: {
  home-manager.users.vizzion = { ... }: let
    unstable = import inputs.nixpkgs-unstable { inherit (pkgs) system; config.allowUnfree = true; };
  in {
    home.packages = with pkgs; [
      unstable.discord # <- example of making a package unstable
      unstable.kitty
      unstable.nautilus
      unstable.rofi-wayland
      unstable.steam
      unstable.waybar
      unstable.waypaper
      firefox
      brave
      flatpak
      gdm
      macchina
      neovim
      pavucontrol
      spotify
      vscode
      zed-editor
    ];
  };
  services.flatpak.enable = true;
}
