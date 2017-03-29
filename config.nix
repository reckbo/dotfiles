
{

  allowUnfree = true;

  packageOverrides = super: let self = super.pkgs; in
  {
    rEnv = super.rWrapper.override {
      packages = with self.rPackages; [
      data_table magrittr xtable
      foreach lintr memoise RSQLite devtools rstan rjags
      # tidyverse
      purrr dplyr modelr stringr lubridate ggplot2 tibble
      stringr hms tidyr readr
      ];
    };
  };

}
