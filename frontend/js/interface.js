/* ========================================
   1. MENU LATERAL
======================================== */

const menuToggle = document.getElementById("menu-toggle");
const menuClose = document.getElementById("menu-close");
const sidebar = document.getElementById("sidebar");

if (menuToggle && menuClose && sidebar) {
    function abrirMenu() {
        sidebar.classList.add("is-open");
        sidebar.setAttribute("aria-hidden", "false");
        menuToggle.setAttribute("aria-expanded", "true");
    }

    function fecharMenu() {
        sidebar.classList.remove("is-open");
        sidebar.setAttribute("aria-hidden", "true");
        menuToggle.setAttribute("aria-expanded", "false");
    }

    menuToggle.addEventListener("click", abrirMenu);
    menuClose.addEventListener("click", fecharMenu);

    // Fecha o menu ao pressionar Esc.
    document.addEventListener("keydown", (evento) => {
        if (evento.key === "Escape") {
            fecharMenu();
        }
    });
}


/* ========================================
   2. ALTERNÂNCIA DE TEMA
======================================== */

const themeToggle = document.getElementById("theme-toggle");

if (themeToggle) {
    themeToggle.addEventListener("click", () => {
        const temaEscuro = document.body.classList.toggle("dark-theme");

        themeToggle.setAttribute("aria-pressed", String(temaEscuro));
        themeToggle.setAttribute(
            "aria-label",
            temaEscuro ? "Ativar tema claro" : "Ativar tema escuro"
        );
    });
}


/* ========================================
   3. NAVBAR DURANTE A ROLAGEM
======================================== */

const header = document.querySelector(".header");

if (header) {
    function atualizarNavbar() {
        header.classList.toggle("scrolled", window.scrollY > 50);
    }

    window.addEventListener("scroll", atualizarNavbar, {
        passive: true
    });

    atualizarNavbar();
}