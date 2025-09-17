// app/javascript/controllers/lightbox_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dialog", "image", "caption"];

  connect() {
    this.triggers = Array.from(
      this.element.querySelectorAll('[data-action~="click->lightbox#open"]')
    );
    this.currentIndex = -1;
    this.wrap = true;

    this._onKeydown = (e) => {
      if (!this.dialogTarget.open) return;
      if (e.key === "ArrowRight") this._next();
      if (e.key === "ArrowLeft") this._prev();
      if (e.key === "Escape") this.close();
    };
    document.addEventListener("keydown", this._onKeydown);

    this.dialogTarget.addEventListener("click", (e) => {
      const r = this.dialogTarget.getBoundingClientRect();
      const outside =
        e.clientX < r.left ||
        e.clientX > r.right ||
        e.clientY < r.top ||
        e.clientY > r.bottom;
      if (outside) this.close();
    });

    this._touchStartX = null;
    this.dialogTarget.addEventListener(
      "touchstart",
      (e) => {
        this._touchStartX = e.touches[0].clientX;
      },
      { passive: true }
    );
    this.dialogTarget.addEventListener("touchend", (e) => {
      if (this._touchStartX == null) return;
      const dx = e.changedTouches[0].clientX - this._touchStartX;
      this._touchStartX = null;
      const threshold = 40;
      if (dx < -threshold) this._next();
      if (dx > threshold) this._prev();
    });

    document.addEventListener("turbo:before-cache", () => {
      if (this.hasDialogTarget && this.dialogTarget.open)
        this.dialogTarget.close();
    });
  }

  disconnect() {
    document.removeEventListener("keydown", this._onKeydown);
  }

  open(e) {
    e.preventDefault();
    const t = e.currentTarget;
    this.currentIndex = this.triggers.indexOf(t);
    this._showFromTrigger(t);
    if (this.dialogTarget.showModal) this.dialogTarget.showModal();
    else this.dialogTarget.setAttribute("open", "");
  }

  close() {
    this.dialogTarget.close();
  }

  // 💡 Action handlers (wired via data-action)
  next(_e) {
    this._next();
  }
  prev(_e) {
    this._prev();
  }

  // Internal nav methods
  _next() {
    if (!this.triggers.length) return;
    let i = this.currentIndex + 1;
    if (i >= this.triggers.length) i = this.wrap ? 0 : this.currentIndex;
    if (i !== this.currentIndex) {
      this.currentIndex = i;
      this._showFromTrigger(this.triggers[i]);
    }
  }

  _prev() {
    if (!this.triggers.length) return;
    let i = this.currentIndex - 1;
    if (i < 0) i = this.wrap ? this.triggers.length - 1 : this.currentIndex;
    if (i !== this.currentIndex) {
      this.currentIndex = i;
      this._showFromTrigger(this.triggers[i]);
    }
  }

  _showFromTrigger(trigger) {
    const src = trigger.dataset.lightboxSrc || trigger.getAttribute("href");
    const alt =
      trigger.dataset.lightboxAlt || trigger.querySelector("img")?.alt || "";
    const caption = trigger.dataset.lightboxCaption || "";
    this.imageTarget.src = src;
    this.imageTarget.alt = alt;
    this.captionTarget.textContent = caption;

    // optional preload next
    const neighbor = this.triggers[this._wrapIndex(this.currentIndex + 1)];
    if (neighbor) {
      const nsrc =
        neighbor.dataset.lightboxSrc || neighbor.getAttribute("href");
      if (nsrc) {
        const img = new Image();
        img.src = nsrc;
      }
    }
  }

  _wrapIndex(i) {
    if (!this.wrap) return Math.max(0, Math.min(i, this.triggers.length - 1));
    const n = this.triggers.length;
    return ((i % n) + n) % n;
  }
}
