
{

  allowUnfree = true;

  packageOverrides = super: let self = super.pkgs; in
  {
    rEnv = super.rWrapper.override {
      packages = with self.rPackages; [
      data_table ggplot2 dplyr magrittr xtable lubridate rjags
      foreach lintr memoise RSQLite devtools
      ];
    };
  };

}
