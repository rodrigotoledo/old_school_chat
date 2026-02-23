// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Rolagem ao fim quando chega nova mensagem (Turbo Stream append em #messages)
document.addEventListener("turbo:before-stream-render", (event) => {
  const stream = event.detail?.newStream
  if (stream?.getAttribute?.("target") === "messages") {
    requestAnimationFrame(() => {
      requestAnimationFrame(() => {
        const el = document.getElementById("messages")
        if (el) el.scrollTop = el.scrollHeight
      })
    })
  }
})
