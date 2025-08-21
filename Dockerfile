FROM rocker/tidyverse:4.4
LABEL maintainer="AVH"

RUN Rscript -e "install.packages('pak')"
RUN Rscript -e "pak::pkg_install(c('BiocManager', 'devtools', 'quarto', 'rmarkdown', 'gt', 'heatmaply', 'plotly', 'ggtext', 'reactable', 'crosstalk'))"

WORKDIR /work
RUN R -q -e "library(tidyverse); packageVersion('tidyverse')" && quarto --version

CMD ["bash"]