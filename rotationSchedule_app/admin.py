from django.contrib import admin
from rotationSchedule_app.models import Resident, Year

# Register your models here.
admin.site.register(Resident)
admin.site.register(Year)

class ResidentAdmin(admin.ModelAdmin):
    list_display = ('name','year','track','in_program')