# Chat (Rails + Tailwind + Solid Cable)

Chat em tempo real com Rails 8, Tailwind CSS, API REST e broadcasting via Action Cable com **Solid Cable**.

## Setup

```bash
bundle install
bin/rails db:create db:migrate db:seed
bin/rails tailwindcss:build   # ou use bin/dev se tiver tailwind em watch
bin/rails server
```

Acesse `http://localhost:3000`.

## Estrutura

- **API**
  - `GET /api/participants` – lista participantes (JSON)
  - `GET /api/messages` – lista mensagens (JSON)
  - `POST /api/messages` – cria mensagem (participant_id, message[body]); faz broadcast em tempo real

- **Broadcasting**
  - Action Cable em development: adapter `async` (mesmo processo).
  - Produção: **Solid Cable** (configurado em `config/cable.yml`), sem Redis.

- **Front**
  - Layout: header, sidebar (participantes), área de mensagens (rolagem automática), rodapé com input + botão Enviar.
  - Turbo Streams: `turbo_stream_from "chat"` para receber novas mensagens.
  - Stimulus: `chat_form_controller` envia mensagem via fetch e rola até o fim.

## Tailwind e ERB

As classes Tailwind (ex.: `bg-gray-300`) usadas em views ERB só entram no CSS se o build for executado. Em desenvolvimento:

- **Recomendado:** use `bin/dev` — o `tailwindcss:watch` recompila ao editar ERB ou CSS.
- **Se subir só com `bin/rails server`:** rode `bin/rails tailwindcss:build` depois de mudar classes em qualquer ERB.

O diretório `app/assets/builds/` é gitignored; em clone novo, rode `bin/rails tailwindcss:build` uma vez para gerar `tailwind.css`.

## Comandos úteis

```bash
bin/rails db:seed              # Cria participantes (Você, Ana, Bruno, Maria, Pedro)
bin/rails tailwindcss:build    # Compila CSS (rode após mudar classes Tailwind)
```
