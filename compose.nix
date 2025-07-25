# Core NixOS configuration applied to all profiles
{ ... }: {
  # System version - don't change after initial install
  system.stateVersion = "25.05";

  networking.hostName = "nixos";
  time.timeZone = "America/Chicago";

  # Enable flakes and trust wheel users
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "@wheel" ];
  nixpkgs.config.allowUnfree = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Home Manager setup
  home-manager.backupFileExtension = "hm-backup";
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = false;
  home-manager.users.vizzion = {
    programs.home-manager.enable = true;
    home.stateVersion = "25.05";
  };

  # Main user account
  users.users.vizzion = {
    isNormalUser = true;
    description = "vizzion";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "bluetooth" ];
  };
  services.getty.autologinUser = "vizzion";

  # Enable zram swap and firewall
  services.zram-generator.enable = true;

  networking.firewall.enable = true;
  networking.networkmanager.enable = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  # Nix Auto Run
  environment.sessionVariables.NIX_AUTO_RUN = "1";
}
