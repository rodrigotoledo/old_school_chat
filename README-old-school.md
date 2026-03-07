# Old School – iframes + CSS + Rails API

Classic layout: table, iframes, theme in **pure CSS** (`theme.css`). The messages iframe is served by Rails and reloads itself every 5 seconds.

## How to use

1. **Rails** (porta 3000):
   ```bash
   cd chat && bundle install && bin/rails db:seed && bin/rails server
   ```

2. **Open the project root** in the browser:
   - Open directly: `index.html` (file://), or
   - Serve the folder: `python3 -m http.server 8000` and access `http://localhost:8000`

3. The **main** iframe loads `http://localhost:3000/messages_frame` (messages from the API). The frame page contains `<meta http-equiv="refresh" content="5">` → **reloads every 5 seconds**.

4. The **footer** form sends a POST to `http://localhost:3000/messages_frame` with `participant_id=1` and `body`. Rails creates the message and redirects to the list; the iframe displays the response (updated list).

## Tema (CSS)

- Colors and layout are in **theme.css** (`:root` variables and classes).
- All root HTML files (index, header, sidebar, main, footer) use `theme.css` and the same color palette.

## Participant "You"

The form uses `participant_id=1`. The seed creates participants in this order: You, Ana, Bruno, Maria, Pedro — so "You" stays as id 1. If you change the seed, update the participant id used in `footer.html`.
