# Old School – iframes + CSS + Rails API

Layout antigo: tabela, iframes, tema em **CSS puro** (`theme.css`). O iframe de mensagens é servido pelo Rails e recarrega sozinho a cada 5 segundos.

## Como usar

1. **Rails** (porta 3000):
   ```bash
   cd chat && bundle install && bin/rails db:seed && bin/rails server
   ```

2. **Abra a raiz do projeto** no navegador:
   - Abrir direto: `index.html` (file://) ou
   - Servir a pasta: `python3 -m http.server 8000` e acesse `http://localhost:8000`

3. O iframe **main** carrega `http://localhost:3000/messages_frame` (mensagens da API). A página do frame tem `<meta http-equiv="refresh" content="5">` → **reload de 5 em 5 segundos**.

4. O formulário no **footer** envia POST para `http://localhost:3000/messages_frame` com `participant_id=1` e `body`. O Rails cria a mensagem e redireciona para a lista; o iframe exibe a resposta (lista atualizada).

## Tema (CSS)

- Cores e layout em **theme.css** (variáveis `:root` e classes).
- Todos os HTML da raiz (index, header, sidebar, main, footer) usam `theme.css` e as mesmas cores.

## Participante "Você"

O form usa `participant_id=1`. O seed cria os participantes na ordem: Você, Ana, Bruno, Maria, Pedro — então "Você" fica com id 1. Se mudar o seed, ajuste o `value` do hidden no `footer.html`.
