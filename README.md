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
```

## Funcionamento

Para início, vamos observar todas nossas rotas executando o comando:

```sh
mix phx.routes
```

Metodo | endpoint   | descrição | valores que podem ser passados para os parametros
-------|--------- | ----------------------- | --------------
GET | / | exibe o texto #JayaCurrencyConverter | 
GET | /api/users | lita todos usuarios | 
POST | /api/users | esse endpoint cria um usuario | `name`
GET | /api/users/:user_id/transactions | lista todas transações de um usuário | `user_id`
POST | /api/users/:user_id/transactions | cria uma transação | `user_id`, `amount`, `currency_from`, `currency_to`

Agora execute o comando para iniciar a aplicação.
```bash
mix phx.server
```

Abaixo, alguns exemplos de chamadas que serão feitas nessa API:

POST `/api/users`

```sh
curl --request POST \
  --url http://localhost:4000/api/users \
  --header 'Content-Type: application/json' \
  --data '{
	"user": {
		"name": "Frank"
	}
}'
```

O código HTTP de retorno deve ser 201 e o corpo esperado na resposta é:

```json
{
  "created_at": "2021-12-24T14:46:52",
  "id": "f4e456d0-78f1-42ba-a3ee-af9440923074",
  "name": "Frank"
}
```

GET `/api/users`

```sh
curl --request GET \
  --url http://localhost:4000/api/users \
  --header 'Content-Type: application/json'
```

O código HTTP de retorno deve ser 200 e o corpo esperado na resposta é:

```json
[
  {
    "created_at": "2021-12-24T14:44:38",
    "id": "e4fd3017-33f8-43e7-98ed-2ed388dcfab0",
    "name": "Frank"
  }
]
```

POST `/api/users/:user_id/transactions`

```sh
curl --request POST \
  --url http://localhost:4000/api/users/0d522e67-3239-4105-a534-df47ac541bf0/transactions \
  --header 'Content-Type: application/json' \
  --data '{
	"transaction": {
		"amount": 12,
		"currency_from": "BRL",
		"currency_to": "USD"
	}
}'
```

O código HTTP de retorno deve ser 201 e o corpo esperado na resposta é:

```json
{
  "amount": "12",
  "amount_to": 2.1142,
  "created_at": "2021-12-24T14:54:10",
  "currency_from": "BRL",
  "currency_to": "USD",
  "id": "bde63d46-f074-4ad1-bba8-2afdc7c8f746",
  "rate": "1.13208",
  "user_id": "0d522e67-3239-4105-a534-df47ac541bf0"
}
```

GET `/api/users/:user_id/transactions`

```sh
curl --request GET \
  --url http://localhost:4000/api/users/ab0f5215-42ca-45b2-a66d-2f8e44537a29/transactions \
  --header 'Content-Type: application/json'
```

O código HTTP de retorno deve ser 200 e o corpo esperado na resposta é:

```json
[
  {
    "amount": "12",
    "amount_to": null,
    "created_at": "2021-12-24T14:59:11",
    "currency_from": "BRL",
    "currency_to": "USD",
    "id": "d29fd494-35eb-42d1-b91b-85257ef2af86",
    "rate": "1.13208",
    "user_id": "ab0f5215-42ca-45b2-a66d-2f8e44537a29"
  }
]
```

## Deploy

A aplicação está no [Gigalixir](https://www.gigalixir.com/) no endereço https://jayacurrencyconverter.gigalixirapp.com. Um dos motivos de utilizar o serviçõ é que não tem sleeps da aplicação no plano free.

## Licença

Copyright (c) 2021, Frank Ferreira.

JayaCurrencyConverter is [MIT licensed](./LICENSE.md)
