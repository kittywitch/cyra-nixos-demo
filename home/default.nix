{ ... }: {
  programs.firefox.enable = true;
  programs.vim.enable = true;
  home = {
    username = "kat";
    homeDirectory = "/home/kat";
    stateVersion = "24.05";
  };
}
