{ pkgs, ... }: {
  imports = [
    ../../modules/desktop/hyprland.nix
    ../../modules/apps/base.nix
    ../../modules/commands/base.nix
    ../../modules/commands/shell.nix
    ../../modules/commands/library.nix
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ ];
  boot.blacklistedKernelModules = [ ];
}
