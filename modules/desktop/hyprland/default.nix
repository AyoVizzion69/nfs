{ ... }: {
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  services.xserver.enable = false;
  services.printing.enable = true;
  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  imports = [
    ./nwg-dock.nix
  ];
}
