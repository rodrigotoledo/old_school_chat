import { Controller } from "@hotwired/stimulus"

// Após enviar (204), limpa o campo da mensagem; a nova mensagem aparece pelo broadcast do model
export default class extends Controller {
  static targets = ["body"]

  clearBodyIfSuccess(event) {
    if (event.detail?.success && this.hasBodyTarget) {
      this.bodyTarget.value = ""
    }
  }
}
