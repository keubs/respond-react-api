import random

from django.core.management.base import BaseCommand

from addressapi.factories import CountryFactory, LocalityFactory, StateFactory
from customuser.factories import CustomUserFactory
from linkfactory.factories import LinkFactory, LinkTypeFactory
from topics.factories import ActionFactory, TopicFactory


CA = "CA"
CO = "CO"
US = "US"


class Command(BaseCommand):

    def __init__(self, *args, **kwargs):
        self.countries = {}
        self.links = []
        self.states = {}
        self.topics = []
        self.users = []
        super(Command, self).__init__(*args, **kwargs)

    def handle(self, *args, **kwargs):
        # addressapi
        self._create_countries()
        self._create_states()
        self._create_localities()
        # customuser
        self._create_users()
        # linkfactory
        self._create_links()
        self._create_linktypes()
        # topics
        self._create_topics()
        self._create_actions()

    def _create_actions(self):
        count = 2
        for i in range(count):
            ActionFactory.create(
                topic=random.choice(self.topics), created_by=random.choice(self.users))
        self._report("actions", count)

    def _create_countries(self):
        countries = [(US, "United States"), ("DE", "Germany")]
        for c in countries:
            self.countries[c[0]] = CountryFactory.create(code=c[0], name=c[1])
        self._report("countries", len(countries))

    def _create_links(self):
        links = [
            ("http://change.org", "change/\/\.org"),
            ("http://moveon.org", "moveon/\/\.org")]
        for l in links:
            self.links.append(LinkFactory.create(domain=l[0], preg=l[1]))
        self._report("links", len(links))

    def _create_linktypes(self):
        linktypes = ["Fundraiser", "Petition"]
        for lt in linktypes:
            LinkTypeFactory.create(link=random.choice(self.links), linktype=lt)
        self._report("linktypes", len(linktypes))

    def _create_localities(self):
        localities = [("Denver", "80218", CO), ("San Francisco", "94110", CA)]
        for l in localities:
            LocalityFactory.create(
                postal_code=l[1],
                name=l[0],
                state=self.states[l[2]])
        self._report("localities", len(localities))

    def _create_states(self):
        states = [("CO", "Colorado", US), ("CA", "California", US)]
        for s in states:
            self.states[s[0]] = StateFactory.create(
                code=s[0], country=self.countries[s[2]], name=s[1])
        self._report("states", len(states))

    def _create_topics(self):
        count = 2
        link = "https://test.com"
        for i in range(count):
            self.topics.append(TopicFactory.create(
                article_link=link,
                created_by=random.choice(self.users),
                description="testing",
                image_url=link,
                scope=random.choice(["local", "national", "worldwide"]),
                title="test"))
        self._report("topics", count)

    def _create_users(self):
        users = [("test@test.com", "tester")]
        for u in users:
            self.users.append(CustomUserFactory.create(email=u[0], username=u[1]))
        self._report("users", len(users))

    def _report(self, name, count):
        self.stdout.write("created {0} {1}".format(count, name))
