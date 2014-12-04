from django.contrib import admin
from rotationSchedule_app.models import Resident, Year, Track, Program, Rotation

# Register your models here.
admin.site.register(Resident)
admin.site.register(Year)
admin.site.register(Track)
admin.site.register(Program)
admin.site.register(Rotation)

class ResidentAdmin(admin.ModelAdmin):
    list_display = ('name','year','track','in_program')