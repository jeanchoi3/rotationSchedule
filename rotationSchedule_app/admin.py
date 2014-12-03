from django.contrib import admin
from rotationSchedule_app.models import Resident, Year, Track, Program

# Register your models here.
admin.site.register(Resident)
admin.site.register(Year)
admin.site.register(Track)
admin.site.register(Program)

class ResidentAdmin(admin.ModelAdmin):
    list_display = ('name','year','track','in_program')