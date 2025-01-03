Product.where(name: 'Headphones').destroy_all
Product.where(name: 'Laptop').destroy_all
Product.where(name: 'Smartphones').destroy_all


Product.create(name: "Laptop", description: "A powerful laptop", price: 1000.00)
Product.create(name: "Smartphone", description: "A latest model smartphone", price: 500.00)
Product.create(name: "Headphones", description: "Noise-cancelling headphones", price: 150.00)
Product.create(name: "Smartwatch", description: "Fitness Tracker", price: 150.00)
Product.create(name: "Speakers", description: "Best among all", price: 80.00)
Product.create(name: "Earpods", description: "Noise-cancelling earpods", price: 70.00)
Product.create(name: "Keyboard", description: "For all type of PC and laptops", price: 50.00)
