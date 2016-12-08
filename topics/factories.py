import factory


class TopicFactory(factory.DjangoModelFactory):

    title = factory.Sequence(lambda n: "title-{0}".format(n))

    class Meta:
        model = "topics.Topic"
