from rest_framework_jwt import utils
from operator import itemgetter as i
from functools import cmp_to_key
from operator import itemgetter

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