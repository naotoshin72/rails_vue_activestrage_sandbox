import Vue from 'vue'
var vms = []

var options = {}

const requireContext = require.context('./options', false, /\.js$/)
requireContext.keys().forEach(key => {
  let name = key.split('/').pop().split('.').shift()
  options[name] = requireContext(key).default
})
document.addEventListener('turbolinks:load', () => {
  let templates = document.querySelectorAll('[data-vue]')
  for (let el of templates) {
    let vm = new Vue(
      Object.assign(options[el.dataset.vue], { el })
    )
    vms.push(vm)
  }
})

document.addEventListener('turbolinks:visit', () => {
  for (let vm of vms) {
    vm.$destroy()
  }
  vms = []
})
