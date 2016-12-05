import factory


class LinkFactory(factory.DjangoModelFactory):
    domain = factory.Sequence(lambda n: "http://test{0}.com".format(n))
    preg = factory.Sequence(lambda n: "preg-{0}".format(n))

    class Meta:
        model = "linkfactory.Link"


class LinkTypeFactory(factory.DjangoModelFactory):
    linktype = factory.Sequence(lambda n: "linktype-{0}".format(n))
    link = LinkFactory()

    class Meta:
        model = "linkfactory.LinkType"
