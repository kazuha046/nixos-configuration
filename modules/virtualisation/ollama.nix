{ pkgs, ... }:

{
  services.ollama = {
    enable = true;

    # package = pkgs.ollama-cuda;
    package = pkgs.ollama;

    environmentVariables = {
      LLAMA_ARG_FIT = "off";
      OLLAMA_NUM_GPU = "16";
    };
  };
}
