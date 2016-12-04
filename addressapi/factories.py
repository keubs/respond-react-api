import factory


class AddressFactory(factory.DjangoModelFactory):

    formatted = "test"
    latitude = 1.0
    longitude = 1.0
    raw = "test"

    class Meta:
        model = "address.Address"
