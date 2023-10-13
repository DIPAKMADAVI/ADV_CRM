#  Pin npm packages by running ./bin/importmap


pin "@rails/importmap", to: "importmap"
pin "application", preload: true

pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.1.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.2/lib/index.js"

pin "feather-icons", to: "https://ga.jspm.io/npm:feather-icons@4.28.0/dist/feather.js"
pin "chart.js", to: "https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.js"

pin "popper", to: 'popper.js', preload: true
pin "bootstrap", to: 'bootstrap.min.js', preload: true
pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js"

pin "stimulus", to: "https://cdn.skypack.dev/stimulus@2.0.0"

# Include a local JavaScript file
pin "application", to: "app/javascript/application.js"
pin "controllers/*", to: "controllers/*"


pin 'stimulus', to: 'stimulus.js'
pin 'trix', to: 'trix.js'
pin_all_from 'app/javascript/packs'

# pin "@hotwired/stimulus", to: "stimulus.3.0.0"
# pin "@hotwired/stimulus-autoloader", to: "stimulus-autoloader.3.0.3"
# pin "controllers/*", to: "controllers/*"
# pin "bootstrap", to: "https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css"
# pin "bootstrap.bundle", to: "https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"
# pin "controllers/customer/index"