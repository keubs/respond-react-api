import factory


class AddressFactory(factory.DjangoModelFactory):

    formatted = "test"
    latitude = 1.0
    longitude = 1.0
    raw = "test"

    class Meta:
        model = "address.Address"


class CountryFactory(factory.DjangoModelFactory):

    code = factory.Sequence(lambda n: "{0}".format(n))
    name = factory.Sequence(lambda n: "name-{0}".format(n))

    class Meta:
        model = "address.Country"


class StateFactory(factory.DjangoModelFactory):

    code = factory.Sequence(lambda n: "{0}".format(n))
    country = factory.SubFactory(CountryFactory)
    name = factory.Sequence(lambda n: "name-{0}".format(n))

    class Meta:
        model = "address.State"


class LocalityFactory(factory.DjangoModelFactory):

    postal_code = factory.Sequence(lambda n: "postal_code-{0}".format(n))
    name = factory.Sequence(lambda n: "name-{0}".format(n))
    state = factory.SubFactory(StateFactory)

    class Meta:
        model = "address.Locality"
