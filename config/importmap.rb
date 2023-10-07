# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "noty", to: "https://ga.jspm.io/npm:noty@3.2.0-beta-deprecated/lib/noty.js"
pin "@splidejs/splide", to: "https://ga.jspm.io/npm:@splidejs/splide@4.0.1/dist/js/splide.esm.js"
