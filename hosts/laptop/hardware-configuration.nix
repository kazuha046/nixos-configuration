{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/35e2c148-077e-4458-a50e-ec28bdda9897";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6847-D3B5";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/76f66afa-03e3-4cef-a38d-ea78176414ed";
    }
  ];

  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-uuid/cf734364-24de-401f-b1f5-4f1e60f294bc";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
    ];
  };

  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/29c3919c-de95-4d8f-8d45-4130e82b4e38";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
    ];
  };

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
