import { Controller } from "@hotwired/stimulus"

// Clicar num participante na sidebar marca o select "Para:" no rodapé
export default class extends Controller {
  static targets = ["select"]

  select(event) {
    const id = String(event.currentTarget.dataset.recipientId ?? "")
    const selectEl = this.hasSelectTarget
      ? this.selectTarget
      : document.getElementById("message_recipient_id")
    if (selectEl) selectEl.value = id
  }
}
