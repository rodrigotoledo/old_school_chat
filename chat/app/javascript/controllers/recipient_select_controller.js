import { Controller } from "@hotwired/stimulus"

// Clicar num participante na sidebar marca o select "Para:" automaticamente
export default class extends Controller {
  static targets = ["select"]

  select(event) {
    const id = event.currentTarget.dataset.recipientId || ""
    if (this.hasSelectTarget) {
      this.selectTarget.value = id
    }
  }
}
