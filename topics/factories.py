import factory


class ActionFactory(factory.DjangoModelFactory):

    class Meta:
        model = "topics.Action"


class TopicFactory(factory.DjangoModelFactory):

    title = factory.Sequence(lambda n: "title-{0}".format(n))

    class Meta:
        model = "topics.Topic"
