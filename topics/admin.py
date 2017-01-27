from django.contrib import admin

from .models import Topic, Action


class TopicAdmin(admin.ModelAdmin):
    fieldsets = (
        (None, {
            "fields": (
                "address",
                "article_link",
                "description",
                "image",
                "image_url",
                "rating",
                "scope",
                "tags",
                "title",
                "topic_banner",
                "topic_thumbnail",
            )
        }),
        ("Meta", {
            "classes": ("grp-collapse",),
            "fields": ("created_by", "created_on", "id",)
        })
    )
    list_display = ("id", "title", "created_by", "created_on",)
    list_filter = ("scope", "tags",)
    readonly_fields = (
        "created_on", "id", "rating", "topic_banner", "topic_thumbnail")
    search_fields = ("description", "title",)


class ActionAdmin(admin.ModelAdmin):
    fieldsets = (
        (None, {
            "fields": (
                "action_thumbnail",
                "address",
                "approved",
                "article_link",
                "description",
                "end_date_time",
                "image",
                "image_url",
                "rating",
                "respond_react",
                "scope",
                "start_date_time",
                "tags",
                "title",
                "topic",
            )
        }),
        ("Meta", {
            "classes": ("grp-collapse",),
            "fields": (
                "created_by",
                "created_on",
            )
        })
    )
    list_display = (
        "id",
        "title",
        "topic",
        "approved",
        "created_by",
        "created_on",)
    list_filter = ("respond_react", "scope", "tags",)
    readonly_fields = (
        "action_thumbnail",
        "created_by",
        "created_on",
        "id",
        "rating",)
    search_fields = ("description", "title")


admin.site.register(Topic, TopicAdmin)
admin.site.register(Action, ActionAdmin)
