from crm.models import Customer, Product

def run():
    Customer.objects.all().delete()
    Product.objects.all().delete()

    c1 = Customer.objects.create(name="Alice", email="alice@example.com", phone="+1234567890")
    c2 = Customer.objects.create(name="Bob", email="bob@example.com", phone="123-456-7890")

    p1 = Product.objects.create(name="Laptop", price=999.99, stock=10)
    p2 = Product.objects.create(name="Mouse", price=49.99, stock=50)

    print("Seeded 2 customers and 2 products")