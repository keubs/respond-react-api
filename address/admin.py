from django.contrib import admin

from .models import Address, Country, Locality, State


class AddressAdmin(admin.ModelAdmin):
    fieldsets = (
        (None, {
            "fields": (
                "formatted",
                "latitude",
                "locality",
                "longitude",
                "raw",
                "route",
                "street_number",
            )
        }),
        ("Meta", {
            "classes": ("grp-collapse",),
            "fields": ("id",)
        })
    )
    list_display = ("id", "formatted",)
    list_filter = ()
    readonly_fields = (
        "id",)
    search_fields = ("street_number", "route", "raw", "formatted",)


class CountryAdmin(admin.ModelAdmin):
    fieldsets = (
        (None, {
            "fields": (
                "code",
                "name",
            )
        }),
        ("Meta", {
            "classes": ("grp-collapse",),
            "fields": ("id",)
        })
    )
    list_display = ("id", "name", "code",)
    list_filter = ()
    readonly_fields = (
        "id",)
    search_fields = ("code", "name",)


class LocalityAdmin(admin.ModelAdmin):
    fieldsets = (
        (None, {
            "fields": (
                "name",
                "postal_code",
                "state",
            )
        }),
        ("Meta", {
            "classes": ("grp-collapse",),
            "fields": ("id",)
        })
    )
    list_display = ("id", "name", "state", "postal_code",)
    list_filter = ("state",)
    readonly_fields = (
        "id",)
    search_fields = ("name", "postal_code",)


class StateAdmin(admin.ModelAdmin):
    fieldsets = (
        (None, {
            "fields": (
                "code",
                "country",
                "name",
            )
        }),
        ("Meta", {
            "classes": ("grp-collapse",),
            "fields": ()
        })
    )
    list_display = ("id", "name", "code", "country",)
    list_filter = ("country",)
    readonly_fields = (
        "id",)
    search_fields = ("name", "code",)


admin.site.register(Address, AddressAdmin)
admin.site.register(Country, CountryAdmin)
admin.site.register(Locality, LocalityAdmin)
admin.site.register(State, StateAdmin)
