# Chat (Rails + Tailwind + Solid Cable)

Real-time chat with Rails 8, Tailwind CSS, REST API, and Action Cable broadcasting with **Solid Cable**.

## Setup

```bash
bundle install
bin/rails db:create db:migrate db:seed
bin/rails tailwindcss:build   # or use bin/dev with tailwind watch mode
bin/rails server
```

Acesse `http://localhost:3000`.

## Estrutura

- **API**
  - `GET /api/participants` – lists participants (JSON)
  - `GET /api/messages` – lists messages (JSON)
  - `POST /api/messages` – creates a message (`participant_id`, `message[body]`); broadcasts in real time

- **Broadcasting**
  - Action Cable em development: adapter `async` (mesmo processo).
  - Production: **Solid Cable** (configured in `config/cable.yml`), no Redis.

- **Front**
  - Layout: header, sidebar (participants), messages area (auto-scroll), footer with input + Send button.
  - Turbo Streams: `turbo_stream_from "chat"` to receive new messages.
  - Stimulus: `chat_form_controller` sends a message via fetch and scrolls to the bottom.

## Tailwind e ERB

Tailwind classes (e.g. `bg-gray-300`) used in ERB views are only included in CSS after running the build. In development:

- **Recommended:** use `bin/dev` — `tailwindcss:watch` recompiles when editing ERB or CSS.
- **If running only with `bin/rails server`:** run `bin/rails tailwindcss:build` after changing classes in any ERB file.

The `app/assets/builds/` directory is gitignored; in a fresh clone, run `bin/rails tailwindcss:build` once to generate `tailwind.css`.

## Useful commands

```bash
bin/rails db:seed              # Creates participants (You, Ana, Bruno, Maria, Pedro)
bin/rails tailwindcss:build    # Compiles CSS (run after changing Tailwind classes)
```
