def generate():
    objects = []
    for i in range(1, 6):
        objects.append({
            "model": "auth.User",
            "fields": {
                "username": "user_%s" % i,
                "first_name": "User %s Name" % i,
                "is_staff": True,
            },
        })
    return objects