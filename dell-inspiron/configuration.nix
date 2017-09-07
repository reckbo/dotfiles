# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  hardware.bluetooth.enable = false;
  #hardware.bluetooth.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search by name, run:
  # nix-env -qaP | grep wget
   nixpkgs.config = {
	   allowUnfree = true;
	   firefox = {
	   #enableGoogleTalkPlugin = true;
		   enableAdobeFlash = true;
	   };
	   #chromium = {
	#	   enablePepperFlash = true;
	#	   enablePepperPDF = true;
	#   };
   };

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };

   environment.systemPackages = with pkgs; [
     wget
     vim
     git
     emacs25
     chromium
     #davmail
     #isync
     html2text
     aspell
     ghc
     stack
     gnumake
     dropbox
     R
     pythonPackages.yapf
     gitAndTools.hub
     pandoc
     #jags
   ];

  fonts = {
    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fontconfig = {
       defaultFonts = { 
          monospace = [ "inconsolata" ];
       };
    };
    fonts = with pkgs; [
     corefonts
     hasklig
     inconsolata
     source-code-pro
     symbola
     ubuntu_font_family
    ];
  };

  # List services that you want to enable:

   virtualisation.docker.enable = true;
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
   services.xserver.enable = true;
   services.xserver.layout = "us";
   #services.xserver.libinput.naturalScrolling = false;
   services.xserver.libinput.enable = true;
   #services.xserver.libinput.middleEmulation = true;
   #services.xserver.libinput.tapping = true;
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;
   services.xserver.desktopManager.plasma5.enable = true;
  # services.xserver.desktopManager.gnome3.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.reckbo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    uid = 1000;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";

}
