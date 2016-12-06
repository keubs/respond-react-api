import factory


class TopicFactory(factory.DjangoModelFactory):

    class Meta:
        model = "topics.Topic"
