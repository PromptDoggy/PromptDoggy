// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

import Dialog from "@stimulus-components/dialog"
import Dropdown from "@stimulus-components/dropdown"
import Clipboard from "@stimulus-components/clipboard"
import TextareaAutogrow from "stimulus-textarea-autogrow"
application.register('dialog', Dialog)
application.register('dropdown', Dropdown)
application.register('clipboard', Clipboard)
application.register('textarea-autogrow', TextareaAutogrow)
