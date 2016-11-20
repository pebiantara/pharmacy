app.factory("Product", function($resource) {
  return $resource("/api/v1/products/:id.json", { id: '@id' }, {
    all:   { method: 'GET', isArray: true, responseType: 'json' },
    update:  { method: 'PUT', responseType: 'json' },
    delete: { method: "DELETE", responseType: 'json'},
    create: { method: "POST", responseType: 'json'},
    show: { method: "GET", responseType: 'json'}
  });
})