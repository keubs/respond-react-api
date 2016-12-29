from operator import itemgetter as i
from functools import cmp_to_key

from rest_framework_jwt import utils


def user_id_from_token(token):
    user_id = utils.jwt_decode_handler(token)
    user_id = user_id['user_id']

    return user_id


def is_action_owner(topic_owner, action_owner):
    if topic_owner == action_owner:
        return True
    else:
        return False


def multikeysort(items, columns):
    comparers = [
        ((i(col[1:].strip()), -1) if col.startswith('-') else (i(col.strip()), 1))
        for col in columns
    ]

    def comparer(left, right):
        comparer_iter = (
            cmp(fn(left), fn(right)) * mult
            for fn, mult in comparers
        )
        return next((result for result in comparer_iter if result), 0)
    return sorted(items, key=cmp_to_key(comparer))


def cmp(a, b):
    return (a > b) - (a < b)


class Scoring():
    def __init__(self, topic):
        self.topic = topic


# Each upvote counts as 10 points
    def get_topic_score(self):
        return self.topic.rating_likes * 10

# Each action until a topic counts as 5 points
    def get_action_count(self):
        return self.topic.action_set.filter(approved=1).count() * 5

# Each upvote for each action counts as 1 point
    def get_actions_upvotes(self):
        i = 0
        for action in self.topic.action_set.filter(approved=1):
            i = i + action.rating_likes

        return i

    """
     Topic created within 1 day, 10 points
     Topic created within 1 week, 5 points
     Topic created within 1 month, 3 points
     Topic created within 1 year, 1 point
    """
    def get_object_newness():
        pass

    """
     Action created within 1 day, 10 points
     Action created within 1 week, 5 points
     Action created within 1 month, 3 points
     Action created within 1 year, 1 point
    """
    def get_actions_newness_score():
        pass

    # Calculate points for newness of all actions together
    def get_newness_points():
        pass

    # Summated points
    def add_all_points(self):
        return self.get_topic_score() + self.get_action_count() + self.get_actions_upvotes()
