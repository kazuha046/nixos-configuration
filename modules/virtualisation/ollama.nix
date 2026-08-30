{ pkgs, ... }:

{
  services.ollama = {
    enable = true;

    package = pkgs.ollama-cuda;

    environmentVariables = {
      LLAMA_ARG_FIT = "off";
      OLLAMA_NUM_GPU = "16";
    };
  };
}
