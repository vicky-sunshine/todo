new Vue({
  el: '#todo-list',
  data: {
    status: false,
    tasks: ['Name', 'Age', 'Address'],
  },
  created: function () {
    this.fetchData();
  },
  methods: {
    fetchData: function () {
      var xhr = new XMLHttpRequest()
      var self = this
      xhr.open('GET', '/api/v1/tasks')
      xhr.onload = function () {
        self.tasks = JSON.parse(xhr.responseText)
      }
      xhr.send()
    },
  },
})
