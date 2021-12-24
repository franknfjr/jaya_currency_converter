# JayaCurrencyConverter

<img src="https://github.com/franknfjr/jaya_currency_converter/blob/development/assets/jaya_currency_converter.png" width="250" alt="JayaCurrencyConverter">

[![CI](https://github.com/franknfjr/jaya_currency_converter/actions/workflows/ci.yml/badge.svg)](https://github.com/franknfjr/jaya_currency_converter/actions?query=workflow%3ACI)
[![CD](https://github.com/franknfjr/jaya_currency_converter/actions/workflows/cd.yml/badge.svg)](https://github.com/franknfjr/jaya_currency_converter/actions?query=workflow%3ACD)
[![Coverage Status](https://coveralls.io/repos/github/franknfjr/jaya_currency_converter/badge.svg)](https://coveralls.io/github/franknfjr/jaya_currency_converter)

A aplicação conversor de moedas é uma API REST, chamada Jaya Currency Converter, com objetivo de converter valores de uma moeda de origem para uma moeda de destino.

Você pode fazer a conversão nas seguintes moedas:

* Real brasileiro
* Dólar americano
* Euro
* Iene japonês

As moedas serão referidas com o [padrão internacional](https://pt.wikipedia.org/wiki/ISO_4217) para facilitar a explicação.

## Informacoes Tecnicas

O projeto foi criado todo na linguagem [Elixir](https://elixir-lang.org/) utilizando o framwork [Phoenix](https://www.phoenixframework.org/).

Para fazer as taxas de conversão foi utilizado a API do  [Exchangeratesapi.io](https://exchangeratesapi.io/documentation/)

Outras bibliotecas que foram utilizadas:

* [credo](https://github.com/rrrene/credo) para garantir qualidade
* [sobelow](https://github.com/nccgroup/sobelow) para checar as vulnerabilities do projeto
* [excoveralls](https://github.com/parroty/excoveralls) manter a cobertura e relatório de testes
* [tesla](https://github.com/teamon/tesla) cliente HTTP para fazer requisições
* Arquivos [licença](/LICENSE.md) e [changelog](/CHANGELOG.md) como documentação e qualidade de entrega

## Instalação

Execute os seguintes comandos:

```sh
git clone https://github.com/franknfjr/jaya_currency_converter
cd jaya_currency_converter
```

Após entrar no diretório, existe um arquivo `.env.sample` que é obrigatório inserir o valor da API_KEY para carregar em variáveis de ambiente.

Caso você não tenha uma API_KEY, é preciso se registrar no [site](https://manage.exchangeratesapi.io/signup/free)

Altere o arquivo `.env.sample` para `.env`

Execute o seguinte comando:

```sh
source .env
```

Feito isso podemos fazer a compilação e excução da aplicação, executando os seguintes comandos:

```sh
mix deps.get
mix ecto.create && mix ecto.migrate
mix phx.server
```

## TODO

## Deploy

A aplicação está no [Gigalixir](https://www.gigalixir.com/) no endereço https://jayacurrencyconverter.gigalixirapp.com. Um dos motivos de utilizar o serviçõ é que não tem sleeps da aplicação no plano free.

## Licença

Copyright (c) 2021, Frank Ferreira.

JayaCurrencyConverter is [MIT licensed](./LICENSE.md)
