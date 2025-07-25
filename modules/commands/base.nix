{ inputs, pkgs, ... }: {
  home-manager.users.vizzion = { ... }: let
    unstable = import inputs.nixpkgs-unstable { inherit (pkgs) system; config.allowUnfree = true; };
  in {
    home.packages = with pkgs; [
      unstable.fastfetch # <- example of making a package unstable
      unstable.neofetch
      unstable.starship
      unstable.tty-clock
      git
      cava
      cmatrix
      ffmpeg
      grim
      grimblast
      jp2a
      python3
      swww
      wget
      wl-clipboard
      yazi
      nil
      nixd
    ];
  };
}
