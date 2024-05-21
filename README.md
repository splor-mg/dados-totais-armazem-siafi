# dados_totais_armazem_siafi

[![Updated](https://github.com/splor-mg/totais-siafi/actions/workflows/all.yaml/badge.svg)](https://github.com/splor-mg/totais-siafi/actions/)

## Pré-requisitos

Esse projeto utiliza Docker para gerenciamento das dependências. Para fazer _build_  da imagem execute:

```bash
docker build --tag totais-siafi .
```

## Uso

Para executar o container

```bash
docker run -e GMAILR_KEY=$GMAILR_KEY -it --rm --mount type=bind,source=$(PWD),target=/project totais-siafi bash
```

Uma vez dentro do container execute os comandos do make

```bash
make all
```

_Gerado a partir de [cookiecutter-datapackage@f8a4c60](https://github.com/splor-mg/cookiecutter-datapackage/commit/f8a4c60d80401b4dc592f8748fcc0b684822a1b8)_
